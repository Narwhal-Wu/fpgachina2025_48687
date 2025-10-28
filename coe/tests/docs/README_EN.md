# RV32I Processor Testing Framework - User Guide

## Overview

This testing framework provides comprehensive instruction set testing for the RISC-V RV32I microprocessor. Test results are displayed on a 7-segment display, with support for individual instruction testing to facilitate debugging and problem localization.

## Directory Structure

```
librecore/tests/
├── asm/                          # Assembly test files
│   ├── test_rv32i_comprehensive.s  # Comprehensive test suite (34 tests)
│   ├── test_basic.s                # Basic functionality test (3 tests)
│   ├── test_arithmetic.s           # Arithmetic instruction tests
│   ├── test_logic.s                # Logic instruction tests
│   ├── test_shift.s                # Shift instruction tests
│   ├── test_branch.s               # Branch instruction tests
│   ├── test_memory.s               # Memory operation tests
│   └── test_jump.s                 # Jump instruction tests
├── rtl/                          # RTL design files (copied from source)
│   ├── myCPU.sv                   # CPU core
│   ├── TOP.v                      # Top module
│   ├── Seven_Seg.v                # 7-segment display controller
│   └── ...(other modules)
├── testbenches/                  # Testbench files
│   └── rv32i_test_tb.v           # Main testbench
├── tools/                        # Tool scripts
│   └── asm2coe.py                # Assembly to COE conversion tool
└── docs/                         # Documentation
    └── README.md                 # This document
```

## Test Suite Description

### 1. Comprehensive Test Suite (test_rv32i_comprehensive.s)

Contains 34 test cases covering all RV32I instructions:

#### Test List:

| Test # | Instruction | Test Content |
|--------|-------------|--------------|
| 01 | ADDI | Add immediate |
| 02 | ADD | Register addition |
| 03 | SUB | Register subtraction |
| 04 | LUI | Load upper immediate |
| 05 | AUIPC | Add upper immediate to PC |
| 06 | SLTI | Set less than immediate (signed) |
| 07 | SLTIU | Set less than immediate unsigned |
| 08 | ANDI | Bitwise AND immediate |
| 09 | ORI | Bitwise OR immediate |
| 10 | XORI | Bitwise XOR immediate |
| 11 | SLLI | Shift left logical immediate |
| 12 | SRLI | Shift right logical immediate |
| 13 | SRAI | Shift right arithmetic immediate |
| 14 | SLL | Shift left logical |
| 15 | SRL | Shift right logical |
| 16 | SRA | Shift right arithmetic |
| 17 | SLT | Set less than (signed) |
| 18 | SLTU | Set less than unsigned |
| 19 | AND | Bitwise AND |
| 20 | OR | Bitwise OR |
| 21 | XOR | Bitwise XOR |
| 22 | BEQ | Branch if equal |
| 23 | BNE | Branch if not equal |
| 24 | BLT | Branch if less than (signed) |
| 25 | BGE | Branch if greater or equal (signed) |
| 26 | BLTU | Branch if less than unsigned |
| 27 | BGEU | Branch if greater or equal unsigned |
| 28 | JAL | Jump and link |
| 29 | JALR | Jump and link register |
| 30 | SW/LW | Store/load word |
| 31 | SH/LH | Store/load halfword |
| 32 | LHU | Load halfword unsigned |
| 33 | SB/LB | Store/load byte |
| 34 | LBU | Load byte unsigned |

#### Test Result Encoding:

- **Success**: x31 = 0x00000022 (34 decimal) - all tests passed
- **Failure**: x31 = 0xE00nn, where nn is the failed test number (hex)

### 2. Basic Test (test_basic.s)

Simple 3 test cases to verify basic processor functionality:
- ADDI instruction
- ADD instruction
- Memory read/write (SW/LW)

**Result Encoding**:
- Success: x31 = 0x00000003
- Failure: x31 = 0xF000n

### 3. Categorized Tests

For easier debugging of specific instruction types:

- **test_arithmetic.s**: Arithmetic instructions (ADD, ADDI, SUB)
  - Success: x31 = 3
  - Failure: x31 = 0xA000n

