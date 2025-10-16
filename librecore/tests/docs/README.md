# RV32I 处理器测试框架使用说明

## 概述

本测试框架为 RISC-V RV32I 微处理器提供全面的指令集测试。测试结果通过 7 段数码管显示，支持逐条指令测试以便于调试和问题定位。

## 目录结构

```
librecore/tests/
├── asm/                          # 汇编测试文件
│   ├── test_rv32i_comprehensive.s  # 全面测试套件（34个测试）
│   ├── test_basic.s                # 基础功能测试（3个测试）
│   ├── test_arithmetic.s           # 算术指令测试
│   ├── test_logic.s                # 逻辑指令测试
│   ├── test_shift.s                # 移位指令测试
│   ├── test_branch.s               # 分支指令测试
│   ├── test_memory.s               # 内存操作测试
│   └── test_jump.s                 # 跳转指令测试
├── rtl/                          # RTL 设计文件（从源文件复制）
│   ├── myCPU.sv                   # CPU 核心
│   ├── TOP.v                      # 顶层模块
│   ├── Seven_Seg.v                # 7段显示控制器
│   └── ...（其他模块）
├── testbenches/                  # 测试平台文件
│   └── rv32i_test_tb.v           # 主测试平台
├── tools/                        # 工具脚本
│   └── asm2coe.py                # 汇编到COE转换工具
└── docs/                         # 文档
    └── README.md                 # 本文档
```

## 测试套件说明

### 1. 全面测试套件 (test_rv32i_comprehensive.s)

包含 34 个测试用例，覆盖所有 RV32I 指令：

#### 测试列表：

| 测试编号 | 指令类型 | 测试内容 |
|---------|---------|---------|
| 01 | ADDI | 立即数加法 |
| 02 | ADD | 寄存器加法 |
| 03 | SUB | 寄存器减法 |
| 04 | LUI | 加载高位立即数 |
| 05 | AUIPC | PC相对地址加法 |
| 06 | SLTI | 有符号小于比较（立即数）|
| 07 | SLTIU | 无符号小于比较（立即数）|
| 08 | ANDI | 按位与（立即数）|
| 09 | ORI | 按位或（立即数）|
| 10 | XORI | 按位异或（立即数）|
| 11 | SLLI | 逻辑左移（立即数）|
| 12 | SRLI | 逻辑右移（立即数）|
| 13 | SRAI | 算术右移（立即数）|
| 14 | SLL | 逻辑左移 |
| 15 | SRL | 逻辑右移 |
| 16 | SRA | 算术右移 |
| 17 | SLT | 有符号小于比较 |
| 18 | SLTU | 无符号小于比较 |
| 19 | AND | 按位与 |
| 20 | OR | 按位或 |
| 21 | XOR | 按位异或 |
| 22 | BEQ | 相等分支 |
| 23 | BNE | 不等分支 |
| 24 | BLT | 小于分支（有符号）|
| 25 | BGE | 大于等于分支（有符号）|
| 26 | BLTU | 小于分支（无符号）|
| 27 | BGEU | 大于等于分支（无符号）|
| 28 | JAL | 跳转并链接 |
| 29 | JALR | 寄存器跳转并链接 |
| 30 | SW/LW | 字存储/加载 |
| 31 | SH/LH | 半字存储/加载 |
| 32 | LHU | 半字无符号加载 |
| 33 | SB/LB | 字节存储/加载 |
| 34 | LBU | 字节无符号加载 |

#### 测试结果编码：

- **成功**: x31 = 0x00000022 (十进制 34) - 所有测试通过
- **失败**: x31 = 0xE00nn，其中 nn 是失败的测试编号（十六进制）

### 2. 基础测试 (test_basic.s)

简单的 3 个测试用例，用于验证处理器基本功能：
- ADDI 指令
- ADD 指令
- 内存读写 (SW/LW)

**结果编码**:
- 成功: x31 = 0x00000003
- 失败: x31 = 0xF000n

### 3. 分类测试

为了便于调试特定指令类型，提供了以下分类测试：

- **test_arithmetic.s**: 算术指令 (ADD, ADDI, SUB)
  - 成功: x31 = 3
  - 失败: x31 = 0xA000n

- **test_logic.s**: 逻辑指令 (AND, OR, XOR, ANDI, ORI, XORI)
  - 成功: x31 = 6
  - 失败: x31 = 0xB000n

