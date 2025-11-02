# OpenRV 竞赛海报

## 概述

本目录包含为2025年全国大学生嵌入式芯片与系统设计竞赛——FPGA创新设计大赛 AMD赛道生成的参赛海报。

## 文件说明

- `OpenRV_Competition_Poster.pdf` - 最终生成的竞赛海报（A1横向尺寸）
- `generate_poster.py` - 海报生成脚本

## 海报信息

- **竞赛名称**: 2025年全国大学生嵌入式芯片与系统设计竞赛
- **赛道类型**: FPGA创新设计大赛 AMD赛道 - 自主选题初级赛道
- **团队名称**: 自由内核 (LibreCore)
- **作品名称**: OpenRV - 基于RISC-V的五级流水线处理器及SoC系统
- **页面尺寸**: A1横向 (841mm x 594mm)
- **文件大小**: < 1MB（远小于50MB限制）

## 海报内容

海报包含以下主要内容：

1. **项目标题与竞赛信息**
   - 竞赛名称和赛道类型
   - 项目名称（OpenRV）
   - 团队名称（自由内核）

2. **项目摘要**
   - RISC-V RV32I五级流水线软核
   - AHB-Lite总线协议
   - 外设即插即用设计

3. **核心特性**（6大特性）
   - RV32I指令集
   - 五级流水线
   - 数据前递
   - AHB总线
   - BRAM存储
   - 丰富外设

4. **系统架构**
   - CPU核心流水线结构
   - AHB总线互连
   - 存储系统（IROM/BRAM）
   - 外设接口

5. **技术规格**
   - 指令集架构、流水线级数
   - 总线协议、目标频率
   - 存储器配置
   - 开发工具和目标器件

6. **项目亮点**
   - 完整流水线实现
   - 标准总线协议
   - 模块化设计
   - 开源项目

## 如何重新生成海报

如果需要修改海报内容并重新生成，请按以下步骤操作：

### 1. 安装依赖

```bash
# 安装Python包
pip3 install reportlab Pillow matplotlib

# 安装中文字体（Ubuntu/Debian）
sudo apt-get install fonts-wqy-microhei fonts-wqy-zenhei
```

### 2. 运行生成脚本

```bash
python3 generate_poster.py
```

### 3. 验证生成结果

```bash
# 查看文件大小
ls -lh OpenRV_Competition_Poster.pdf

# 检查PDF文件
file OpenRV_Competition_Poster.pdf
```

## 自定义海报

如需自定义海报内容，请编辑 `generate_poster.py` 文件：

- **颜色方案**: 修改文件开头的 `COLOR_*` 变量
- **内容文本**: 修改各个 `draw_*` 函数中的文本内容
- **布局调整**: 修改坐标和尺寸参数（以毫米为单位）
- **字体大小**: 修改 `c.setFont()` 调用中的字号参数

## 技术说明

- **PDF库**: ReportLab（Python PDF生成库）
- **页面尺寸**: A1 (594mm x 841mm) 横向布局
- **字体支持**: 使用文泉驿微米黑字体支持中文
- **颜色方案**: 现代科技蓝色主题
- **布局**: 三栏式布局，内容分区清晰

## 注意事项

1. 海报文件大小远小于50MB限制（实际约56KB）
2. 使用标准A1尺寸，适合打印和展示
3. 支持中英文混排
4. 采用专业配色方案，视觉效果良好

## 联系方式

- **GitHub仓库**: https://github.com/Narwhal-Wu/LibreCore
- **项目文档**: 请参阅 `report/` 目录下的详细报告

---

*本海报由自动化脚本生成，确保内容与项目文档保持一致*