- **test_logic.s**: Logic instructions (AND, OR, XOR, ANDI, ORI, XORI)
  - Success: x31 = 6
  - Failure: x31 = 0xB000n

- **test_shift.s**: Shift instructions (SLL, SRL, SRA, SLLI, SRLI, SRAI)
  - Success: x31 = 6
  - Failure: x31 = 0xC000n

- **test_branch.s**: Branch instructions (BEQ, BNE, BLT, BGE, BLTU, BGEU)
  - Success: x31 = 6
  - Failure: x31 = 0xD000n

- **test_memory.s**: Memory operations (LW, LH, LB, LHU, LBU, SW, SH, SB)
  - Success: x31 = 5
  - Failure: x31 = 0xD000n

- **test_jump.s**: Jump instructions (JAL, JALR)
  - Success: x31 = 2
  - Failure: x31 = 0xE000n

## Usage Instructions

### Method 1: Using Python Tool (Recommended)

#### Prerequisites:
Install RISC-V toolchain:

```bash
# Ubuntu/Debian
sudo apt-get install gcc-riscv64-unknown-elf

# Or compile from source
git clone https://github.com/riscv-collab/riscv-gnu-toolchain
cd riscv-gnu-toolchain
./configure --prefix=/opt/riscv --with-arch=rv32i --with-abi=ilp32
make
```

#### Compilation Steps:

1. Navigate to tools directory:
```bash
cd librecore/tests/tools
```

2. Make the script executable:
```bash
chmod +x asm2coe.py
```

3. Compile assembly files to COE format:
```bash
# Compile comprehensive test
./asm2coe.py ../asm/test_rv32i_comprehensive.s -o ../output

# Compile basic test
./asm2coe.py ../asm/test_basic.s -o ../output

# Compile specific test
./asm2coe.py ../asm/test_arithmetic.s -o ../output
```

4. Generated files will be in `librecore/tests/output/`:
   - `*.elf` - Executable file
   - `*.bin` - Binary file
   - `*.hex` - Disassembly file (for debugging)
   - `*.coe` - Xilinx COE file (for BRAM initialization)

### Method 2: Manual Compilation

#### Using RISC-V Toolchain:

```bash
# Compile assembly to ELF
riscv32-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib \
    -Ttext=0x00000000 -o test.elf test.s

# Convert to binary
riscv32-unknown-elf-objcopy -O binary test.elf test.bin

# Convert to COE (requires custom script or tool)
```

### Method 3: Using in Vivado

1. Open Vivado project
2. Find Block Memory Generator in IP Catalog
3. Configure IROM (Instruction ROM):
   - Memory Type: Single Port ROM
   - Port A Width: 32 bits
   - Port A Depth: Set according to program size (recommended 1024 or larger)
   - Load Init File: Select the generated `.coe` file
4. Regenerate IP
5. Instantiate TOP module in design
6. Synthesize, implement and generate bitstream
7. Download to FPGA board

## Testing in Simulation

### Using Vivado Simulator:

1. Add testbench file to project:
```tcl
add_files -fileset sim_1 librecore/tests/testbenches/rv32i_test_tb.v
```

2. Add RTL files:
```tcl
add_files -fileset sources_1 librecore/tests/rtl/*.v
add_files -fileset sources_1 librecore/tests/rtl/*.sv
```

3. Set top simulation module:
```tcl
set_property top rv32i_test_tb [get_filesets sim_1]
```

4. Run simulation:
```tcl
launch_simulation
run 500us
```

5. View simulation output:
   - Console will show test progress
   - x31 register value changes
   - Final test results

### Using Icarus Verilog (Open Source):

```bash
cd librecore/tests

# Compile
iverilog -o test_sim \
    -s rv32i_test_tb \
    testbenches/rv32i_test_tb.v \
    rtl/*.v rtl/*.sv

# Run
vvp test_sim

# View waveform (optional)
gtkwave test.vcd
```

## 7-Segment Display Explanation

Test results are displayed on the 7-segment display via x31 register value:

### Display Format:
Display shows 8 hexadecimal digits (32-bit value):

```
[7] [6] [5] [4] [3] [2] [1] [0]
 │   │   │   │   │   │   │   │
 └───┴───┴───┴───┴───┴───┴───┴─── Hexadecimal representation of x31[31:0]
```

