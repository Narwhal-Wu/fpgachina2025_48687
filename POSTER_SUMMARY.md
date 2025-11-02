# OpenRV Competition Poster - Summary

## 任务完成总结

已成功为OpenRV项目生成2025年全国大学生嵌入式芯片与系统设计竞赛的参赛海报。

## 生成的文件

### 1. OpenRV_Competition_Poster.pdf
- **文件大小**: 56 KB (0.05 MB)
- **尺寸**: A1横向 (841mm × 594mm)
- **格式**: PDF 1.4
- **状态**: ✅ 远小于50MB要求

### 2. generate_poster.py
- **类型**: Python脚本
- **功能**: 自动生成竞赛海报
- **特性**: 
  - 支持中文字体（文泉驿微米黑）
  - 使用ReportLab库生成专业PDF
  - 完全可定制（颜色、布局、内容）
  - 自动验证文件大小

### 3. POSTER_README.md
- **类型**: 文档
- **内容**: 海报使用说明、重新生成指南、定制方法

## 海报内容概览

### 标题区域
- 竞赛名称：2025年全国大学生嵌入式芯片与系统设计竞赛
- 赛道：FPGA创新设计大赛 AMD赛道 - 自主选题初级赛道
- 项目名称：OpenRV
- 项目副标题：基于RISC-V的五级流水线处理器及SoC系统

### 团队信息
- 团队名称：自由内核 (LibreCore)
- 作品名称：OpenRV
- 目标器件：Xilinx Artix-7 (NEXYS A7)

### 主要内容区域

#### 第一栏 - 项目概述
- **项目摘要**: 介绍RISC-V RV32I五级流水线软核和AHB-Lite总线系统
- **项目亮点** (6条):
  - 完整的五级流水线实现
  - 标准AHB-Lite总线协议
  - 模块化设计
  - 丰富的外设支持
  - 开源项目
  - 完整验证

#### 第二栏 - 核心特性
6个特性展示框：
1. RV32I指令集 - 完整支持RISC-V基础整数指令集
2. 五级流水线 - IF-ID-EX-MEM-WB高效执行架构
3. 数据前递 - 减少流水线停顿提升性能
4. AHB总线 - 标准AMBA协议易于扩展
5. BRAM存储 - 支持字节/半字/字访问模式
6. 外设丰富 - LED/按键/数码管/UART通信

#### 第三栏 - 系统架构与技术规格
- **系统架构图**:
  - 五级流水线CPU核心
  - AHB-Lite总线互连
  - 指令ROM和数据BRAM
  - 外设接口层
  
- **技术规格** (10项):
  - 指令集架构: RISC-V RV32I
  - 流水线级数: 5级
  - 总线协议: AMBA AHB-Lite
  - 目标频率: 50-100 MHz
  - 指令吞吐: CPI ≈ 1
  - 存储器: 指令ROM + 数据BRAM
  - 外设接口: GPIO, UART, 数码管
  - 开发工具: Vivado 2023.2
  - 硬件描述: Verilog/SystemVerilog
  - 目标器件: Xilinx Artix-7

### 页脚
- 项目理念：开源 · 创新 · 协作
- GitHub仓库：Narwhal-Wu/LibreCore

## 设计特点

### 视觉设计
- **配色方案**: 现代科技蓝色主题
  - 主色调：深蓝色 (#1E3A8A)
  - 次要色：亮蓝色 (#3B82F6)
  - 强调色：绿色 (#10B981)、橙色 (#F59E0B)
  
- **布局**: 三栏式响应式布局
  - 清晰的视觉层次
  - 信息分区明确
  - 专业的排版

- **字体**: 
  - 中文：文泉驿微米黑
  - 英文/数字：Helvetica

### 技术实现
- **PDF生成库**: ReportLab (Python)
- **图像处理**: Pillow
- **字体支持**: 完整的中文字符集
- **文件优化**: 使用高效压缩，文件体积小

## 验证结果

✅ **所有要求均已满足**:
1. ✓ PDF格式
2. ✓ 文件大小 < 50MB (实际: 0.05MB)
3. ✓ A1横向尺寸 (841mm × 594mm)
4. ✓ 包含完整的竞赛信息
5. ✓ 包含团队和项目名称
6. ✓ 专业视觉设计
7. ✓ 中文字体正确显示

## 如何使用

### 查看海报
```bash
# Linux/Mac
xdg-open OpenRV_Competition_Poster.pdf

# Windows
start OpenRV_Competition_Poster.pdf
```

### 重新生成海报
```bash
python3 generate_poster.py
```

### 自定义海报
编辑 `generate_poster.py` 文件中的相关函数和参数即可。

详细说明请参阅 `POSTER_README.md`。

## 下一步

海报已成功生成并提交到仓库。可以：
1. 下载PDF文件用于打印或电子提交
2. 根据需要自定义和重新生成
3. 用于竞赛展示和宣传

---

**生成时间**: 2025-11-02  
**仓库**: Narwhal-Wu/LibreCore  
**分支**: copilot/create-embedded-design-poster
