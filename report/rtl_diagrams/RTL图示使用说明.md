# RTL 设计图示集成说明

## 项目中已生成的 RTL 图示

本项目使用 Yosys + GraphViz 工具链自动生成了完整的 RTL 设计图示，位于 `report/rtl_diagrams/` 目录。

## 快速使用

### 在线查看
打开 `report/rtl_diagrams/index.html` 即可在浏览器中查看所有图示。

### 插入到报告中

#### 系统架构部分 (第2节)

```markdown
## 2. 需求分析与系统设计

### 2.2 系统架构设计

#### 2.2.1 顶层架构

![SoC 系统架构](rtl_diagrams/soc_architecture.svg)

**图 2.1** SoC 系统顶层架构，展示了 myCPU 处理器、AHB 总线互连、存储控制器和外设之间的连接关系。

系统包含以下主要组件：
- **myCPU 处理器**: 五级流水线 RISC-V RV32I 处理器核心
- **AHB 总线互连**: 连接处理器与存储子系统
- **存储控制器**: IROM 控制器（指令存储）和 BRAM 控制器（数据存储）
- **外设模块**: UART、7 段数码管、LED、按键等

#### 2.2.2 五级流水线架构

![五级流水线架构](rtl_diagrams/pipeline_architecture.svg)

**图 2.2** 五级流水线处理器架构，展示了 IF-ID-EX-MEM-WB 各阶段及其数据通路。

流水线特性：
- **数据前推**: 支持 EX-EX 和 MEM-EX 前推，减少数据冒险停顿
- **冒险检测**: Load-Use 冒险检测与流水线停顿控制
- **双总线**: 独立的指令和数据 AHB 总线接口
```

#### 详细设计部分 (第3节)

```markdown
## 3. 详细设计与实现

### 3.2 关键模块设计

#### 3.2.1 Fetch 阶段（取指）

![Fetch 阶段设计](rtl_diagrams/1_fetch.svg)

**图 3.1** Fetch 阶段详细设计

**功能描述:**
Fetch 阶段负责从指令存储器获取指令，并管理程序计数器 (PC)。

**端口定义:**
- 输入: CLK, RES, HRDATA_I, HREADY_I, PC_next, branch_taken
- 输出: PC, HADDR_I, IF_ID_pc, IF_ID_inst

**主要逻辑:**
1. PC 更新逻辑：支持顺序递增和分支跳转
2. AHB 指令接口控制
3. IF/ID 流水线寄存器

#### 3.2.2 Decode 阶段（译码）

![Decode 阶段设计](rtl_diagrams/2_decode.svg)

**图 3.2** Decode 阶段详细设计

**功能描述:**
Decode 阶段对指令进行译码，读取寄存器，并生成立即数。

**主要逻辑:**
1. 指令译码：识别指令类型和操作码
2. 寄存器读取：从寄存器文件读取 rs1 和 rs2
3. 立即数生成：根据指令格式生成不同类型的立即数
4. 冒险检测：检测 Load-Use 数据冒险

#### 3.2.3 Execute 阶段（执行）

![Execute 阶段设计](rtl_diagrams/3_execute.svg)

**图 3.3** Execute 阶段详细设计

**功能描述:**
Execute 阶段执行算术/逻辑运算，计算分支条件和跳转目标。

**主要逻辑:**
1. ALU 运算：支持 RV32I 所有算术和逻辑运算
2. 分支判断：计算分支条件是否满足
3. 跳转目标：计算跳转指令的目标地址
4. 数据前推：接收前推数据，解决数据冒险

#### 3.2.4 Memory 阶段（访存）

![Memory 阶段设计](rtl_diagrams/4_memory.svg)

**图 3.4** Memory 阶段详细设计

**功能描述:**
Memory 阶段通过 AHB 总线访问数据存储器，执行 Load/Store 操作。

**主要逻辑:**
1. AHB 数据接口控制
2. Load 操作：从存储器读取数据
3. Store 操作：向存储器写入数据
4. 数据对齐：处理字节、半字、字访问

#### 3.2.5 Writeback 阶段（写回）

![Writeback 阶段设计](rtl_diagrams/5_writeback.svg)

**图 3.5** Writeback 阶段详细设计

**功能描述:**
Writeback 阶段将计算结果或读取的数据写回寄存器文件。

**主要逻辑:**
1. 写回数据选择：从 ALU 结果或 Memory 数据中选择
2. 寄存器写使能：生成寄存器写入信号

### 3.3 完整 CPU 集成

![myCPU 完整处理器](rtl_diagrams/6_myCPU.svg)

**图 3.6** myCPU 完整五级流水线处理器集成

此图展示了所有五个流水线阶段的完整集成，包括：
- 五个流水线阶段模块
- 32 个通用寄存器
- 流水线控制逻辑
- 数据前推网络
- 冒险检测单元

### 3.4 AHB 总线子系统

#### AHB 互连

![AHB 互连](rtl_diagrams/7_ahb_interconnect.svg)

**图 3.7** AHB 总线互连设计

AHB 互连负责将 CPU 的访问请求路由到正确的从设备（IROM 或 BRAM）。

#### BRAM 控制器

![BRAM 控制器](rtl_diagrams/8_ahb_bram_controller.svg)

**图 3.8** AHB BRAM 控制器设计

BRAM 控制器将 AHB 协议转换为 BRAM 接口协议。

#### IROM 控制器

![IROM 控制器](rtl_diagrams/9_ahb_irom_controller.svg)

**图 3.9** AHB IROM 控制器设计

IROM 控制器专门用于指令存储器访问，仅支持读操作。
```

## 在 Word/PowerPoint 中使用

1. 打开 `report/rtl_diagrams/` 目录
2. 每个模块都有对应的 PNG 文件（如 `1_fetch.png`）
3. 在 Word 中：插入 → 图片 → 从文件
4. 在 PowerPoint 中：插入 → 图片 → 从文件
5. 建议使用 SVG 格式以获得更好的显示效果（需要 Office 2016 或更高版本）

## 可用的图示列表

### 高层架构图
- `pipeline_architecture.svg/png` - 流水线整体架构
- `soc_architecture.svg/png` - SoC 系统架构

### 流水线阶段
1. `1_fetch.svg/png` - Fetch 阶段
2. `2_decode.svg/png` - Decode 阶段
3. `3_execute.svg/png` - Execute 阶段
4. `4_memory.svg/png` - Memory 阶段
5. `5_writeback.svg/png` - Writeback 阶段

### 完整设计
- `6_myCPU.svg/png` - 完整 CPU 集成

### AHB 总线
- `7_ahb_interconnect.svg/png` - AHB 互连
- `8_ahb_bram_controller.svg/png` - BRAM 控制器
- `9_ahb_irom_controller.svg/png` - IROM 控制器

## 重新生成图示

如果修改了 RTL 代码，运行以下命令重新生成所有图示：

```bash
cd /path/to/LibreCore
bash report/generate_rtl_diagrams.sh
```

## 查看详细文档

- 中文完整文档：`report/rtl_diagrams/README.md`
- 使用指南：`report/rtl_diagrams/使用指南.md`
- 在线查看器：`report/rtl_diagrams/index.html`
