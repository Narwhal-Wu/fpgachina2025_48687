# 框图改进总结 (Block Diagram Improvements Summary)

## 改进概述 (Overview)

本次改进主要针对报告中的框图进行优化，使其更加清晰、整洁，并采用标准的数字电路框图风格。

This improvement focuses on optimizing the block diagrams in the report to make them clearer, more organized, and using standard digital circuit diagram style.

---

## 主要改进内容 (Main Improvements)

### 1. 系统架构图优化 (System Architecture Diagram Optimization)

#### 五级流水线架构图 (Pipeline Architecture)
- **改进前**: 简单的框图，颜色单一，标注不够清晰
- **改进后**: 
  - ✅ 采用分层设计，流水线寄存器单独标注
  - ✅ 每个阶段使用不同的颜色区分（IF-蓝色、ID-绿色、EX-红色、MEM-紫色、WB-橙色）
  - ✅ 控制单元和存储器接口分组展示
  - ✅ 信号连接使用不同线型和颜色标注（实线-主数据流、虚线-控制信号、点线-反馈信号）
  - ✅ 中英文双语标注，便于理解

#### SoC 系统架构图 (SoC System Architecture)
- **改进前**: 平面布局，层次不够清晰
- **改进后**:
  - ✅ 采用层次化设计，外部接口在顶部
  - ✅ SoC 内部使用大框包裹，结构清晰
  - ✅ 各子系统（CPU、AHB、存储、外设）独立分组，使用不同颜色
  - ✅ 时钟分发路径使用虚线标注
  - ✅ 数据流向清晰，包含图例说明
  - ✅ 外设连接关系完整展示

### 2. 新增流水线各阶段模块框图 (New Pipeline Stage Module Diagrams)

为每个流水线阶段创建了独立的清晰框图，采用统一的设计风格：

#### 取指模块 (Fetch Module)
- **文件**: `module_fetch.svg`
- **特点**:
  - 输入信号、输出信号和内部逻辑分组展示
  - 关键组件（PC 寄存器、PC 更新控制、AHB 接口、流水线寄存器）清晰标注
  - 信号流向明确，包含控制逻辑说明

#### 译码模块 (Decode Module)
- **文件**: `module_decode.svg`
- **特点**:
  - 展示指令译码、立即数生成、寄存器读取的完整流程
  - 数据前递单元和冒险检测单元突出显示
  - 多个输入源的数据流向清晰

#### 执行模块 (Execute Module)
- **文件**: `module_execute.svg`
- **特点**:
  - ALU 运算、分支判断、跳转地址计算分组展示
  - 操作数选择逻辑清晰
  - PC_next 生成流程完整

#### 访存模块 (Memory Module)
- **文件**: `module_memory.svg`
- **特点**:
  - 访存控制、数据对齐逻辑突出
  - AHB 接口信号完整标注
  - Load/Store 数据路径分别展示

#### 写回模块 (Writeback Module)
- **文件**: `module_writeback.svg`
- **特点**:
  - 写回数据选择逻辑清晰
  - 与寄存器堆的连接关系明确
  - 包含功能注意事项说明

### 3. 设计风格统一 (Unified Design Style)

所有新的框图采用统一的设计风格：

#### 配色方案 (Color Scheme)
- **蓝色系**: 输入信号和控制信号
- **绿色系**: 输出信号和数据信号
- **红色系**: ALU 和执行相关模块
- **橙色系**: 流水线寄存器
- **紫色系**: 访存相关模块
- **黄色系**: 控制单元

#### 图形元素 (Graphical Elements)
- **圆角矩形**: 功能模块
- **椭圆形**: 输入/输出信号
- **圆柱形**: 存储器
- **实线箭头**: 主数据流
- **虚线箭头**: 读取数据返回
- **点线箭头**: 控制/状态信号

#### 标注规范 (Labeling Standards)
- 模块名称使用中英文双语
- 功能描述使用列表形式
- 信号连接标注名称和用途
- 关键路径使用粗线和深色标注

---

## 使用方法 (How to Use)

### 查看框图 (View Diagrams)

1. **在线预览**: 打开 `report/rtl_diagrams/index.html` 查看所有框图
2. **报告引用**: 框图已自动更新到 `report/report.md` 中
3. **独立查看**: 
   - SVG 格式：浏览器打开，支持无损缩放
   - PNG 格式：图片查看器打开，适合插入文档

### 文件位置 (File Locations)

