# Linker Script 改进说明

## ✅ 已完成的改进

### 1. **扩展内存空间**
- **改进前**: 64KB (0x10000)
- **改进后**: 256KB (0x40000)
- **原因**: 程序使用到 0x2000 地址，64KB 足够，但扩展到 256KB 为未来预留空间

### 2. **添加栈空间定义**
```ld
STACK_SIZE = 0x2000;  /* 8KB 栈空间 */
_stack_top = ...;     /* 栈顶地址，供 sp 初始化使用 */
```
- 栈从 RAM 顶部向下增长
- 16 字节对齐（符合 RISC-V ABI 标准）

### 3. **添加关键符号**
| 符号 | 用途 |
|------|------|
| `_sdata`, `_edata` | 数据段起始/结束，用于初始化 |
| `_sbss`, `_ebss` | BSS 段起始/结束，用于清零 |
| `_heap_start`, `_heap_end` | 堆区域边界 |
| `_stack_start`, `_stack_top` | 栈区域边界 |
| `_ram_start`, `_ram_end` | RAM 边界 |

### 4. **段排列优化**
```
[0x00000000] .text      ← 代码段（确保 _start 在开头）
             .rodata    ← 只读数据
             .data      ← 初始化数据
             .bss       ← 未初始化数据
             [堆空间]   ← 动态分配（向上增长）
             ...
[RAM 顶部]   [栈空间]   ← 8KB 栈（向下增长）
```

### 5. **添加安全检查**
```ld
ASSERT(_stack_top <= (ORIGIN(RAM) + LENGTH(RAM)), "ERROR: Stack overflows RAM!")
ASSERT(_end < _stack_start, "ERROR: Program data overlaps with stack!")
```

### 6. **支持更多段类型**
- 添加 `.sdata`、`.sbss` 支持（小数据优化）
- 添加 `.srodata` 支持（小只读数据）
- 保留调试段（`.debug_*`）
- 丢弃不需要的段（`.note.*`, `.comment`, `.eh_frame`）

---

## 🔧 建议的汇编代码改进

### **选项 1: 添加栈初始化（可选，当前程序不需要）**

如果未来需要使用栈（函数调用、局部变量等），在 `_start` 开头添加：

```asm
_start:
    # Initialize stack pointer
    la sp, _stack_top       # 加载栈顶地址到 sp 寄存器
    
    # Initialize test counter in x31 (t6)
    li x31, 0
    ...
```

### **选项 2: 添加 BSS 清零（可选，当前程序不需要）**

如果使用了 `.bss` 段的全局未初始化变量：

```asm
_start:
    # Clear BSS section
    la t0, _sbss            # BSS 起始地址
    la t1, _ebss            # BSS 结束地址
clear_bss:
    beq t0, t1, bss_done
    sw zero, 0(t0)
    addi t0, t0, 4
    j clear_bss
bss_done:
    
    # Continue with tests
    li x31, 0
    ...
```

---

## 📊 内存布局对比

### **改进前**
```
0x00000000  ┌─────────────┐
            │ .text       │
            ├─────────────┤
            │ .rodata     │
            ├─────────────┤
            │ .data       │
            ├─────────────┤
            │ .bss        │
            ├─────────────┤
            │ ??? (未定义) │
0x00010000  └─────────────┘ 64KB
```

### **改进后**
```
0x00000000  ┌─────────────┐
            │ .text       │ ← 代码段
            ├─────────────┤
            │ .rodata     │ ← 只读数据
            ├─────────────┤
            │ .data       │ ← 初始化数据
            ├─────────────┤
            │ .bss        │ ← 未初始化数据
            ├─────────────┤
            │             │
            │ HEAP        │ ← 堆（向上增长）
            │ (可用空间)   │
            │             │
            ├─────────────┤ _stack_start
            │             │
            │ STACK       │ ← 栈（向下增长，8KB）
            │             │
0x00040000  └─────────────┘ _stack_top (256KB)
```

---

## 🧪 测试验证

### 编译测试
```powershell
.\build_rv32i_test.bat
```

### 预期输出
```
[1/5] Assembling rv32i_test.s...
Assembly successful!

[2/5] Linking rv32i_test.o...
Linking successful!

[3/5] Generating binary file...
Binary generated!
...
```

### 验证符号表
```powershell
riscv-none-embed-objdump -t test_output\rv32i_test.elf | findstr "stack\|heap\|bss\|data"
```

应该能看到新定义的符号：
```
0003e000 g       *ABS*  0000000 _stack_start
00040000 g       *ABS*  0000000 _stack_top
00000000 g       .bss   0000000 _sbss
00000000 g       .bss   0000000 _ebss
```

---

## 📝 关键改进总结

| 改进项 | 状态 | 重要性 |
|--------|------|--------|
| 扩展内存空间 | ✅ 完成 | 🟢 低（当前够用） |
| 栈空间定义 | ✅ 完成 | 🟡 中（未来可能需要） |
| 有用的符号 | ✅ 完成 | 🟢 高（调试友好） |
| 段对齐优化 | ✅ 完成 | 🟢 高（性能/兼容性） |
| 安全检查 | ✅ 完成 | 🟢 高（防止错误） |
| 调试信息 | ✅ 完成 | 🟡 中（调试辅助） |

---

## 🚀 后续建议

1. **当前程序** - 不需要修改汇编代码，linker.ld 改进已完成
2. **未来开发** - 如果需要函数调用或局部变量，添加栈初始化
3. **测试建议** - 重新编译并检查输出文件大小和符号表

### 立即测试
```powershell
# 重新编译
.\build_rv32i_test.bat

# 查看生成的文件大小
dir test_output\rv32i_test.*

# 查看内存映射
riscv-none-embed-size test_output\rv32i_test.elf
```

---

**改进完成！新的 linker.ld 更加健壮、标准化，并为未来扩展做好了准备。** ✨
