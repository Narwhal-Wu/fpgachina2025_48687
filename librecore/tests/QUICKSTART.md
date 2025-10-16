# RV32I 处理器测试快速开始指南

## 快速开始

### 1. 安装依赖

```bash
# 安装 RISC-V 工具链
sudo apt-get install gcc-riscv64-unknown-elf

# 验证安装
riscv32-unknown-elf-gcc --version
```

### 2. 编译测试程序

```bash
# 进入测试目录
cd librecore/tests

# 编译所有测试
make all

# 或编译特定测试
make basic           # 基础测试
make comprehensive   # 全面测试
```

### 3. 在 Vivado 中使用

1. 打开你的 Vivado 项目
2. 打开 Block Memory Generator IP (IROM)
3. 在"Load Init File"中选择 `output/test_basic.coe`
4. 重新生成 IP
5. 综合并实现设计
6. 下载到 FPGA

### 4. 查看结果

在 FPGA 板卡的 7 段数码管上查看结果：
- **成功**: 显示通过的测试数量（如 `00000003` 表示 3 个测试通过）
- **失败**: 显示错误代码（如 `E0000001` 表示测试 1 失败）

## 测试文件说明

| 文件名 | 测试内容 | 通过显示 |
|--------|---------|---------|
| test_basic.s | 基础功能 (3个测试) | 00000003 |
| test_rv32i_comprehensive.s | 全面测试 (34个测试) | 00000022 |
| test_arithmetic.s | 算术指令 | 00000003 |
| test_logic.s | 逻辑指令 | 00000006 |
| test_shift.s | 移位指令 | 00000006 |
| test_branch.s | 分支指令 | 00000006 |
| test_memory.s | 内存操作 | 00000005 |
| test_jump.s | 跳转指令 | 00000002 |

## 仿真测试

```bash
# 使用 Vivado Simulator
cd librecore/tests
vivado -mode batch -source sim_test.tcl

# 或使用 Icarus Verilog
iverilog -o test_sim -s rv32i_test_tb testbenches/rv32i_test_tb.v rtl/*.v rtl/*.sv
vvp test_sim
```

## 调试失败的测试

如果测试失败，数码管显示错误代码：

1. **记录错误代码**: 例如 `E000000F`
2. **查看测试文件**: 打开对应的 `.s` 文件
3. **找到失败的测试**: 错误代码最后两位是测试编号（0F = 测试 15）
4. **检查该测试的指令**: 查看测试 15 使用了什么指令
5. **在仿真中调试**: 使用波形查看该指令执行时的信号

## 目录结构

```
librecore/tests/
├── asm/           # 汇编源文件
├── rtl/           # RTL 设计文件
├── testbenches/   # 测试平台
├── tools/         # 编译工具
├── output/        # 编译输出（自动生成）
├── docs/          # 详细文档
└── Makefile       # 编译脚本
```

## 获取帮助

- 查看详细文档: `docs/README.md`
- 英文文档: `docs/README_EN.md`
- Makefile 帮助: `make help`

## 示例：运行基础测试

```bash
# 1. 编译基础测试
cd librecore/tests
make basic

# 2. 查看生成的文件
ls output/test_basic.*
# test_basic.elf  - ELF 可执行文件
# test_basic.bin  - 二进制文件
# test_basic.hex  - 反汇编文件
# test_basic.coe  - COE 文件（用于 Vivado）

# 3. 在 Vivado 中加载 COE 文件
# 4. 下载到 FPGA
# 5. 观察 7 段数码管显示
#    - 如果显示 00000003，则所有 3 个基础测试通过！
#    - 如果显示 F0000n，则测试 n 失败
```

## 常见问题

**Q: 找不到 riscv32-unknown-elf-gcc？**  
A: 确保已安装工具链并在 PATH 中。

**Q: 编译出错？**  
A: 检查汇编语法，确保使用 RV32I 指令集。

**Q: 数码管不显示？**  
A: 检查 x31 寄存器是否正确连接到 Seven_Seg 模块。

**Q: 如何添加自己的测试？**  
A: 在 `asm/` 目录创建 `.s` 文件，然后运行 `make`。

---

更多信息请参阅 `docs/README.md`
