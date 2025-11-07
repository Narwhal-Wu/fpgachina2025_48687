# LibreCore

OpenRV / LibreCore 是一个面向FPGA上的可编程控制与快速原型设计的轻量级 RISC-V RV32I 五级流水线软核与最小 SoC 开源工程，采用 AMBA AHB-Lite 作为片上互连，提供指令/数据哈佛双主端口、统一外设从端接口与基础可视化 / 调试外设（按键消抖、LED、RGB、七段数码管、UART）。

> 关键词：RISC-V、五级流水线、AHB-Lite、SoC、FPGA、快速原型

## 特性一览

- RV32I 基础整数指令集（不含 CSR/异常扩展）
- 经典 5 级流水线：IF / ID / EX / MEM / WB，含数据前递、Load-Use 气泡与分支 flush 处理
- 哈佛结构 + 指令 / 数据双 AHB-Lite 主接口
- AHB-Lite 轻量桥接：IROM / BRAM 控制器无等待（HREADYOUT=1），带写后读前推（RAW forwarding）
- 外设与调试：按键消抖模块、16×LED + 2×RGB、8 位七段数码管显示 x31、UART 9600bps
- 资源友好：单端口 BRAM 2 块（指令 / 数据各 4KB，可扩展），结构化前推减少等待


## 仓库结构概览

```
├─rtl/                         # 当前主线可综合 RTL（CPU 与 AHB 相关核心 + 外设）
│  ├─myCPU.sv                  # 顶层 CPU（5 级流水线）
│  ├─fetch.v decode.v execute.v memory.v writeback.v
│  ├─AHB_*.v / ahb_defines.vh  # AHB-Lite 解码 / 互连 / 控制器
│  ├─UART.v Seven_Seg.v key_debounce.v #外设模块
│  └─TOP.v                     # 顶层文件
├─workshop/
│  ├─assemble 1/newriscv/      # Vivado 工程目录（核心工程入口 newriscv.xpr）
│  └─Soc peripheral/           # 外设 / 试验性 SoC 资源
├─coe/                         # 存放 .coe / riscv-tests 相关（程序/测试镜像）
├─report/                      # 完整技术报告、图示、结果与 LLM 交互记录
├─LICENSE                      # Apache License 2.0
└─README.md                    # 本文件
```

### 关键工程入口

| 目的 | 路径 | 说明 |
|------|------|------|
| Vivado 工程（综合/实现/下载） | `workshop/assemble 1/newriscv/newriscv.xpr` | 打开后包含 CPU、AHB 控制器与外设顶层（`TOP.v`） |
| 当前主线 RTL 学习 / 修改 | `rtl/` | 建议在此目录迭代核心逻辑并同步到工程 |
| 外设与试验资源 | `workshop/Soc peripheral/` & `rtl/*` | 试验性 / 拆分外设模块、调试版本 |
| 测试程序 / COE | `coe/` | 供 Block Memory 初始化或仿真加载 |

## 快速上手

### 1. 打开工程
1. 启动 Vivado 2023.2（或兼容版本）
2. File → Open Project → 选择 `workshop/assemble 1/newriscv/newriscv.xpr`

### 2. 生成仿真 / 位流
1. Run Synthesis → Run Implementation → Generate Bitstream
2. 使用硬件管理器连接 Nexys A7 (Artix-7 100T) 下载生成的 `.bit`

### 3. 仿真（行为级）
1. 在 Vivado 选择 Simulation → Run Behavioral Simulation
2. 使用 `TOP_tb.v`或自行添加 testbench
3. 观察指令执行与 `x31` 七段显示对应关系

### 4. 程序镜像更新
1. 在 `coe/` 目录放置新的 `.coe` 文件（指令 / 数据初始化）
2. 重新生成 Block Memory（或在 Vivado 中重新导入初始化文件）
3. 重新综合 / 下载

## 设计要点速览

- 无等待 AHB-Lite 存储通路：写后紧跟读不插入 Stall，通过暂存与字节级合成保证一致性
- 数据冒险：EX/MEM、MEM/WB 前递 + Load-Use 气泡插入；分支采用静态“不跳转”策略 + flush
- 单时钟域（HCLK）+ 同步释放复位，降低 CDC 风险
- 结构留白：可在 AHB 上挂载更多从设备（GPIO / Timer / SPI / Cache 等）

## 目录与角色说明（精简版）

- `rtl/`：主开发目录；若与历史版本差异较大，请以此为“真源”同步到 Vivado
- `workshop/assemble 1/newriscv/`：IDE（Vivado）工程产物、运行脚本、约束（`*.xdc`）与生成文件
- `workshop/Soc peripheral/`：外设相关实验与辅助资源（可挑选迁入 `rtl/`）
- `coe/`：指令 / 数据初始化（RISC-V 测试 / Demo 程序）
- `report/`：完整技术报告（`report.md`）—— 包含体系结构、接口、状态机、验证与时序细节

## 许可证与竞赛声明

本项目基于 **Apache License 2.0** 授权（见 `LICENSE`），在符合许可证条款（保留版权与许可声明、注明修改等）的前提下可用于学习与研究。

> 竞赛使用特别声明：本仓库源代码及文档作为竞赛成果的一部分，版权所有者（Original Authors / Contributors）保留署名与成果归属权。任何未经授权的整体或大段抄袭、去标识再分发、伪造原创的行为均被明确禁止。引用或二次使用请保留原版权与许可头部，并在成果材料中注明来源 “LibreCore (OpenRV) 项目”。

若需在衍生闭源或商用场景中进一步使用，请先与作者沟通确认合规性。

Copyright (c) 2025 The LibreCore Authors

### 第三方组件与许可证说明

本仓库包含第三方开源组件，其原版权与许可证需原样保留：

- `coe/riscv-tests/` 目录源自上游 RISC-V 官方测试集项目（示例参考仓库：https://github.com/riscv/riscv-tests），遵循 **BSD 3-Clause License**，具体条款见该目录下的 `LICENSE` 文件。我们不主张该部分的版权，仅在原许可证允许范围内进行集成与再分发。

除非特别标注，其他代码与文档均依据 Apache License 2.0 分发。完整第三方与版权声明清单参见 `THIRD_PARTY_NOTICES.md`。

## 致谢

- RISC-V 基础生态与开源社区
- Vivado 工具链与 FPGA 开发板支持
- 竞赛组织方与评审专家的指导
- LLM 辅助提升（设计评审 / 冒险优化 / 状态机与注释规范）

---
如需更深入的体系结构、接口与验证细节，请阅读 `report/report.md`（完整技术报告）。