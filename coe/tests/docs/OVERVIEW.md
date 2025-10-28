# RV32I 测试框架总览

## 目录

1. [概述](#概述)
2. [文件组织](#文件组织)
3. [测试说明](#测试说明)
4. [使用流程](#使用流程)
5. [调试指南](#调试指南)
6. [常见问题](#常见问题)

## 概述

本测试框架为 LibreCore 项目中的 RISC-V RV32I 处理器提供完整的指令集测试。框架特点：

- ✅ **全面覆盖**: 34个测试用例覆盖所有RV32I基础指令
- ✅ **分类测试**: 按指令类型分组，便于隔离问题
- ✅ **硬件显示**: 测试结果通过7段数码管实时显示
- ✅ **调试友好**: 错误代码直接指示失败的测试编号
- ✅ **仿真支持**: 提供完整的testbench用于仿真验证
- ✅ **文档完善**: 中英文文档，详细的使用说明

## 文件组织

```
librecore/tests/
│
├── README.md              # 主说明文档（英文）
├── QUICKSTART.md          # 快速开始指南（中文）
├── Makefile               # 自动化编译脚本
├── .gitignore             # Git忽略文件
│
├── asm/                   # 汇编测试源码
│   ├── test_rv32i_comprehensive.s  # 全面测试（34个测试）
│   ├── test_basic.s                # 基础测试（3个测试）
│   ├── test_arithmetic.s           # 算术指令测试
│   ├── test_logic.s                # 逻辑指令测试
│   ├── test_shift.s                # 移位指令测试
│   ├── test_branch.s               # 分支指令测试
│   ├── test_memory.s               # 内存操作测试
│   └── test_jump.s                 # 跳转指令测试
│
├── rtl/                   # RTL设计文件（从源码复制）
│   ├── myCPU.sv          # CPU核心
│   ├── TOP.v             # 顶层模块（已修改用于测试）
│   ├── Seven_Seg.v       # 7段显示控制器
│   ├── fetch.v           # 取指模块
│   ├── decode.v          # 译码模块
│   ├── execute.v         # 执行模块
│   ├── memory.v          # 访存模块
│   ├── writeback.v       # 写回模块
│   └── ...（其他支持模块）
│
├── testbenches/          # 测试平台
│   └── rv32i_test_tb.v  # 主测试平台（监控x31并显示结果）
│
├── tools/                # 工具脚本
│   ├── asm2coe.py       # 汇编到COE转换器（需要RISC-V工具链）
│   └── create_example_coe.py  # 示例COE生成器（无需工具链）
│
├── docs/                 # 详细文档
│   ├── README.md        # 中文详细文档
│   └── README_EN.md     # 英文详细文档
│
└── output/              # 编译输出（自动生成，gitignore）
    ├── *.coe            # COE文件（用于Vivado BRAM）
    ├── *.elf            # ELF可执行文件
    ├── *.bin            # 二进制文件
    └── *.hex            # 反汇编文件（调试用）
```

## 测试说明

### 全面测试套件 (test_rv32i_comprehensive.s)

**测试内容**: 34个测试用例，覆盖所有RV32I指令

**测试分类**:
- 指令01-05: 立即数操作 (ADDI, LUI, AUIPC, SLTI, SLTIU)
- 指令06-10: 立即数逻辑 (ANDI, ORI, XORI)
- 指令11-13: 立即数移位 (SLLI, SRLI, SRAI)
- 指令14-16: 寄存器移位 (SLL, SRL, SRA)
- 指令17-21: 寄存器操作 (ADD, SUB, SLT, SLTU, AND, OR, XOR)
- 指令22-27: 分支指令 (BEQ, BNE, BLT, BGE, BLTU, BGEU)
- 指令28-29: 跳转指令 (JAL, JALR)
- 指令30-34: 内存操作 (SW/LW, SH/LH, LHU, SB/LB, LBU)

**成功标志**: x31 = 0x00000022 (十进制34)
**失败标志**: x31 = 0xE000nn (nn为失败的测试编号)

### 分类测试

各个分类测试独立运行，便于隔离特定类型指令的问题：

| 测试文件 | 指令类型 | 测试数量 | 成功值 | 错误前缀 |
|---------|---------|---------|--------|---------|
| test_basic.s | 基础功能 | 3 | 0x00000003 | 0xF000n |
| test_arithmetic.s | 算术 | 3 | 0x00000003 | 0xA000n |
| test_logic.s | 逻辑 | 6 | 0x00000006 | 0xB000n |
| test_shift.s | 移位 | 6 | 0x00000006 | 0xC000n |
| test_branch.s | 分支 | 6 | 0x00000006 | 0xD000n |
| test_memory.s | 内存 | 5 | 0x00000005 | 0xD000n |
| test_jump.s | 跳转 | 2 | 0x00000002 | 0xE000n |

## 使用流程

### 方案A: 使用RISC-V工具链（推荐）

**优点**: 可以编译所有测试，支持自定义修改  
**缺点**: 需要安装工具链

```bash
# 1. 安装RISC-V工具链
sudo apt-get install gcc-riscv64-unknown-elf

# 2. 进入测试目录
cd librecore/tests

# 3. 编译所有测试
make all

# 4. 查看生成的COE文件
ls output/*.coe

# 5. 在Vivado中使用
# - 打开Block Memory Generator IP (IROM)
# - 加载 output/test_basic.coe
# - 重新生成IP并综合
```

### 方案B: 使用预生成的示例（无需工具链）

**优点**: 无需安装工具链，立即可用  
**缺点**: 仅包含简单示例

```bash
# 1. 生成示例COE文件
cd librecore/tests/tools
python3 create_example_coe.py

# 2. 查看生成的文件
ls examples/*.coe

# 3. 使用方法同方案A步骤5
```

### 在硬件上运行

1. **加载测试程序**:
   - Vivado中打开Block Memory Generator IP
   - 选择生成的COE文件
   - 重新生成IP

2. **综合和实现**:
   ```tcl
   # 在Vivado TCL控制台
   reset_run synth_1
   launch_runs synth_1
   wait_on_run synth_1
   launch_runs impl_1 -to_step write_bitstream
   wait_on_run impl_1
   ```

3. **下载到FPGA**:
   - 连接FPGA板卡
   - 打开Hardware Manager
   - Program Device

4. **观察结果**:
   - 查看7段数码管显示
   - 成功: 显示通过的测试数（如00000003）
   - 失败: 显示错误代码（如E0000001）

### 在仿真中运行

#### 使用Vivado Simulator:

```tcl
# 添加文件
add_files -fileset sim_1 testbenches/rv32i_test_tb.v
add_files -fileset sources_1 rtl/*.v rtl/*.sv

# 设置顶层
set_property top rv32i_test_tb [get_filesets sim_1]

# 运行仿真
launch_simulation
run 500us
```

#### 使用Icarus Verilog (开源):

```bash
cd librecore/tests

# 编译
iverilog -o test_sim \
    -s rv32i_test_tb \
    testbenches/rv32i_test_tb.v \
    rtl/*.v rtl/*.sv

# 运行
vvp test_sim

# 查看输出
# 测试进度会打印到控制台
```

## 调试指南

### 1. 理解错误代码

错误代码格式: `0xTTTTnnnn`
- `TTTT`: 测试类型标识
- `nnnn`: 失败的测试编号

例如:
- `0xE000000F` = 全面测试失败于测试#15 (SRLI指令)
- `0xF0000002` = 基础测试失败于测试#2
- `0xA0000001` = 算术测试失败于测试#1

### 2. 定位问题指令

步骤:
1. 记录7段数码管显示的错误代码
2. 打开对应的`.s`测试文件
3. 找到对应编号的测试（搜索`test_nn`或`pass_nn`）
4. 查看该测试使用的指令
5. 在仿真中设置断点或监视点

### 3. 使用仿真调试

在testbench中监视的信号:
- `x31_value`: 测试结果寄存器
- `current_pc`: 当前程序计数器
- `current_inst`: 当前指令
- `dut.cpu_inst.REGS[n]`: 任意寄存器n的值

添加监视点:
```verilog
always @(posedge CLK100MHZ) begin
    if (current_pc == 32'h00000040) begin  // 特定PC
        $display("At PC 0x40: x1=%h x2=%h", 
                 dut.cpu_inst.REGS[1], 
                 dut.cpu_inst.REGS[2]);
    end
end
```

### 4. 分级调试策略

如果全面测试失败:
1. **运行基础测试** - 验证基本功能
2. **运行分类测试** - 确定问题指令类型
3. **单独测试** - 隔离具体指令
4. **查看反汇编** - 检查生成的机器码
5. **波形分析** - 查看信号时序

### 5. 常见问题检查清单

- [ ] IROM是否正确加载COE文件？
- [ ] 程序起始地址是否为0x00000000？
- [ ] 时钟和复位信号是否正常？
- [ ] x31寄存器是否连接到7段显示？
- [ ] 内存映射是否正确（IROM: 0x0000, DRAM: 0x1000）？
- [ ] 数据前推逻辑是否正确？
- [ ] 分支目标地址计算是否正确？

## 常见问题

### Q1: 为什么需要RISC-V工具链？
A: 工具链用于将汇编代码编译为机器码。如果不想安装，可以使用`create_example_coe.py`生成简单示例。

### Q2: 数码管显示全是8888怎么办？
A: 这可能表示x31寄存器未正确连接。检查TOP.v中是否有：
```verilog
assign test_result = cpu_inst.REGS[31];
```

### Q3: 仿真中测试不完成？
A: 检查：
- IROM是否加载
- 时钟是否运行
- 复位是否正确释放
- 增加仿真时间 (run 1ms)

### Q4: 如何添加自己的测试？
A: 
1. 在`asm/`目录创建`.s`文件
2. 遵循现有格式（使用x31输出结果）
3. 运行`make`或手动编译
4. 加载生成的COE文件

### Q5: 测试在某个特定指令总是失败？
A: 
1. 检查该指令在CPU中的实现
2. 查看execute.v中对应的ALU操作
3. 验证立即数生成和符号扩展
4. 检查数据前推逻辑

### Q6: 如何验证内存操作？
A: 
1. 运行test_memory.s
2. 在仿真中监视内存读写信号
3. 检查地址对齐
4. 验证字节使能信号

## 技术支持

### 获取帮助
- 📖 查看详细文档: `docs/README.md` (中文) 或 `docs/README_EN.md` (英文)
- 🚀 快速开始: `QUICKSTART.md`
- 🔧 Makefile帮助: `make help`

### 报告问题
提交Issue时请包含：
- 错误代码（数码管显示的值）
- 使用的测试文件
- 仿真波形（如果有）
- CPU实现版本

### 贡献
欢迎贡献：
- 新的测试用例
- 文档改进
- Bug修复
- 工具增强

---

**项目**: LibreCore RV32I测试框架  
**版本**: 1.0  
**更新**: 2025-10-16  
**许可**: 遵循主项目许可证