- **test_shift.s**: 移位指令 (SLL, SRL, SRA, SLLI, SRLI, SRAI)
  - 成功: x31 = 6
  - 失败: x31 = 0xC000n

- **test_branch.s**: 分支指令 (BEQ, BNE, BLT, BGE, BLTU, BGEU)
  - 成功: x31 = 6
  - 失败: x31 = 0xD000n

- **test_memory.s**: 内存操作 (LW, LH, LB, LHU, LBU, SW, SH, SB)
  - 成功: x31 = 5
  - 失败: x31 = 0xD000n

- **test_jump.s**: 跳转指令 (JAL, JALR)
  - 成功: x31 = 2
  - 失败: x31 = 0xE000n

## 使用方法

### 方法 1: 使用 Python 工具编译（推荐）

#### 前提条件：
安装 RISC-V 工具链：

```bash
# Ubuntu/Debian
sudo apt-get install gcc-riscv64-unknown-elf

# 或从源码编译
git clone https://github.com/riscv-collab/riscv-gnu-toolchain
cd riscv-gnu-toolchain
./configure --prefix=/opt/riscv --with-arch=rv32i --with-abi=ilp32
make
```

#### 编译步骤：

1. 进入工具目录：
```bash
cd librecore/tests/tools
```

2. 使汇编转换脚本可执行：
```bash
chmod +x asm2coe.py
```

3. 编译汇编文件到 COE 格式：
```bash
# 编译全面测试
./asm2coe.py ../asm/test_rv32i_comprehensive.s -o ../output

# 编译基础测试
./asm2coe.py ../asm/test_basic.s -o ../output

# 编译特定测试
./asm2coe.py ../asm/test_arithmetic.s -o ../output
```

4. 生成的文件将在 `librecore/tests/output/` 目录：
   - `*.elf` - 可执行文件
   - `*.bin` - 二进制文件
   - `*.hex` - 反汇编文件（调试用）
   - `*.coe` - Xilinx COE 文件（用于 BRAM 初始化）

### 方法 2: 手动编译

#### 使用 RISC-V 工具链：

```bash
# 编译汇编到 ELF
riscv32-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib \
    -Ttext=0x00000000 -o test.elf test.s

# 转换为二进制
riscv32-unknown-elf-objcopy -O binary test.elf test.bin

# 转换为 COE（需要自定义脚本或工具）
```

### 方法 3: 在 Vivado 中使用

1. 打开 Vivado 项目
2. 在 IP Catalog 中找到 Block Memory Generator
3. 配置 IROM (Instruction ROM):
   - Memory Type: Single Port ROM
   - Port A Width: 32 bits
   - Port A Depth: 根据程序大小设置（建议 1024 或更大）
   - Load Init File: 选择生成的 `.coe` 文件
4. 重新生成 IP
5. 在设计中实例化 TOP 模块
6. 综合、实现并生成比特流
7. 下载到 FPGA 板卡

## 在仿真中测试

### 使用 Vivado Simulator：

1. 添加测试平台文件到项目：
```tcl
add_files -fileset sim_1 librecore/tests/testbenches/rv32i_test_tb.v
```

2. 添加 RTL 文件：
```tcl
add_files -fileset sources_1 librecore/tests/rtl/*.v
add_files -fileset sources_1 librecore/tests/rtl/*.sv
```

3. 设置顶层仿真模块：
```tcl
set_property top rv32i_test_tb [get_filesets sim_1]
```

4. 运行仿真：
```tcl
launch_simulation
run 500us
```

5. 查看仿真输出：
   - 控制台将显示测试进度
   - x31 寄存器值变化
   - 最终测试结果

### 使用 Icarus Verilog (开源)：

```bash
cd librecore/tests

# 编译
iverilog -o test_sim \
    -s rv32i_test_tb \
    testbenches/rv32i_test_tb.v \
    rtl/*.v rtl/*.sv

# 运行
vvp test_sim

# 查看波形（可选）
gtkwave test.vcd
```

## 7段数码管显示说明

测试结果通过 x31 寄存器值显示在 7 段数码管上：

### 显示格式：
数码管显示 8 位十六进制数字（32位值）：

```
[7] [6] [5] [4] [3] [2] [1] [0]
 │   │   │   │   │   │   │   │
 └───┴───┴───┴───┴───┴───┴───┴─── x31[31:0] 的十六进制表示
```

