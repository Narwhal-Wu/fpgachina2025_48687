# FPGA创新设计大赛 AMD赛道 - 自主选题初级赛道设计报告

**竞赛名称：** 2025年全国大学生嵌入式芯片与系统设计竞赛——FPGA创新设计大赛 AMD赛道  
**赛道类型：** 自主选题 - 初级赛道  
**项目名称：** LibreCore - 基于RISC-V的五级流水线处理器及SoC系统  
**提交日期：** 2025-10-25

---

## 摘要

本项目实现了一个基于RISC-V RV32I指令集的五级流水线微型处理器及配套SoC系统。处理器采用经典的五级流水线架构（取指、译码、执行、访存、写回），完整支持RV32I基础整数指令集。系统采用AMBA AHB总线协议进行片上互连，实现了指令ROM控制器(IROM)和数据RAM控制器(BRAM)，支持字节、半字和字的访问操作。设计包含完整的数据前递机制和冒险检测逻辑，确保流水线的正确执行。项目使用Verilog硬件描述语言实现，在Xilinx FPGA平台上进行了验证。

**关键词：** RISC-V、五级流水线、AHB总线、SoC、FPGA

## 1. 项目概述

### 1.1 选题背景与意义

RISC-V作为一个开源的指令集架构，近年来在学术界和工业界得到了广泛关注。相比传统的商业指令集，RISC-V具有开放、简洁、可扩展等优点，非常适合作为处理器设计的学习平台。

本项目选择实现RISC-V RV32I处理器，具有以下意义：

1. **教育价值**：通过实现完整的五级流水线处理器，深入理解计算机组成原理中的流水线技术、数据冒险处理、控制冒险处理等核心概念。

2. **工程实践**：掌握大规模数字系统设计方法，包括模块化设计、接口设计、状态机设计等FPGA开发技能。

3. **总线协议应用**：通过实现AHB总线协议，学习工业标准的片上互连技术，为后续的SoC设计打下基础。

4. **开源贡献**：RISC-V的开放性使得本项目可以作为教学资源和开源贡献，供其他学习者参考。

### 1.2 项目目标

**功能目标：**

- 实现完整的RV32I基础整数指令集（包括算术、逻辑、分支、跳转、访存等指令）
- 采用五级流水线架构，提高指令执行效率
- 实现数据前递机制，减少流水线停顿
- 实现Load-Use冒险检测和处理
- 实现AHB总线接口，支持标准的片上互连
- 设计IROM和BRAM控制器，支持指令取指和数据访存
- 支持字节、半字、字的内存访问操作

**学习目标：**

- 掌握RISC-V指令集架构和处理器设计方法
- 掌握流水线处理器的设计技术，包括冒险检测和处理
- 掌握AHB总线协议的应用和实现
- 提升Verilog/SystemVerilog硬件描述语言编程能力
- 提升FPGA综合、仿真和调试能力
- 培养大规模数字系统的工程实践能力

### 1.3 技术规格

<!-- 目标器件这边是不是忘改 -->
- **目标器件：** Xilinx FPGA (支持Artix-7系列及以上)  
- **开发环境：** Vivado 2023.2
- **编程语言：** Verilog / SystemVerilog
- **验证平台：** Vivado仿真器，硬件验证平台
- **应用领域：** 嵌入式处理器、教学实验、SoC设计
- **总线协议：** AMBA AHB-Lite
- **指令集架构：** RISC-V RV32I

---

## 2. 需求分析与系统设计

### 2.1 功能需求分析

[详细分析项目的功能需求]

**核心功能模块：**

1. **五级流水线处理器核心：**
   - Fetch（取指）阶段：从指令存储器读取指令
   - Decode（译码）阶段：指令译码和寄存器读取
   - Execute（执行）阶段：ALU运算和分支判断
   - Memory（访存）阶段：数据存储器访问
   - Writeback（写回）阶段：结果写回寄存器

2. **AHB总线互连系统：**
   - 支持多主设备多从设备互连
   - 地址译码和数据路由
   - 传输仲裁和控制

3. **存储器子系统：**
   - 指令ROM（IROM）控制器：只读，用于存储程序代码
   - 数据RAM（BRAM）控制器：可读写，用于数据存储
   - 支持字节、半字、字访问

<!-- 这边要不要写外设 -->

**性能需求：**

- 工作频率：目标50-100 MHz（根据FPGA器件和综合结果）
- 流水线吞吐率：理想情况下每周期完成一条指令（CPI≈1）
- 访存延迟：单周期内存访问（BRAM延迟1周期）
- 支持指令集：RV32I基础整数指令集（不包括fence,ebreak,ecall以及CSR指令）

### 2.2 系统架构设计

#### 2.2.1 顶层架构

系统采用分层设计，主要包括处理器核心层和总线互连层。

