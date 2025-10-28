# RV32I 综合测试程序

## 📋 概述

这是一个全面的 RISC-V RV32I 指令集测试程序，用于验证处理器核心的正确性。

### 测试覆盖

总共 **34 项测试**，涵盖以下指令类型：

#### 立即数加载与 PC 相关 (3 tests)
- LUI (Load Upper Immediate)
- AUIPC (Add Upper Immediate to PC)

#### 算术运算 (4 tests)
- ADDI, ADD, SUB, SLTI

#### 逻辑运算 (6 tests)
- ANDI, ORI, XORI
- AND, OR, XOR

#### 移位运算 (6 tests)
- SLLI, SRLI, SRAI (立即数移位)
- SLL, SRL, SRA (寄存器移位)

#### 比较运算 (3 tests)
- SLT, SLTU, SLTIU

#### 内存访问 (4 tests)
- SW/LW (字访问)
- SH/LH (半字访问)
- SB/LB (字节访问)
- LBU/LHU (无符号加载)

#### 分支指令 (6 tests)
- BEQ, BNE
- BLT, BGE
- BLTU, BGEU

#### 跳转指令 (2 tests)
- JAL (Jump and Link)
- JALR (Jump and Link Register)

## 🚀 编译和使用

### 前置要求
- RISC-V GNU Toolchain (riscv64-unknown-elf-*)
- 工具: bin2mem.exe, coemem.exe

### 编译步骤

运行批处理文件：
```batch
build_rv32i_test.bat
```

这将生成以下文件在 `test_output` 目录：
- `rv32i_test.o` - 目标文件
- `rv32i_test.elf` - 可执行文件
- `rv32i_test.bin` - 二进制文件
- `rv32i_test.mem` - 内存格式
- `rv32i_test.coe` - Xilinx COE 格式（用于 FPGA）
- `rv32i_test.asm` - 反汇编文件（用于调试）

### 手动编译

```bash
# 1. 汇编
riscv64-unknown-elf-as -march=rv32i -mabi=ilp32 -o rv32i_test.o rv32i_test.s

# 2. 链接
riscv64-unknown-elf-ld -T linker.ld -o rv32i_test.elf rv32i_test.o

# 3. 生成二进制
riscv64-unknown-elf-objcopy -O binary rv32i_test.elf rv32i_test.bin

# 4. 转换为 MEM 格式
tool\bin2mem.exe rv32i_test.bin rv32i_test.mem

# 5. 转换为 COE 格式
coemem.exe rv32i_test.mem rv32i_test.coe

# 6. 查看反汇编（可选）
riscv64-unknown-elf-objdump -d rv32i_test.elf > rv32i_test.asm
```

## 📊 结果读取

### 数码管/LED 显示说明
本测试程序仅使用 x31 寄存器作为测试结果输出，数码管或 LED 只需读取 x31。

**测试通过：**
- x31 = 34（十进制），LED 显示 0x22。

**测试失败：**
- x31 = 0xffffN，N为失败测试编号（如第1项失败则x31=0xffff1，第2项失败则x31=0xffff2，依次类推）。
- 例如：LUI失败显示0xffff1，AUIPC失败显示0xffff2，ADDI失败显示0xffff3……

**数码管/LED只需连接x31寄存器，无需读取任何内存地址。**

### 在 FPGA 上验证
1. **将 COE 文件加载到 IROM**
   - 使用 Vivado 的 Memory IP 或直接初始化 Block RAM
2. **连接 LED/数码管**
   - 直接读取 CPU x31 寄存器的值进行显示
3. **预期结果**
   - LED 显示 0x22（十进制 34）表示全部通过
   - 显示 0xffffN 表示第N项测试失败

## 🔍 调试

### 查看反汇编
检查 `test_output\rv32i_test.asm` 文件，验证：
1. 指令编码是否正确
2. 寄存器分配是否符合预期
3. 跳转地址是否正确

### 仿真验证
在仿真器中运行时：
1. 设置断点在 `done` 标签
2. 检查寄存器 `x31` 的值（应为 34 或 0xffffN）

### 单步测试
每个测试失败时会直接将 x31 赋值为错误码并跳转到 `done`，可通过 x31 的值快速定位失败项。

## 📝 内存布局

```
0x00000000 - 0x00001FFF: 代码段 (.text)
0x00001000: 内存测试区域
0x00002000: 调试输出区域
0xFFFFFFFC: LED 输出寄存器
```

## ⚠️ 注意事项

1. **寄存器 x31 (t6)** 用作测试计数器，不要在测试中使用
2. **寄存器 x30 (t5)** 用作内存测试基址，不要在测试中使用
3. 确保你的处理器支持 RV32I 基本指令集
4. 不包括 ECALL 和 EBREAK（系统调用和断点指令）
5. 不包括 FENCE 指令（内存屏障）

## 🐛 常见问题

### Q: LED 显示 0x00
**A:** 处理器可能未运行或未初始化。检查时钟和复位信号。

### Q: LED 显示 0xFF
**A:** 某个测试失败。在仿真器中运行，查看在哪个测试失败。

### Q: LED 显示其他值（不是 34）
**A:** 部分测试通过。该值表示通过的测试数量。检查失败的测试。

### Q: 寄存器位置解码不匹配
**A:** 可能是字节序问题。检查：
- COE 文件的字节序
- 处理器的字节序配置
- 内存控制器的数据位宽和字节使能

## 📚 参考

- RISC-V 规范: https://riscv.org/technical/specifications/
- RV32I 指令集编码: Volume I: User-Level ISA
- 指令格式: R-type, I-type, S-type, B-type, U-type, J-type

---

**测试通过标准**: 34/34 ✅
**LED 输出预期值**: 0x22 (十进制 34)