### 示例：

| x31 值 | 数码管显示 | 含义 |
|--------|-----------|------|
| 0x00000022 | 00000022 | 全面测试通过（34个测试）|
| 0x00000003 | 00000003 | 基础测试通过（3个测试）|
| 0xE0000001 | E0000001 | 全面测试失败于测试 #1 |
| 0xE000000F | E000000F | 全面测试失败于测试 #15 |
| 0xF00003 | 000F0003 | 基础测试失败于测试 #3 |

## 调试指南

### 1. 识别失败的测试

当测试失败时，x31 的值包含错误代码：

```
x31 = 0xTTTTnnnn
      ││││││││
      │││└────── 测试编号（nn）
      └──────── 测试类型（TT）
```

错误代码前缀：
- `0xE0` - 全面测试失败
- `0xF0` - 基础测试失败
- `0xA0` - 算术测试失败
- `0xB0` - 逻辑测试失败
- `0xC0` - 移位测试失败
- `0xD0` - 分支/内存测试失败

### 2. 定位问题指令

1. 查看测试文件，找到对应编号的测试
2. 检查该测试使用的指令
3. 在仿真波形中查看该指令执行时的信号

### 3. 使用分类测试

如果全面测试失败：
1. 根据失败的测试编号，确定指令类型
2. 运行对应的分类测试（如 test_arithmetic.s）
3. 在更简单的环境中隔离问题

### 4. 检查常见问题

- **立即数符号扩展**: 确保立即数正确进行符号扩展
- **数据前推**: 检查流水线数据前推逻辑
- **内存对齐**: 确保内存访问正确对齐
- **分支预测**: 检查分支跳转目标地址计算
- **ALU 操作**: 验证算术和逻辑操作正确性

## 添加自定义测试

### 创建新测试文件：

```assembly
# my_custom_test.s
.section .text
.global _start

_start:
    li x31, 0           # 初始化测试计数器
    
    # 测试 1: 你的测试代码
    # ...
    beq x1, x2, test1_pass
    li x31, 0xCC001     # 自定义错误代码
    j end
test1_pass:
    addi x31, x31, 1
    
    # 添加更多测试...
    
end:
    j end               # 无限循环停止
```

### 编译并测试：

```bash
cd librecore/tests/tools
./asm2coe.py ../asm/my_custom_test.s -o ../output
```

## 技术规格

### 支持的指令集：
- RV32I 基础整数指令集
- 不包括：ECALL, EBREAK, FENCE 指令

### 内存映射：
- IROM: 0x00000000 - 0x00000FFF (4KB)
- DRAM: 0x00001000 - 0x00001FFF (4KB)
- 外设: 0xFFFF0000 及以上

### 寄存器约定：
- x0: 硬连线为 0
- x31 (t6): 专用于测试结果输出
- x30 (t5): 常用作内存基地址
- 其他: 按照 RISC-V ABI 标准

## 常见问题

### Q: 编译时找不到 RISC-V 工具链？
A: 确保已安装 RISC-V GCC 工具链，并且在 PATH 中。使用 `which riscv32-unknown-elf-gcc` 检查。

### Q: 测试在仿真中没有完成？
A: 检查：
   1. IROM 是否正确加载了 COE 文件
   2. 复位信号是否正确释放
   3. 时钟是否正常工作
   4. 程序起始地址是否为 0x00000000

### Q: 7段数码管显示乱码？
A: 检查：
   1. 数码管控制器时钟分频是否正确
   2. x31 寄存器值是否正确连接到显示模块
   3. 阳极和阴极信号是否正确连接

### Q: 如何查看详细的执行过程？
A: 在仿真中：
   1. 添加波形监视：PC, 指令, 寄存器
   2. 启用测试平台的 debug 输出
   3. 查看反汇编文件 (.hex) 对照执行

## 贡献

欢迎贡献更多测试用例和改进！

### 提交新测试：
1. 在 `asm/` 目录创建测试文件
2. 使用一致的错误代码格式
3. 添加注释说明测试内容
4. 更新本文档

### 报告问题：
- 描述遇到的问题
- 提供测试文件和错误代码
- 包含仿真波形（如果可能）

## 许可证

本测试框架遵循与主项目相同的许可证。

## 联系方式

如有问题或建议，请提交 Issue 到项目仓库。

---

**版本**: 1.0  
**最后更新**: 2025-10-16