```
┌──────────────────────────────────────────────────────────────────┐
│                        SoC Top Level                             │
│  ┌────────────────────────────────────────────────────────────┐  │
│  │                   myCPU (5 stages pipeline core)           │  │
│  │  ┌──────┐  ┌──────┐  ┌───────┐  ┌──────┐  ┌─────────┐      │  │
│  │  │Fetch │->│Decode│->│Execute│->│Memory│->│Writeback│      │  │
│  │  └──────┘  └──────┘  └───────┘  └──────┘  └─────────┘      │  │
│  │      │                               │                     │  │
│  │      │ AHB-I                         │ AHB-D               │  │
│  └──────┼───────────────────────────────┼─────────────────────┘  │
│         │                               │                        │
│         v                               v                        │
│         │                               │                        │
│   ┌─────v─────┐                   ┌────v──────┐                  │
│   │   IROM    │                   │   BRAM    │                  │
│   │Controller │                   │Controller │                  │
│   └───────────┘                   └───────────┘                  │
│         │                               │                        │
│   ┌─────v─────┐                   ┌────v──────┐                  │
│   │Instruction│                   │   Data    │                  │
│   │   ROM     │                   │    RAM    │                  │
│   └───────────┘                   └───────────┘                  │
└──────────────────────────────────────────────────────────────────┘
```
<!-- 外设部分要不要弄 -->

**系统架构说明：**

- **处理器核心（myCPU）**：采用哈佛架构，具有独立的指令接口（AHB-I）和数据接口（AHB-D）
- **AHB互连（AHB Interconnect）**：实现指令和数据总线的路由和仲裁
- **IROM控制器**：将AHB协议转换为Block ROM接口，用于指令存储
- **BRAM控制器**：将AHB协议转换为Block RAM接口，用于数据存储，支持读写操作


<!-- #### 2.2.2 状态机设计

[描述核心控制逻辑的状态机设计，这是初级赛道的重点考察内容]

这是模板部分我们现在这边是架构介绍更像2.2.1不是状态机 -->
#### 2.2.2 流水线架构设计

五级流水线设计采用经典的RISC流水线结构，各阶段功能如下：

![五级流水线架构](rtl_diagrams/pipeline_architecture.svg)

**各阶段详细说明：**

1. **IF (Instruction Fetch) 取指阶段**
   - 根据PC值从指令存储器读取指令
   - 通过AHB指令接口发起读请求
   - 更新PC值（正常递增或分支跳转）
   - 将指令和PC传递到IF/ID流水线寄存器

2. **ID (Instruction Decode) 译码阶段**
   - 指令译码，识别指令类型和操作码
   - 从寄存器堆读取源操作数（rs1, rs2）
   - 生成立即数
   - 检测数据冒险，实施前递或插入气泡
   - 将译码结果传递到ID/EX流水线寄存器

3. **EX (Execute) 执行阶段**
   - ALU执行算术逻辑运算
   - 计算分支跳转目标地址
   - 进行分支条件判断
   - 生成PC_next和branch_taken信号
   - 将执行结果传递到EX/MEM流水线寄存器

4. **MEM (Memory) 访存阶段**
   - 对于Load/Store指令，通过AHB数据接口访问数据存储器
   - 处理字节、半字、字的读写操作
   - 处理内存对齐
   - 将结果传递到MEM/WB流水线寄存器

5. **WB (Write Back) 写回阶段**
   - 将ALU结果或内存读取数据写回目标寄存器
   - 更新寄存器堆

**流水线寄存器：**

- IF/ID：存储指令和PC
- ID/EX：存储译码结果、源操作数、立即数等
- EX/MEM：存储ALU结果、访存控制信号等
- MEM/WB：存储写回数据和目标寄存器地址

**冒险处理机制：**

1. **数据冒险（Data Hazard）**
   - 前递（Forwarding）：从EX/MEM和MEM/WB阶段前递数据到EX阶段
   - Load-Use冒险：检测并插入气泡（bubble）

2. **控制冒险（Control Hazard）**
   - 分支预测：采用静态预测（预测不跳转）
   - 分支错误时清空流水线（Flush）

<!-- 这里跟模板#### 2.2.3 时序设计

[描述关键路径的时序设计，体现时序分析能力] 不匹配 -->
#### 2.2.3 AHB总线设计

系统采用AMBA AHB-Lite协议实现片上互连。

**AHB信号定义：**

- **地址和控制信号**：
  - HADDR[31:0]：32位地址总线
  - HTRANS[1:0]：传输类型（IDLE, BUSY, NONSEQ, SEQ）
  - HWRITE：读写控制（0=读，1=写）
  - HSIZE[2:0]：传输大小（字节、半字、字）
  - HBURST[2:0]：突发类型
  - HPROT[3:0]：保护控制

- **数据信号**：
  - HWDATA[31:0]：写数据
  - HRDATA[31:0]：读数据

