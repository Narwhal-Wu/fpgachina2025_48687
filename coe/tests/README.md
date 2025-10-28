# RV32I Processor Testing Framework

[中文文档](docs/README.md) | [English Documentation](docs/README_EN.md) | [快速开始](QUICKSTART.md)

## Overview

This directory contains a comprehensive testing framework for the RISC-V RV32I microprocessor. The framework provides:

- **Comprehensive test suite**: 34 tests covering all RV32I instructions
- **Categorized tests**: Individual test files for different instruction types
- **7-segment display output**: Test results displayed on hardware
- **Debug support**: Error codes to help locate failing instructions
- **Simulation support**: Testbench for Vivado and Icarus Verilog

## Quick Start

```bash
# 1. Install RISC-V toolchain
sudo apt-get install gcc-riscv64-unknown-elf

# 2. Compile all tests
cd librecore/tests
make all

# 3. Use in Vivado
# Load output/test_basic.coe into Block Memory Generator IP
# Synthesize and download to FPGA

# 4. View results on 7-segment display
# Success: Shows number of passed tests (e.g., 00000003)
# Failure: Shows error code (e.g., E0000001)
```

## Test Files

| File | Description | Tests | Pass Value |
|------|-------------|-------|------------|
| `test_rv32i_comprehensive.s` | All RV32I instructions | 34 | 0x00000022 |
| `test_basic.s` | Basic functionality | 3 | 0x00000003 |
| `test_arithmetic.s` | ADD, ADDI, SUB | 3 | 0x00000003 |
| `test_logic.s` | AND, OR, XOR, etc. | 6 | 0x00000006 |
| `test_shift.s` | Shift instructions | 6 | 0x00000006 |
| `test_branch.s` | Branch instructions | 6 | 0x00000006 |
| `test_memory.s` | Load/store | 5 | 0x00000005 |
| `test_jump.s` | JAL, JALR | 2 | 0x00000002 |

## Directory Structure

```
librecore/tests/
├── asm/              # Assembly test source files
├── rtl/              # RTL design files (copied from source)
├── testbenches/      # Simulation testbenches
├── tools/            # Compilation tools (asm2coe.py)
├── output/           # Generated COE files (auto-created)
├── docs/             # Detailed documentation
├── Makefile          # Build automation
├── QUICKSTART.md     # Quick start guide
└── README.md         # This file
```

## Error Codes

Test results are stored in register x31:
- **Success**: x31 = number of passed tests (0x00 to 0x22)
- **Failure**: x31 = 0xTTTTnnnn where:
  - `TTTT` = test type identifier
  - `nnnn` = test number that failed

Error code prefixes:
- `0xE0` - Comprehensive test failure
- `0xF0` - Basic test failure  
- `0xA0` - Arithmetic test failure
- `0xB0` - Logic test failure
- `0xC0` - Shift test failure
- `0xD0` - Branch/Memory test failure

## Documentation

- **[中文详细文档](docs/README.md)**: Complete Chinese documentation
- **[English Documentation](docs/README_EN.md)**: Complete English documentation
- **[快速开始指南](QUICKSTART.md)**: Quick start guide in Chinese

## Requirements

### For Compilation:
- RISC-V GCC toolchain (`riscv32-unknown-elf-gcc`)
- Python 3.x
- Make (optional, for automation)

### For Simulation:
- Vivado (with simulator) or
- Icarus Verilog + GTKWave (open source)

### For Hardware:
- Xilinx FPGA board with:
  - 7-segment display (8 digits)
  - Block RAM support
  - Clock source (100 MHz)

## Usage Examples

### Compile specific test:
```bash
make basic           # Basic functionality test
make comprehensive   # Full RV32I test suite
make arithmetic      # Arithmetic instructions only
```

### Simulate with Vivado:
```tcl
add_files -fileset sim_1 testbenches/rv32i_test_tb.v
add_files -fileset sources_1 rtl/*.v rtl/*.sv
set_property top rv32i_test_tb [get_filesets sim_1]
launch_simulation
run 500us
```

### Simulate with Icarus Verilog:
```bash
iverilog -o sim -s rv32i_test_tb testbenches/rv32i_test_tb.v rtl/*.v rtl/*.sv
vvp sim
```

## Features

### Test Design
- Each test is independent and self-checking
- Tests output pass/fail status to x31 register
- Error codes include test number for easy debugging
- Tests use memory region 0x1000+ for load/store operations

### Display Integration
- 7-segment display shows x31 register value
- 8 hexadecimal digits for full 32-bit value
- Updated in real-time as tests execute

### Debug Support
- Testbench monitors PC, instruction, and x31
- Prints test progress to console
- Detects test completion and timeouts
- Provides detailed failure information

## Contributing

To add new tests:

1. Create assembly file in `asm/` directory
2. Follow existing test structure (use x31 for results)
3. Use consistent error code format (0xTTnnnn)
4. Add comments explaining test purpose
5. Update documentation

## Support

For issues, questions, or contributions:
- Check documentation in `docs/` directory
- Review existing test files for examples
- Submit issues to project repository

## License

This testing framework follows the same license as the LibreCore project.

---

**Version**: 1.0  
**Last Updated**: 2025-10-16
