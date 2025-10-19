# RTL 设计图示说明 (RTL Design Diagrams Documentation)

本目录包含使用 Yosys + GraphViz 生成的五级流水线处理器及 SoC 各层级 RTL 设计示意图。

This directory contains RTL design diagrams for the five-stage pipeline processor and SoC at various hierarchical levels, generated using Yosys + GraphViz.

## 文件说明 (File Description)

### 五级流水线处理器各阶段 (Five Pipeline Stages)

#### 1. Fetch 阶段 (Instruction Fetch Stage)
- **文件**: `1_fetch.svg`, `1_fetch.png`
- **模块**: `fetch`
- **功能**: 指令预取与 PC 管理
- **主要组件**:
  - PC 寄存器
  - AHB 指令接口逻辑
  - IF/ID 流水线寄存器
  - 分支预测与流水线控制

#### 2. Decode 阶段 (Instruction Decode Stage)
- **文件**: `2_decode.svg`, `2_decode.png`
- **模块**: `decode`
- **功能**: 寄存器读取与指令译码
- **主要组件**:
  - 指令译码器
  - 寄存器读取逻辑
  - 立即数扩展
  - ID/EX 流水线寄存器
  - 数据前推检测

#### 3. Execute 阶段 (Execution Stage)
- **文件**: `3_execute.svg`, `3_execute.png`
- **模块**: `execute`
- **功能**: 算术/逻辑运算与跳转
- **主要组件**:
  - ALU (算术逻辑单元)
  - 分支条件判断
  - 跳转目标计算
  - EX/MEM 流水线寄存器
  - 数据前推逻辑

#### 4. Memory 阶段 (Memory Access Stage)
- **文件**: `4_memory.svg`, `4_memory.png`
- **模块**: `memory`
- **功能**: 数据访问
- **主要组件**:
  - AHB 数据接口逻辑
  - Load/Store 控制
  - 内存数据对齐
  - MEM/WB 流水线寄存器

#### 5. Writeback 阶段 (Write-back Stage)
- **文件**: `5_writeback.svg`, `5_writeback.png`
- **模块**: `writeback`
- **功能**: 寄存器写回
- **主要组件**:
  - 写回数据选择
  - 寄存器写使能逻辑

### CPU 顶层设计 (CPU Top Level)

#### 6. myCPU 完整处理器 (Complete CPU)
- **文件**: `6_myCPU.svg`, `6_myCPU.png`
- **模块**: `myCPU`
- **功能**: 完整的五级流水线 RV32I 处理器
- **主要组件**:
  - 五个流水线阶段的集成
  - 寄存器文件 (32 个通用寄存器)
  - 流水线控制与冒险处理
  - AHB 指令/数据双总线接口

### AHB 总线子系统 (AHB Bus Subsystem)

#### 7. AHB 互连 (AHB Interconnect)
- **文件**: `7_ahb_interconnect.svg`, `7_ahb_interconnect.png`
- **模块**: `AHB_interconnect`
- **功能**: AHB 总线互连
- **主要组件**:
  - AHB 译码器 (地址译码)
  - AHB 多路复用器 (数据选择)
  - 从设备选择逻辑

#### 8. AHB BRAM 控制器 (AHB BRAM Controller)
- **文件**: `8_ahb_bram_controller.svg`, `8_ahb_bram_controller.png`
- **模块**: `AHB_bram_controller`
- **功能**: AHB 到 BRAM 的接口控制
- **主要组件**:
  - AHB 协议状态机
  - BRAM 读写控制
  - 地址转换逻辑
  - 字节使能控制

#### 9. AHB IROM 控制器 (AHB IROM Controller)
- **文件**: `9_ahb_irom_controller.svg`, `9_ahb_irom_controller.png`
- **模块**: `AHB_irom_controller`
- **功能**: AHB 到指令 ROM 的接口控制
- **主要组件**:
  - AHB 协议状态机
  - ROM 读取控制
  - 地址转换逻辑

## 设计架构概览 (Design Architecture Overview)

### 五级流水线架构 (Five-Stage Pipeline Architecture)

```
┌─────────┐    ┌─────────┐    ┌─────────┐    ┌─────────┐    ┌─────────┐
│  Fetch  │───▶│ Decode  │───▶│ Execute │───▶│ Memory  │───▶│Writeback│
│  (IF)   │    │  (ID)   │    │  (EX)   │    │  (MEM)  │    │  (WB)   │
└────┬────┘    └────┬────┘    └────┬────┘    └────┬────┘    └────┬────┘
     │              │              │              │              │
     │              │              ▼              │              │
     │              │         数据前推             │              │
     │              │         (Forwarding)        │              │
     │              │              │              │              │
     │              └──────────────┴──────────────┘              │
     │                   冒险检测与控制                           │
     │                   (Hazard Detection)                     │
     │                                                          │
     └──────────────────────────────────────────────────────────┘
                         寄存器文件 (Register File)
```