```
report/rtl_diagrams/
├── pipeline_architecture.svg      # 流水线架构图（已改进）
├── soc_architecture.svg           # SoC 架构图（已改进）
├── module_fetch.svg               # 取指模块框图（新增）
├── module_decode.svg              # 译码模块框图（新增）
├── module_execute.svg             # 执行模块框图（新增）
├── module_memory.svg              # 访存模块框图（新增）
├── module_writeback.svg           # 写回模块框图（新增）
├── 1_fetch.svg                    # 取指模块 RTL（详细，参考用）
├── 2_decode.svg                   # 译码模块 RTL（详细，参考用）
├── 3_execute.svg                  # 执行模块 RTL（详细，参考用）
├── 4_memory.svg                   # 访存模块 RTL（详细，参考用）
├── 5_writeback.svg                # 写回模块 RTL（详细，参考用）
├── 6_myCPU.svg                    # 完整处理器 RTL（详细，参考用）
├── 7_ahb_interconnect.svg         # AHB 互连 RTL（详细，参考用）
├── 8_ahb_bram_controller.svg      # BRAM 控制器 RTL（详细，参考用）
├── 9_ahb_irom_controller.svg      # IROM 控制器 RTL（详细，参考用）
└── index.html                     # 框图预览页面
```

### 在报告中使用 (Use in Reports)

报告 `report/report.md` 已更新为引用新的清晰框图：

- 第 2.2.2 节：五级流水线架构 → `pipeline_architecture.svg`
- 第 2.2.3 节：SoC 架构 → `soc_architecture.svg`
- 第 3.2.1 节：Fetch 模块 → `module_fetch.svg`
- 第 3.2.2 节：Decode 模块 → `module_decode.svg`
- 第 3.2.3 节：Execute 模块 → `module_execute.svg`
- 第 3.2.4 节：Memory 模块 → `module_memory.svg`
- 第 3.2.5 节：Writeback 模块 → `module_writeback.svg`

详细的 RTL 图（1_fetch.svg 等）保留作为参考，展示完整的逻辑门级实现。

---

## 技术实现 (Technical Implementation)

### 工具链 (Toolchain)
- **设计工具**: 手工设计 DOT 格式源文件
- **渲染工具**: GraphViz (dot 命令)
- **输出格式**: SVG (矢量图，推荐) 和 PNG (位图)

### 生成命令 (Generation Commands)

```bash
# 生成 SVG 格式
dot -Tsvg pipeline_architecture.dot -o pipeline_architecture.svg

# 生成 PNG 格式（150 DPI）
dot -Tpng -Gdpi=150 pipeline_architecture.dot -o pipeline_architecture.png

# 批量生成所有新框图
for module in pipeline_architecture soc_architecture module_*; do
    dot -Tsvg ${module}.dot -o ${module}.svg
    dot -Tpng -Gdpi=150 ${module}.dot -o ${module}.png
done
```

### 源文件格式 (Source File Format)

所有框图的源文件为 DOT 格式（`.dot` 文件），可以：
- 直接编辑修改
- 导入 GraphViz 重新渲染
- 导入 Draw.io 等工具编辑
- 版本控制友好（文本格式）

---

## 改进效果对比 (Before/After Comparison)

### 改进前 (Before)
- ❌ 框图样式简单，配色单一
- ❌ 层次结构不够清晰
- ❌ 缺少详细的模块框图
- ❌ 标注不够完整
- ❌ 不够美观，专业性欠缺

### 改进后 (After)
- ✅ 采用标准数字电路风格，专业美观
- ✅ 层次清晰，分组合理
- ✅ 每个流水线阶段都有独立的清晰框图
- ✅ 中英文双语标注，功能说明完整
- ✅ 配色优化，视觉舒适
- ✅ 信号流向明确，连接关系清晰
- ✅ 适合报告展示和演示使用

---

## 文档更新 (Documentation Updates)

### 更新的文件 (Updated Files)
1. `report/report.md` - 主报告文档，更新框图引用
2. `report/rtl_diagrams/README.md` - RTL 图示说明文档
3. `report/rtl_diagrams/index.html` - 框图预览页面

### 新增的文件 (New Files)
1. `report/rtl_diagrams/pipeline_architecture.dot` - 流水线架构图源文件
2. `report/rtl_diagrams/soc_architecture.dot` - SoC 架构图源文件
3. `report/rtl_diagrams/module_fetch.dot` - 取指模块源文件
4. `report/rtl_diagrams/module_decode.dot` - 译码模块源文件
5. `report/rtl_diagrams/module_execute.dot` - 执行模块源文件
6. `report/rtl_diagrams/module_memory.dot` - 访存模块源文件
7. `report/rtl_diagrams/module_writeback.dot` - 写回模块源文件
8. 对应的 `.svg` 和 `.png` 文件

---

## 总结 (Summary)

本次改进成功地将报告中的框图提升到专业水平：

1. **专业性**: 采用标准数字电路框图风格，符合学术和工程规范
2. **清晰性**: 层次分明，功能模块清晰，信号流向明确
3. **完整性**: 从系统架构到各模块细节，文档完整
4. **实用性**: 既有清晰的概览图，也有详细的实现图
5. **美观性**: 配色优化，视觉舒适，适合展示

这些改进使得 LibreCore 项目的技术文档更加专业和完善，便于理解和学习。

---

**生成时间**: 2025-10-19  
**工具版本**: GraphViz (dot)  
**文档版本**: v2.0