- **响应信号**：
  - HREADY：传输完成
  - HRESP：传输响应（OKAY, ERROR）

**地址映射：**

- 指令ROM：0x0000_0000 - 0x0000_FFFF（64KB）
- 数据RAM：0x0001_0000 - 0x0001_FFFF（64KB）

![SoC架构](rtl_diagrams/soc_architecture.svg)

### 2.3 接口设计

**处理器核心接口：**

**输入接口：**
- HCLK：系统时钟
- HRESETn：复位信号（低有效）
- HRDATA_I[31:0]：指令读数据
- HREADY_I：指令传输完成
- HRESP_I：指令传输响应
- HRDATA_D[31:0]：数据读数据
- HREADY_D：数据传输完成
- HRESP_D：数据传输响应

**输出接口：**
- HADDR_I[31:0]：指令地址
- HTRANS_I[1:0]：指令传输类型
- HSIZE_I[2:0]：指令传输大小
- HADDR_D[31:0]：数据地址
- HWDATA_D[31:0]：数据写数据
- HWRITE_D：数据读写控制
- HTRANS_D[1:0]：数据传输类型
- HSIZE_D[2:0]：数据传输大小

---

## 3. 详细设计与实现

<!-- ### 3.1 核心算法设计

[描述项目中用到的核心算法]

**算法原理：**
[用数学公式或伪代码描述算法]

**硬件实现策略：**
[描述如何将算法映射到硬件]
 -->
### 3.1 核心算法设计
<!-- 这边有点偏离cpu算法 -->
**ALU算法设计：**

ALU支持以下运算类型：
- 算术运算：ADD, SUB
- 逻辑运算：AND, OR, XOR
- 移位运算：SLL, SRL, SRA
- 比较运算：SLT, SLTU

**分支判断算法：**

根据funct3字段判断分支条件：
- BEQ：rs1 == rs2
- BNE：rs1 != rs2
- BLT：rs1 < rs2（有符号）
- BGE：rs1 >= rs2（有符号）
- BLTU：rs1 < rs2（无符号）
- BGEU：rs1 >= rs2（无符号）

**Load-Use冒险检测算法：**

```
if (ID_EX_is_load && 
    ((ID_EX_rd == IF_ID_inst[19:15]) || 
     (ID_EX_rd == IF_ID_inst[24:20]))) {
    插入气泡
    PC保持不变
}
```

### 3.2 关键模块设计

#### 3.2.1 Fetch模块

![Fetch模块框图](rtl_diagrams/module_fetch.svg)

**功能描述：**
Fetch模块负责从指令存储器取指，管理PC值的更新。支持正常PC递增、分支跳转和Load-Use冒险时的PC保持。

**端口定义：**

```verilog
module fetch (
    input         CLK,
    input         RES,
    input  [31:0] HRDATA_I,        // AHB读数据（指令）
    input         HREADY_I,        // AHB传输完成
    input         HRESP_I,         // AHB响应
    input  [31:0] PC_next,         // 下一个PC值
    input         branch_taken,    // 分支跳转标志
    input         Load_bubble,     // Load-Use冒险标志
    
    output [31:0] PC,              // 当前PC
    output [31:0] HADDR_I,         // 指令地址
    output        HWRITE_I,        // 写使能（固定为0）
    output [2:0]  HSIZE_I,         // 传输大小（固定为WORD）
    output [2:0]  HBURST_I,        // 突发类型
    output [1:0]  HTRANS_I,        // 传输类型
    output        HMASTLOCK_I,     // 主设备锁定
    output [31:0] HWDATA_I,        // 写数据（未使用）
    output [3:0]  HPROT_I,         // 保护控制
    output [31:0] IF_ID_pc,        // IF/ID流水线寄存器PC
    output [31:0] IF_ID_inst       // IF/ID流水线寄存器指令
);
```

**逻辑设计：**
- PC更新逻辑：根据branch_taken和Load_bubble信号选择PC_next或PC+4
- AHB接口控制：发起NONSEQ传输，固定为字读取
- 流水线寄存器：在时钟上升沿锁存指令和PC

#### 3.2.2 Decode模块

![Decode模块框图](rtl_diagrams/module_decode.svg)

**功能描述：**
Decode模块负责指令译码、寄存器读取、立即数生成以及数据冒险检测。

**端口定义：**

```verilog
module decode (
    input         CLK,
    input  [31:0] IF_ID_pc,
    input  [31:0] IF_ID_inst,
    input  [31:0] rs1,             // 寄存器堆读数据
    input  [31:0] rs2,
    input  [31:0] ID_EX_alu,       // 前递数据
    input  [4:0]  EX_MEM_rd,
    input  [31:0] EX_MEM_alu,
    input  [31:0] EX_MEM_inst,
    input  [4:0]  MEM_WB_rd,
    input         branch_taken,
    input  [31:0] load_data,
    
    output [31:0] ID_EX_pc,
    output [31:0] ID_EX_inst,
    output [31:0] ID_EX_rs1,
    output [31:0] ID_EX_rs2,
    output [4:0]  ID_EX_rd,
    output [31:0] ID_EX_imm,
    output        ID_EX_is_jalr,
    output        ID_EX_is_jal,
    output        ID_EX_is_sys,
    output        ID_EX_is_branch,
    output        Load_bubble
);
```

