# Installation and Verification Guide

## 📦 Installation

### Prerequisites

#### Option 1: Full Installation (Recommended)
For compiling custom assembly tests:

```bash
# Install RISC-V GCC Toolchain
sudo apt-get update
sudo apt-get install gcc-riscv64-unknown-elf

# Verify installation
riscv32-unknown-elf-gcc --version
```

#### Option 2: Minimal Installation
For using pre-generated examples only:

```bash
# Only Python 3 is required
python3 --version
```

### Getting the Test Framework

The test framework is located in the repository at:
```
LibreCore/librecore/tests/
```

No additional installation needed - all files are included in the repository.

## ✅ Verification

### Step 1: Verify Directory Structure

```bash
cd librecore/tests
ls -l

# Should see:
# - asm/          (assembly test files)
# - rtl/          (RTL design files)
# - testbenches/  (simulation testbenches)
# - tools/        (compilation scripts)
# - docs/         (documentation)
# - Makefile
# - README.md
```

### Step 2: Generate Example COE Files

```bash
cd tools
python3 create_example_coe.py

# Should output:
# - examples/test_basic_manual.coe
# - examples/test_simple_loop.coe
```

Verify files were created:
```bash
ls examples/*.coe
cat examples/test_simple_loop.coe
```

Expected output:
```
memory_initialization_radix=16;
memory_initialization_vector=
00000F93,
001F8F93,
001F8F93,
001F8F93,
0000006F;
```

### Step 3: Compile Assembly Tests (if toolchain installed)

```bash
cd ..  # back to tests directory
make basic

# Should create:
# - output/test_basic.elf
# - output/test_basic.bin
# - output/test_basic.hex
# - output/test_basic.coe
```

Verify compilation:
```bash
ls -lh output/test_basic.*
```

### Step 4: Check RTL Files

Verify RTL modifications:
```bash
# Check that TOP.v connects x31 to 7-segment display
grep -n "test_result" rtl/TOP.v

# Should show:
# Line with: wire [31:0] test_result;
# Line with: assign test_result = cpu_inst.REGS[31];
# Line with: .data(test_result),
```

### Step 5: Verify Documentation

```bash
# Check all documentation is present
ls docs/
# Should show: README.md, README_EN.md, OVERVIEW.md

# Check main README
head -n 20 README.md
```

## 🧪 Testing the Framework

### Test 1: Simulation with Testbench

If you have Icarus Verilog installed:

```bash
# Compile testbench (will fail if IROM not initialized, this is expected)
iverilog -o test_sim \
    -s rv32i_test_tb \
    testbenches/rv32i_test_tb.v \
    rtl/TOP.v rtl/myCPU.sv rtl/Seven_Seg.v

# If compilation succeeds, framework files are correct
echo "Testbench compilation successful!"
```

### Test 2: Makefile Functionality

```bash
# Test makefile help
make help

# Should display usage information

# Test clean
make clean

# Should remove output directory

# Test compilation (if toolchain available)
make basic
ls output/
```

### Test 3: Documentation Accessibility

Open each documentation file and verify readability:

```bash
# English quick reference
cat README.md | head -n 50

# Chinese quick start
cat QUICKSTART.md | head -n 50

# Detailed documentation
cat docs/README.md | head -n 50
```

## 🎯 Quick Functionality Test

### Using Generated Examples (No FPGA Required)

1. Generate example COE:
```bash
cd tools
python3 create_example_coe.py
```

2. Examine the COE file:
```bash
cat examples/test_simple_loop.coe
```

3. Verify the instructions decode correctly:
   - `00000F93` = `li x31, 0`
   - `001F8F93` = `addi x31, x31, 1`
   - `0000006F` = `j 0x10` (loop)

### Expected Results

If you load `test_simple_loop.coe` into IROM and run on FPGA:
- 7-segment display should show: `00000003`
- This indicates 3 increments of x31 were executed

If you load `test_basic_manual.coe`:
- Success: Display shows `00000002` (2 tests passed)
- Failure: Display shows `F0000001` or `F0000002` (test 1 or 2 failed)

## 🔍 Troubleshooting

### Issue: "riscv32-unknown-elf-gcc: not found"

**Solution**: Either install the toolchain (Option 1) or use pre-generated examples (Option 2)

### Issue: "No such file or directory" when running make

**Solution**: Ensure you're in the `librecore/tests` directory
```bash
pwd  # Should show: .../LibreCore/librecore/tests
```

### Issue: Generated COE file is empty

**Solution**: Check assembly file syntax, look for compilation errors
```bash
# Check for errors in make output
make basic 2>&1 | grep -i error
```

### Issue: Cannot find test framework files

**Solution**: Verify you're in the correct directory
```bash
# From repository root:
cd librecore/tests
ls README.md  # Should exist
```

## ✨ Success Indicators

You've successfully installed and verified the framework if:

- [x] Directory structure is correct
- [x] Example COE files can be generated
- [x] Documentation is accessible
- [x] (Optional) Assembly tests compile to COE
- [x] (Optional) Testbench compiles without errors
- [x] RTL files show x31 connected to display

## 📚 Next Steps

1. **Read the Documentation**:
   - Start with `QUICKSTART.md` for basic usage
   - Read `docs/README.md` for detailed instructions

2. **Try a Simple Test**:
   - Use `test_simple_loop.coe` in Vivado
   - Load into IROM and verify on FPGA

3. **Run Comprehensive Tests**:
   - Compile `test_rv32i_comprehensive.s`
   - Load and test all 34 RV32I instructions

4. **Customize**:
   - Create your own test in `asm/`
   - Compile and verify
   - Document your results

## 📞 Support

If verification fails:
1. Check this guide again carefully
2. Review error messages
3. Consult detailed documentation in `docs/`
4. Submit an issue with:
   - What step failed
   - Error messages
   - Your environment details

---

**Framework Version**: 1.0  
**Last Updated**: 2025-10-16  
**Status**: ✅ Production Ready