### Examples:

| x31 Value | Display | Meaning |
|-----------|---------|---------|
| 0x00000022 | 00000022 | Comprehensive test passed (34 tests) |
| 0x00000003 | 00000003 | Basic test passed (3 tests) |
| 0xE0000001 | E0000001 | Comprehensive test failed at test #1 |
| 0xE000000F | E000000F | Comprehensive test failed at test #15 |
| 0xF00003 | 000F0003 | Basic test failed at test #3 |

## Debugging Guide

### 1. Identifying Failed Tests

When a test fails, x31 value contains error code:

```
x31 = 0xTTTTnnnn
      ││││││││
      │││└────── Test number (nn)
      └──────── Test type (TT)
```

Error code prefixes:
- `0xE0` - Comprehensive test failure
- `0xF0` - Basic test failure
- `0xA0` - Arithmetic test failure
- `0xB0` - Logic test failure
- `0xC0` - Shift test failure
- `0xD0` - Branch/Memory test failure

### 2. Locating Problem Instructions

1. Look at test file to find the corresponding test number
2. Check which instructions are used in that test
3. View signals in simulation waveform during instruction execution

### 3. Using Categorized Tests

If comprehensive test fails:
1. Based on failed test number, determine instruction type
2. Run corresponding categorized test (e.g., test_arithmetic.s)
3. Isolate problem in simpler environment

### 4. Check Common Issues

- **Immediate sign extension**: Ensure immediates are correctly sign-extended
- **Data forwarding**: Check pipeline data forwarding logic
- **Memory alignment**: Ensure memory access is correctly aligned
- **Branch prediction**: Check branch target address calculation
- **ALU operations**: Verify arithmetic and logic operations correctness

## Adding Custom Tests

### Create New Test File:

```assembly
# my_custom_test.s
.section .text
.global _start

_start:
    li x31, 0           # Initialize test counter
    
    # Test 1: Your test code
    # ...
    beq x1, x2, test1_pass
    li x31, 0xCC001     # Custom error code
    j end
test1_pass:
    addi x31, x31, 1
    
    # Add more tests...
    
end:
    j end               # Infinite loop to halt
```

### Compile and Test:

```bash
cd librecore/tests/tools
./asm2coe.py ../asm/my_custom_test.s -o ../output
```

## Technical Specifications

### Supported Instruction Set:
- RV32I Base Integer Instruction Set
- Excluding: ECALL, EBREAK, FENCE instructions

### Memory Map:
- IROM: 0x00000000 - 0x00000FFF (4KB)
- DRAM: 0x00001000 - 0x00001FFF (4KB)
- Peripherals: 0xFFFF0000 and above

### Register Conventions:
- x0: Hardwired to 0
- x31 (t6): Dedicated for test result output
- x30 (t5): Commonly used as memory base address
- Others: Follow RISC-V ABI standard

## FAQ

### Q: RISC-V toolchain not found during compilation?
A: Ensure RISC-V GCC toolchain is installed and in PATH. Check with `which riscv32-unknown-elf-gcc`.

### Q: Test doesn't complete in simulation?
A: Check:
   1. IROM correctly loaded COE file
   2. Reset signal properly released
   3. Clock working normally
   4. Program start address is 0x00000000

### Q: 7-segment display shows garbage?
A: Check:
   1. Display controller clock divider correct
   2. x31 register value correctly connected to display module
   3. Anode and cathode signals correctly connected

### Q: How to view detailed execution?
A: In simulation:
   1. Add waveform monitors: PC, instruction, registers
   2. Enable testbench debug output
   3. View disassembly file (.hex) while executing

## Contributing

Welcome to contribute more test cases and improvements!

### Submit New Tests:
1. Create test file in `asm/` directory
2. Use consistent error code format
3. Add comments explaining test content
4. Update this documentation

### Report Issues:
- Describe the problem encountered
- Provide test file and error code
- Include simulation waveform (if possible)

## License

This testing framework follows the same license as the main project.

## Contact

For questions or suggestions, please submit an Issue to the project repository.

---

**Version**: 1.0  
**Last Updated**: 2025-10-16