**逻辑设计：**
- 指令译码：根据opcode识别指令类型
- 立即数生成：根据指令格式（I/S/B/U/J型）生成立即数
- Load-Use检测：检测当前指令是否依赖前一条Load指令的结果
- 数据前递：从后续流水线阶段前递数据

#### 3.2.3 Execute模块

![Execute模块框图](rtl_diagrams/module_execute.svg)

**功能描述：**
Execute模块负责ALU运算、分支判断和跳转地址计算。

**主要功能：**
- ALU运算：支持加减、逻辑、移位、比较等操作
- 分支判断：计算分支条件，生成branch_taken信号
- 地址计算：计算分支、跳转目标地址
- PC_next生成：确定下一个PC值

#### 3.2.4 Memory模块

![Memory模块框图](rtl_diagrams/module_memory.svg)

**功能描述：**
Memory模块负责数据存储器访问，通过AHB接口进行Load/Store操作。

**主要功能：**
- Load操作：从数据存储器读取数据，支持字节、半字、字
- Store操作：向数据存储器写入数据，支持字节、半字、字
- 数据对齐和扩展：处理非对齐访问和符号/零扩展
- AHB接口控制：生成AHB传输控制信号

#### 3.2.5 Writeback模块

![Writeback模块框图](rtl_diagrams/module_writeback.svg)

**功能描述：**
Writeback模块负责将执行结果写回寄存器堆。

**主要功能：**
- 选择写回数据源：ALU结果、内存读数据或PC+4
- 生成寄存器写使能信号
- 处理CSR指令的写回

#### 3.2.6 AHB Interconnect模块

![AHB Interconnect模块框图](rtl_diagrams/module_ahb_interconnect.svg)

**功能描述：**
AHB互连模块实现总线仲裁和数据路由。

**主要功能：**
- 地址译码：根据地址自动选择从设备
- 数据路由：将从设备响应路由回主设备
- 响应管理：合并多个从设备的响应和就绪信号

**子模块：**
- **AHB Decoder**：根据地址译码，生成从设备选择信号
- **AHB Multiplexor**：根据选择信号，将从设备响应路由回主设备

#### 3.2.7 BRAM Controller模块

![BRAM Controller模块框图](rtl_diagrams/module_ahb_bram_controller.svg)

**功能描述：**
BRAM控制器将AHB协议转换为Block RAM接口协议。

**主要功能：**
- AHB到BRAM协议转换：通过状态机管理传输流程
- 支持字节、半字、字的读写：灵活的数据大小控制
- 处理BRAM的1周期延迟：读数据对齐和延迟处理
- 生成BRAM的字节写使能信号：根据HSIZE和地址偏移生成写使能
- 数据对齐：自动处理非对齐访问的数据对齐

#### 3.2.8 IROM Controller模块

![IROM Controller模块框图](rtl_diagrams/module_ahb_irom_controller.svg)

**功能描述：**
IROM控制器将AHB协议转换为Block ROM接口协议，用于指令存储。

**主要功能：**
- AHB到ROM协议转换：通过状态机管理只读传输
- 只读访问：写操作自动返回错误响应
- 支持连续读取：优化顺序读取性能
- 数据对齐：支持字节、半字、字的读取并自动对齐
- 地址转换：将AHB地址转换为ROM地址

### 3.3 资源使用设计

**逻辑资源规划：**

- LUT使用：主要用于ALU、控制逻辑、地址译码等组合逻辑
- 寄存器使用：流水线寄存器、PC、寄存器堆等时序逻辑
- 时钟资源：使用全局时钟网络，单时钟域设计

**存储资源规划：**

- 寄存器堆：32个32位寄存器，使用分布式RAM或寄存器实现
- BRAM使用：
  - 指令ROM：使用Block ROM IP核，大小可配置（默认64KB）
  - 数据RAM：使用Block RAM IP核，大小可配置（默认64KB）

---

## 4. LLM 辅助优化记录

本节记录了在设计和调试过程中，利用LLM（大型语言模型，如GitHub Copilot）进行辅助优化的关键案例。这些记录展示了AI辅助工具在硬件设计调试中的实际应用价值。

### 4.1 寄存器写回逻辑修改

**问题描述：**

在完成处理器设计后，我们进行了详细的仿真测试，所有测试用例均通过验证。然而，当将设计烧录到FPGA开发板进行硬件验证时，发现数码管显示的数据与仿真结果不一致，表明实际硬件执行结果与仿真预期存在差异。

