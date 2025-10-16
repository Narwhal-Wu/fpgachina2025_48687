#!/usr/bin/env python3
"""
RISC-V Assembly to COE Converter
Converts RISC-V assembly files to Xilinx COE format for BRAM initialization
"""

import os
import sys
import subprocess
import argparse
from pathlib import Path

def compile_asm_to_bin(asm_file, output_dir):
    """Compile assembly to binary using RISC-V toolchain"""
    
    asm_path = Path(asm_file)
    base_name = asm_path.stem
    
    # Output files
    elf_file = output_dir / f"{base_name}.elf"
    bin_file = output_dir / f"{base_name}.bin"
    hex_file = output_dir / f"{base_name}.hex"
    
    # Compile assembly to ELF
    compile_cmd = [
        "riscv32-unknown-elf-gcc",
        "-march=rv32i",
        "-mabi=ilp32",
        "-nostdlib",
        "-Ttext=0x00000000",
        "-o", str(elf_file),
        str(asm_file)
    ]
    
    try:
        print(f"Compiling {asm_file}...")
        result = subprocess.run(compile_cmd, capture_output=True, text=True)
        if result.returncode != 0:
            print(f"Compilation error: {result.stderr}")
            return None
        print(f"  Created {elf_file}")
    except FileNotFoundError:
        print("Error: riscv32-unknown-elf-gcc not found!")
        print("Please install RISC-V toolchain:")
        print("  Ubuntu: sudo apt-get install gcc-riscv64-unknown-elf")
        print("  Or download from: https://github.com/riscv-collab/riscv-gnu-toolchain")
        return None
    
    # Convert ELF to binary
    objcopy_cmd = [
        "riscv32-unknown-elf-objcopy",
        "-O", "binary",
        str(elf_file),
        str(bin_file)
    ]
    
    result = subprocess.run(objcopy_cmd, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Objcopy error: {result.stderr}")
        return None
    print(f"  Created {bin_file}")
    
    # Convert binary to hex
    objdump_cmd = [
        "riscv32-unknown-elf-objdump",
        "-D",
        str(elf_file)
    ]
    
    result = subprocess.run(objdump_cmd, capture_output=True, text=True)
    if result.returncode == 0:
        with open(hex_file, 'w') as f:
            f.write(result.stdout)
        print(f"  Created {hex_file} (disassembly)")
    
    return bin_file

def bin_to_coe(bin_file, coe_file, word_size=4):
    """Convert binary file to COE format"""
    
    # Read binary file
    with open(bin_file, 'rb') as f:
        data = f.read()
    
    # Pad to word boundary
    padding = (word_size - (len(data) % word_size)) % word_size
    data += b'\x00' * padding
    
    # Write COE file
    with open(coe_file, 'w') as f:
        f.write("memory_initialization_radix=16;\n")
        f.write("memory_initialization_vector=\n")
        
        # Convert bytes to 32-bit words (little endian)
        for i in range(0, len(data), word_size):
            word = data[i:i+word_size]
            # Convert to little endian 32-bit value
            value = int.from_bytes(word, byteorder='little')
            if i + word_size < len(data):
                f.write(f"{value:08X},\n")
            else:
                f.write(f"{value:08X};\n")
    
    print(f"  Created {coe_file}")
    return coe_file

def main():
    parser = argparse.ArgumentParser(
        description='Convert RISC-V assembly to COE format for Xilinx BRAM'
    )
    parser.add_argument('input', help='Input assembly file (.s)')
    parser.add_argument('-o', '--output', help='Output directory (default: ./output)')
    parser.add_argument('--coe-only', action='store_true', 
                       help='Only generate COE file (requires existing .bin file)')
    
    args = parser.parse_args()
    
    # Setup paths
    input_file = Path(args.input)
    if not input_file.exists():
        print(f"Error: Input file '{input_file}' not found!")
        return 1
    
    output_dir = Path(args.output) if args.output else Path('output')
    output_dir.mkdir(exist_ok=True, parents=True)
    
    base_name = input_file.stem
    coe_file = output_dir / f"{base_name}.coe"
    
    if args.coe_only:
        # Use existing binary file
        bin_file = output_dir / f"{base_name}.bin"
        if not bin_file.exists():
            print(f"Error: Binary file '{bin_file}' not found!")
            return 1
    else:
        # Compile assembly to binary
        bin_file = compile_asm_to_bin(input_file, output_dir)
        if not bin_file:
            return 1
    
    # Convert binary to COE
    bin_to_coe(bin_file, coe_file)
    
    print(f"\nSuccess! Generated COE file: {coe_file}")
    print(f"\nTo use in Vivado:")
    print(f"  1. Open your block memory IP")
    print(f"  2. Load the COE file: {coe_file}")
    print(f"  3. Regenerate the IP")
    
    return 0

if __name__ == '__main__':
    sys.exit(main())
