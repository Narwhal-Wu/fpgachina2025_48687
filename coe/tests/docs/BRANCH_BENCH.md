# 分支预测基准与外设计时器集成指南

本指南介绍如何使用 `tests/asm/bench_branch_predict.s` 进行分支性能基准测试，并说明如何把一个简易 AHB 计时器外设接入到数据总线以获得周期级别的测量结果。

## 基准内容概览

`bench_branch_predict.s` 包含三类典型分支模式：
- always-taken：循环 `bnez` 回环，几乎每次都命中“跳转”分支
- mostly-not-taken：绝大多数周期不跳，仅最后一次成立
- alternate：条件交替，约一半跳转、一半不跳

程序会：
1. 先进行一小段“预热”循环（为将来接入分支预测做准备）
2. 对每一种模式进行测量（若存在计时器 MMIO），并将进度累计到 `x31`（七段数码管显示）

> 注意：当前 CPU(`tests/rtl/myCPU.sv`) 未实现 CSR `mcycle`，因此推荐使用外设计时器。

## 生成 COE

建议仅对该文件生成 COE：

- Windows PowerShell 示例：
  - 先安装 Python 3 并确保 PATH 可用
  - 安装/准备 RISC-V 工具链（任一前缀均可：`riscv32-unknown-elf-gcc`/`riscv64-unknown-elf-gcc`/`riscv-none-embed-gcc`）
  - 生成本测试的 COE（不影响其他用例）：

```powershell
cd tests
python .\tools\asm2coe.py .\asm\bench_branch_predict.s -o .\output
```

生成成功后，COE 位于 `tests/output/bench_branch_predict.coe`。

## 接入 AHB 计时器外设（可选但强烈推荐）

仓库已提供参考模块：`tests/rtl/AHB_timer.v`，实现了一个 64 位自增计数器，AHB-Lite 从设备。寄存器映射：
- 0x00 CNT_LO  低 32 位（RO）
- 0x04 CNT_HI  高 32 位（RO）
- 0x08 CTRL    写 1 复位计数器（WO）
- 0x0C ID      固定值 `0x54494D52` ('TIMR')（RO）

地址范围建议挂在 `0x4000_0000`，这与 `tests/rtl/AHB_decoder.v` 的从设备 1 范围一致（`0x4000_0000~0x7FFF_FFFF`）。

### 顶层接入示例（伪代码指引）

当前 `tests/rtl/TOP_AI.v` 中，数据总线直接连接到了 BRAM 控制器。要接入多外设，建议改为：

1) 引入 `AHB_interconnect.v`，将数据总线输出与多个从设备（BRAM、Timer）连接：

- CPU 数据侧输出：`HADDR_D/HWRITE_D/HSIZE_D/HBURST_D/HTRANS_D/HMASTLOCK_D/HWDATA_D/HPROT_D`
- Interconnect 输出：`HSEL[1:0]`、合并 `HRDATA/HRESP/HREADY`

2) 将 BRAM 控制器作为从设备 0（地址 0x0000_0000~0x3FFF_FFFF）

3) 将 `AHB_timer` 作为从设备 1（地址 0x4000_0000~0x7FFF_FFFF）

4) 将 Interconnect 的合并响应回接 CPU 数据侧输入 `HRDATA_D/HRESP_D/HREADY_D`（注意顶层 READY 走 HREADYOUT）

关键连线示意：
- `AHB_decoder` 依据 `HADDR_D[31:30]` 选择从设备
- `AHB_multiplexor` 按 `HSEL` 多路选择 `HRDATA/HRESP/HREADYOUT`

计时器端口（`AHB_timer.v`）需要 `HSELx`（来自 decode 后的片选）以及 CPU 发出的总线信号。

> 由于 `AHB_timer` 的响应恒 `OKAY/READY`，无需等待逻辑，适合快速集成与上电验证。

### 软件侧使用（已内置于 bench_branch_predict.s）

- 写 `CTRL`(0x08) bit0=1 复位计数器
- 执行待测循环
- 读 `CNT_HI`→`CNT_LO`→`CNT_HI`，若两次 HI 不一致则重读，保证 64 位稳定

程序会尝试写两个“标记”地址（`0x3000_0000 + {0,4}`），若你在硬件中实现了“写入触发门控/测量”的小模块，便于逻辑分析仪观察时序边界。

## 如何展示性能差异

- 在没有分支预测时：
  - always-taken 循环通常代价更高（每次跳转需要在 EX 阶段解析并重定向，流水线有罚时）
  - mostly-not-taken 由于分支很少被采用，罚时更少
  - alternate 介于两者之间
- 接入分支预测后：
  - 对“可预测模式”（always-taken、mostly-not-taken）应显著降低周期开销
  - 交替模式也会有收益，但受预测器位宽/历史表设计影响

建议方法：
- 每个模式重复多次（如 8k 次），记录周期数，取多次测量的中位数/平均值
- 将三者结果打印到 UART（如后续实现 MMIO UART）或映射到内存缓冲，仿真中读取
- 在板卡上用七段数码管显示“已完成用例数”，UART 打印详细数字

## 常见问题

1) 没有 RISC-V 工具链
- Windows 可安装 prebuilt `riscv64-unknown-elf-gcc`，并加入 PATH
- Ubuntu 可使用 `sudo apt-get install gcc-riscv64-unknown-elf`

2) 没有 MMIO 计时器也能跑吗？
- 可以。`bench_branch_predict.s` 的计时读写是“安全桩”，在未挂载外设时会退化为普通内存访问，不影响基准循环的正确性；只是得不到有效的周期数。

3) 七段数码管看到的数值是什么？
- 为简便，程序将每完成一个大用例就在 `x31` 上 +1，你会看到计数累加。你可以自行扩展为显示某个测量值的低 32 位（把 `x31=t6` 替换为你的结果）。