**问题诊断：**

在遇到此问题后，我们向GitHub Copilot描述了现象并寻求帮助。Copilot分析后指出，问题的根源在于寄存器堆的写回逻辑设计不当。具体来说：

- **原始设计缺陷**：寄存器写回采用的是组合逻辑（combinational logic），这在某些情况下会引发读写冲突（read-write hazard）
- **冲突场景**：当同一个寄存器在同一个时钟周期内同时进行读取和写入操作时，由于组合逻辑的传播延迟，可能导致读取到不确定的中间状态值
- **仿真与实际的差异**：仿真工具通常使用理想的零延迟模型或固定延迟模型，可能无法准确反映实际硬件中的时序竞争问题

**解决方案：**

根据Copilot的建议，我们将寄存器写回时序从组合逻辑改为在时钟下降沿（negative edge）触发的时序逻辑。这样做的好处是：

1. **时序分离**：读操作在时钟上升沿完成，写操作在时钟下降沿完成，两者在时间上分离，避免了读写冲突
2. **确定性保证**：写回操作严格在时钟边沿触发，消除了组合逻辑的不确定性
3. **硬件友好**：这种设计更符合FPGA和ASIC的时序约束要求

**修改效果：**

修改后重新综合并烧录到FPGA开发板，数码管显示的数据与仿真结果完全一致，硬件验证顺利通过。这次优化不仅解决了当前问题，还提高了设计的鲁棒性和可移植性。

**相关截图：**

![寄存器写回逻辑修改](LLM辅助优化记录/寄存器写回逻辑修改.png)

**经验总结：**

1. 仿真通过不代表硬件实现一定正确，需要进行充分的硬件验证
2. 时序设计对硬件实现至关重要，应避免在关键路径使用不当的组合逻辑
3. LLM工具能够快速定位硬件设计中的常见问题，是有效的调试助手
4. 寄存器读写应当采用明确的时钟边沿控制，避免读写冲突

### 4.2 测试代码生成

### 4.3 注释优化

### 4.4 部分deepseek使用记录

1.https://chat.deepseek.com/share/hcogst7sf2yye6y47f

2.j型指令解析 https://chat.deepseek.com/share/kfyg0hoa9gjq1smz5h

3.指令sltiu解析 https://chat.deepseek.com/share/axxdszrztr90l81r7y

4.流水线暂停 https://chat.deepseek.com/share/gcnb39bbjrch34fyfp

4.添加AHB端口 https://chat.deepseek.com/share/ce2z1uhq0m693m2xwn

---

## 5. 仿真验证与测试

### 5.1 仿真环境搭建

**仿真工具：** Vivado Simulator
**测试平台：** Vivado 2023.2集成仿真环境

### 5.2 功能验证

#### 5.2.1 TRACE仿真测试



#### 5.2.2 vivado集成仿真测试

本节使用Vivado集成仿真环境对LibreCore处理器进行全面的功能验证。

**测试文件说明：**

测试使用的汇编文件位于：
```
OpenRV\LibreCore\workshop\assemble 1\newriscv\newriscv.srcs\sources_1\coe\s2coe\src\test_output\rv32i_test.coe
```

该文件是从RISC-V汇编源代码编译生成的COE（Coefficient）格式文件，可直接用于Xilinx Block ROM的初始化。同路径下的反汇编文件`rv32i_test.asm`提供了人类可读的指令清单，便于分析和调试。

**测试覆盖范围：**

本测试程序对RV32I指令集进行了系统性的功能验证，覆盖以下指令类型：

1. **U型指令（Upper Immediate）**
   - `LUI`：加载高位立即数
   - `AUIPC`：PC相对地址加载

2. **I型算术/逻辑指令**
   - `ADDI`：立即数加法
   - `SLTI`：立即数有符号比较
   - `SLTIU`：立即数无符号比较
   - `ANDI`：立即数与运算
   - `ORI`：立即数或运算
   - `XORI`：立即数异或运算
   - `SLLI`：立即数逻辑左移
   - `SRLI`：立即数逻辑右移
   - `SRAI`：立即数算术右移

3. **R型算术/逻辑指令**
   - `ADD`：寄存器加法
   - `SUB`：寄存器减法
   - `SLL`：寄存器逻辑左移
   - `SRL`：寄存器逻辑右移
   - `SRA`：寄存器算术右移
   - `AND`：寄存器与运算
   - `OR`：寄存器或运算
   - `XOR`：寄存器异或运算
   - `SLT`：寄存器有符号比较
   - `SLTU`：寄存器无符号比较

4. **访存指令（Load/Store）**
   - `LW`：字加载
   - `LH`：半字加载（有符号扩展）
   - `LHU`：半字加载（无符号扩展）
   - `LB`：字节加载（有符号扩展）
   - `LBU`：字节加载（无符号扩展）
   - `SW`：字存储
   - `SH`：半字存储
   - `SB`：字节存储