### SoC 系统架构 (SoC System Architecture)

```
┌─────────────────────────────────────────────────────────────┐
│                         TOP (SoC)                            │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│  ┌──────────────┐          ┌────────────────────────┐       │
│  │    myCPU     │          │   AHB Interconnect     │       │
│  │  (5-stage)   │◀────────▶│                        │       │
│  │              │   指令    │  ┌──────────────────┐  │       │
│  │              │◀─────────┼──│  IROM Controller │──┼──▶ROM │
│  │              │   数据    │  └──────────────────┘  │       │
│  └──────────────┘◀─────────┼──┐                     │       │
│                            │  │  BRAM Controller    │       │
│  ┌──────────────┐          │  └──────────────────┬──┼──▶RAM │
│  │  Peripherals │          │                     │  │       │
│  │  - UART      │◀─────────┤                     │  │       │
│  │  - 7-Seg     │          │                     │  │       │
│  │  - LED       │          └─────────────────────┘  │       │
│  │  - Keys      │                                   │       │
│  └──────────────┘                                   │       │
└─────────────────────────────────────────────────────────────┘
```

## 技术特性 (Technical Features)

### 处理器特性 (Processor Features)
- **指令集**: RISC-V RV32I
- **流水线**: 五级经典流水线 (IF, ID, EX, MEM, WB)
- **寄存器**: 32 个 32 位通用寄存器
- **总线接口**: AHB-Lite 双总线 (指令/数据分离)
- **数据前推**: 支持 EX-EX, MEM-EX 前推
- **冒险处理**: Load-Use 冒险检测与停顿

### AHB 总线特性 (AHB Bus Features)
- **协议**: AMBA 3 AHB-Lite
- **位宽**: 32-bit 地址和数据
- **传输类型**: 支持单次传输
- **从设备**: 指令 ROM, 数据 RAM
- **互连**: 基于地址译码的自动从设备选择

## 如何查看图示 (How to View Diagrams)

### SVG 文件 (Recommended)
SVG 文件支持缩放且不失真，推荐使用以下工具查看:
- 浏览器 (Chrome, Firefox, Edge 等)
- Inkscape
- Draw.io / diagrams.net (可以导入并编辑)

### PNG 文件
PNG 文件为位图格式，适合直接插入文档:
- 任何图片查看器
- Microsoft Word / PowerPoint
- LaTeX 文档

### DOT 文件
DOT 文件为 GraphViz 源文件，可以:
- 使用 GraphViz 工具重新渲染
- 导入到支持 DOT 格式的工具
- 自定义样式后重新生成

## 重新生成图示 (Regenerate Diagrams)

如果需要重新生成图示，运行以下命令:

```bash
cd /home/runner/work/LibreCore/LibreCore
bash report/generate_rtl_diagrams.sh
```

### 前置条件 (Prerequisites)
- Yosys (已安装)
- GraphViz (已安装)
- RTL 源文件位于 `librecore/tests/rtl/`

## 使用场景 (Use Cases)

### 1. 设计文档
将图示插入到设计文档中，帮助理解系统架构和模块关系。

### 2. 代码审查
使用图示进行代码审查，快速了解模块的输入输出和内部结构。

### 3. 教学演示
用于教学或演示，展示处理器和 SoC 的设计原理。

### 4. 调试分析
结合仿真波形，使用图示定位问题模块和信号路径。

## 图示说明 (Diagram Legend)

### 图形元素
- **矩形框**: 逻辑门、寄存器、模块
- **菱形**: 多路选择器 (MUX)
- **圆形**: 输入/输出端口
- **箭头**: 信号连接方向

### 颜色编码
- **蓝色**: 输入端口
- **红色**: 输出端口
- **绿色**: 内部信号
- **黄色**: 状态寄存器

## 参考文档 (References)

1. **RISC-V 规范**: [RISC-V ISA Specification](https://riscv.org/specifications/)
2. **AMBA AHB 协议**: ARM AMBA 3 AHB-Lite Protocol Specification
3. **Yosys 文档**: [Yosys Manual](http://www.clifford.at/yosys/documentation.html)
4. **GraphViz 文档**: [GraphViz Documentation](https://graphviz.org/documentation/)

## 版本信息 (Version Information)

- **生成日期**: 2025-10-19
- **Yosys 版本**: 0.33
- **GraphViz 版本**: 自动检测
- **处理器版本**: RV32I LibreCore v1.0

---

**注意**: 由于 myCPU 完整处理器的复杂性，其图示文件较大。建议使用 SVG 格式查看以获得最佳体验。