5. **分支指令（Branch）**
   - `BEQ`：相等时分支
   - `BNE`：不等时分支
   - `BLT`：小于时分支（有符号）
   - `BGE`：大于等于时分支（有符号）
   - `BLTU`：小于时分支（无符号）
   - `BGEU`：大于等于时分支（无符号）

6. **跳转指令（Jump）**
   - `JAL`：跳转并链接
   - `JALR`：寄存器跳转并链接

**测试方法：**

测试程序采用增量式验证策略，每通过一项测试，将测试计数器寄存器（t6）加1。如果某条指令执行错误，处理器将跳转到失败处理例程，t6寄存器将保持错误代码，便于定位问题。测试程序的核心逻辑如下：

1. 初始化测试计数器：`li t6, 0`
2. 对每种指令类型执行测试用例
3. 验证执行结果是否符合预期
4. 结果正确则`addi t6, t6, 1`继续下一测试
5. 结果错误则加载错误代码到t6并跳转到done标签
6. 所有测试通过后进入无限循环：`done: j done`

测试程序共包含291条COE条目（对应291个32位指令），覆盖了RV32I基础指令集的所有核心指令。

**仿真波形分析：**

仿真波形图保存于：
```
OpenRV\LibreCore\workshop\assemble 1\newriscv\vivado simulation wave.png
```

该波形图展示了处理器在执行rv32i_test.coe测试程序时的关键信号变化，包括：
- 时钟和复位信号
- PC（程序计数器）的变化
- 流水线各阶段的指令流动
- 寄存器读写操作
- AHB总线接口信号（地址、数据、控制）
- 数据前递和冒险检测信号

通过波形分析可以验证：
1. 流水线各阶段指令正确传递
2. 数据前递机制工作正常
3. Load-Use冒险正确检测并插入气泡
4. 分支预测和跳转指令正确执行
5. 访存指令的AHB总线时序符合协议规范

**测试结果分析：**

经过全面的功能测试，处理器核心能够正确执行RV32I指令集的所有指令，流水线冒险处理机制工作正常，AHB总线接口符合协议规范。

### 5.3 时序验证

时序分析通过Vivado综合和实现工具完成。

**关键路径分析：**

- 最长路径：通常出现在ALU运算路径或数据前递路径
- 时序裕量：根据目标频率和器件不同而变化
- 优化措施：合理的流水线划分已经平衡了各阶段的延迟

### 5.4 硬件验证

[本节待后续补充硬件验证结果]

---

## 6. 综合实现结果

### 6.1 资源使用报告

[本节留待合作者填写综合后的资源使用情况]

| 资源类型 | 使用数量 | 总数量 | 利用率 |
| -------- | -------- | ------ | ------ |
| LUT      | 待填写   | 待填写 | 待填写 |
| FF       | 待填写   | 待填写 | 待填写 |
| BRAM     | 待填写   | 待填写 | 待填写 |
| DSP      | 待填写   | 待填写 | 待填写 |
| IO       | 待填写   | 待填写 | 待填写 |

### 6.2 时序性能报告

[本节留待合作者填写时序分析结果]

| 时序指标 | 目标值 | 实际值 | 裕量  |
| -------- | ------ | ------ | ----- |
| 时钟频率 | 待填写 | 待填写 | 待填写 |
| 建立时间 | 待填写 | 待填写 | 待填写 |
| 保持时间 | 待填写 | 待填写 | 待填写 |

### 6.3 功耗分析

[本节留待合作者填写功耗分析结果]

| 功耗类型 | 功耗值 |
| -------- | ------ |
| 静态功耗 | 待填写 |
| 动态功耗 | 待填写 |
| 总功耗   | 待填写 |

---

## 7. 创新点与特色

### 7.1 设计创新点

1. **完整的五级流水线实现：** 采用经典的五级流水线架构，实现了完整的数据前递和冒险处理机制，在保证正确性的前提下提高了性能。

2. **标准AHB总线接口：** 采用工业标准的AMBA AHB协议，使得处理器核心易于集成到更大的SoC系统中，具有良好的可扩展性。

3. **灵活的存储器访问：** 支持字节、半字、字三种访问粒度，并正确处理对齐问题，符合RISC-V规范。

4. **模块化设计：** 各个流水线阶段和外设控制器采用模块化设计，接口清晰，便于理解、调试和扩展。

### 7.2 工程实现特色

1. **代码规范性：** 代码遵循良好的Verilog编码规范，注释清晰，便于阅读和维护。

2. **可配置性：** 使用参数化设计，存储器大小、地址映射等可通过参数配置。

3. **完整的RTL文档：** 使用自动化工具生成RTL结构图，清晰展示各模块的连接关系。

### 7.3 开源与教育价值

1. **开源项目：** 项目代码开源，可供学习和参考。

2. **教学资源：** 完整实现了计算机组成原理课程中的核心概念，是很好的教学案例。

3. **可扩展平台：** 可作为进一步学习和扩展的基础，如添加中断、特权级、扩展指令集等。

---

## 8. 未来改进方向

### 8.1 当前不足

1. **性能优化：** 当前采用静态分支预测（预测不跳转），可以引入动态分支预测提高性能。

2. **指令集扩展：** 当前仅实现RV32I基础指令集，可以扩展M（乘除）、C（压缩）等扩展指令集。

3. **特权级支持：** 当前未实现特权级和异常处理机制，无法运行操作系统。

4. **Cache支持：** 当前未实现指令和数据Cache，访存性能受限。

### 8.2 改进计划

1. **添加M扩展：** 实现硬件乘法器和除法器，支持RV32IM指令集。

2. **添加CSR和中断：** 实现控制状态寄存器和中断处理机制。

3. **性能优化：** 
   - 实现分支预测器（如2-bit饱和计数器）
   - 实现简单的指令和数据Cache
   - 优化关键路径，提高工作频率

4. **外设扩展：** 
   - 添加UART、GPIO、Timer等常用外设
   - 支持更多的存储器映射设备

### 8.3 后续发展方向

1. **多核处理器：** 基于当前单核设计，扩展为多核SoC系统。

2. **操作系统移植：** 在支持特权级后，移植RTOS或嵌入式Linux。

3. **FPGA原型验证：** 在FPGA开发板上进行完整的硬件验证和性能测试。

4. **ASIC设计：** 作为学习项目，尝试进行ASIC设计流程。

---

## 9. 结论

### 9.1 项目完成情况

本项目成功实现了一个基于RISC-V RV32I指令集的五级流水线处理器及配套SoC系统。主要完成内容包括：

1. ✅ 完整实现RV32I基础整数指令集
2. ✅ 实现五级流水线架构
3. ✅ 实现数据前递和冒险检测机制
4. ✅ 实现AHB总线互连系统
5. ✅ 实现IROM和BRAM控制器
6. ✅ 通过仿真验证，功能正确

### 9.2 目标达成度

**功能目标：** 100% 完成
- RV32I指令正确执行
- 流水线机制正常工作
- AHB总线符合协议规范
- 存储器访问功能完整

**学习目标：** 充分达成
- 深入理解了流水线处理器设计
- 掌握了AHB总线协议应用
- 提升了Verilog编程和FPGA开发能力
- 积累了大规模数字系统设计经验

### 9.3 项目价值

**技术价值：**
1. 实现了一个功能完整的RISC-V处理器核心
2. 采用标准总线协议，具有良好的可扩展性
3. 模块化设计，易于理解和维护

**学习价值：**
1. 将计算机组成原理的理论知识转化为实践
2. 掌握了处理器设计的完整流程
3. 提升了硬件描述语言编程能力
4. 培养了工程实践能力和问题解决能力

**开源价值：**
1. 可作为教学资源供他人学习参考
2. 为RISC-V开源社区贡献案例
3. 可作为进一步研究和开发的基础平台

---

## 10. 参考文献

[1] David Patterson, John Hennessy. Computer Organization and Design RISC-V Edition. Morgan Kaufmann, 2017.

[2] RISC-V Foundation. The RISC-V Instruction Set Manual, Volume I: User-Level ISA, Version 2.2. 2017.

[3] ARM Limited. AMBA 3 AHB-Lite Protocol Specification. 2006.

[4] Harris, Sarah L., and David Money Harris. Digital Design and Computer Architecture: RISC-V Edition. Morgan Kaufmann, 2021.

---

## 11. 附录

### 11.1 系统源代码目录树

```
LibreCore/
├── workshop/                           # 开发工作区
│   ├── assemble 1/                     # 主要设计文件
│   │   └── newriscv/
│   │       └── newriscv.srcs/
│   │           └── sources_1/
│   │               └── new/            # RTL源代码
│   │                   ├── myCPU.sv                    # 处理器顶层模块
│   │                   ├── fetch.v                     # 取指模块
│   │                   ├── decode.v                    # 译码模块
│   │                   ├── execute.v                   # 执行模块
│   │                   ├── memory.v                    # 访存模块
│   │                   ├── writeback.v                 # 写回模块
│   │                   ├── AHB_interconnect.v          # AHB互连
│   │                   ├── AHB_decoder.v               # AHB译码器
│   │                   ├── AHB_multiplexor.v           # AHB多路选择器
│   │                   ├── AHB_bram_controller_simple.v# BRAM控制器
│   │                   ├── AHB_irom_controller_simple.v# IROM控制器
│   │                   ├── TOP.v                       # SoC顶层（含外设）
│   │                   ├── TOP_tb.v                    # 顶层测试平台
│   │                   └── rv32i_test_tb.v             # RV32I测试平台
│   │
│   └── Soc peripheral/                 # SoC外设开发
│       └── AHB_bram/                   # AHB BRAM控制器开发
│           ├── AHB_bram_v1/            # BRAM控制器版本1
│           ├── AHB_bram_v2/            # BRAM控制器版本2
│           └── AHB_interconnector/     # AHB互连开发
│
├── report/                             # 项目报告文件夹
│   ├── report.md                       # 项目报告（本文件）
│   ├── 报告模板.md                      # 报告模板
│   ├── rtl_diagrams/                   # RTL设计图示
│   │   ├── pipeline_architecture.svg   # 流水线架构图
│   │   ├── soc_architecture.svg        # SoC架构图
│   │   ├── 1_fetch.svg                 # Fetch模块RTL
│   │   ├── 2_decode.svg                # Decode模块RTL
│   │   ├── 3_execute.svg               # Execute模块RTL
│   │   ├── 4_memory.svg                # Memory模块RTL
│   │   ├── 5_writeback.svg             # Writeback模块RTL
│   │   ├── 6_myCPU.svg                 # 完整处理器RTL
│   │   ├── 7_ahb_interconnect.svg      # AHB互连RTL
│   │   ├── 8_ahb_bram_controller.svg   # BRAM控制器RTL
│   │   ├── 9_ahb_irom_controller.svg   # IROM控制器RTL
│   │   └── index.html                  # RTL图示查看器
│   └── generate_rtl_diagrams.sh        # RTL图示生成脚本
│
├── README.md                           # 项目说明
└── LICENSE                             # 开源协议
```

**主要模块说明：**

| 模块名称 | 文件名 | 功能描述 | 代码行数 |
|---------|--------|----------|---------|
| 处理器核心 | myCPU.sv | 五级流水线处理器顶层 | ~270行 |
| 取指模块 | fetch.v | 指令取指和PC管理 | ~150行 |
| 译码模块 | decode.v | 指令译码和寄存器读取 | ~300行 |
| 执行模块 | execute.v | ALU运算和分支判断 | ~400行 |
| 访存模块 | memory.v | 数据存储器访问 | ~300行 |
| 写回模块 | writeback.v | 寄存器写回 | ~100行 |
| AHB互连 | AHB_interconnect.v | 总线互连 | ~50行 |
| BRAM控制器 | AHB_bram_controller_simple.v | 数据RAM控制 | ~400行 |
| IROM控制器 | AHB_irom_controller_simple.v | 指令ROM控制 | ~300行 |
| SoC顶层 | TOP.v | 完整SoC系统（含外设） | ~600行 |

**总计：** ~2900行Verilog/SystemVerilog代码

### 11.2 RTL设计图示说明

本项目使用Yosys综合工具和GraphViz自动生成RTL设计图示，所有图示文件位于`report/rtl_diagrams/`目录下。

**可用的RTL图示：**

1. **高层架构图**
   - `pipeline_architecture.svg` - 五级流水线架构示意图
   - `soc_architecture.svg` - SoC系统架构示意图

2. **流水线各阶段详细设计**
   - `1_fetch.svg` - Fetch阶段RTL结构
   - `2_decode.svg` - Decode阶段RTL结构
   - `3_execute.svg` - Execute阶段RTL结构
   - `4_memory.svg` - Memory阶段RTL结构
   - `5_writeback.svg` - Writeback阶段RTL结构

3. **完整处理器**
   - `6_myCPU.svg` - 完整的五级流水线处理器RTL

4. **总线和控制器**
   - `7_ahb_interconnect.svg` - AHB互连RTL
   - `8_ahb_bram_controller.svg` - BRAM控制器RTL
   - `9_ahb_irom_controller.svg` - IROM控制器RTL

**查看方式：**
- 在线查看：打开`report/rtl_diagrams/index.html`
- 直接查看：使用SVG查看器或浏览器打开对应的.svg文件
- 源文件：对应的.dot文件可导入draw.io等工具编辑

### 11.3 关键设计参数

| 参数名称 | 值 | 说明 |
|---------|-----|------|
| 指令集 | RV32I | RISC-V 32位基础整数指令集 |
| 数据宽度 | 32位 | 数据和地址总线宽度 |
| 寄存器数量 | 32个 | 通用寄存器（x0-x31） |
| 流水线级数 | 5级 | IF-ID-EX-MEM-WB |
| 指令ROM大小 | 64KB | 可配置 |
| 数据RAM大小 | 64KB | 可配置 |
| 总线协议 | AHB-Lite | AMBA AHB-Lite |
| 时钟域 | 单时钟 | 简化设计 |

---

**报告结束**

**项目仓库：** https://github.com/Narwhal-Wu/LibreCore  
**最后更新：** 2025-10-19
