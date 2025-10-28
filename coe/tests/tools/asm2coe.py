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
    
    # Try to find RISC-V GCC with different prefixes
    gcc_prefixes = [
        "riscv32-unknown-elf-gcc",
        "riscv-none-embed-gcc",
        "riscv64-unknown-elf-gcc"
    ]
    
    gcc_cmd = None
    for prefix in gcc_prefixes:
        try:
            result = subprocess.run([prefix, "--version"], 
                                  capture_output=True, 
                                  timeout=2)
            if result.returncode == 0:
                gcc_cmd = prefix
                print(f"Found RISC-V toolchain: {prefix}", flush=True)
                break
        except (FileNotFoundError, subprocess.TimeoutExpired):
            continue
    
    if not gcc_cmd:
        print("Error: RISC-V GCC not found!", flush=True)
        print("Tried: " + ", ".join(gcc_prefixes), flush=True)
        print("\nPlease install RISC-V toolchain or add it to PATH:", flush=True)
        print("  Windows: Add toolchain bin directory to system PATH", flush=True)
        print("  Ubuntu: sudo apt-get install gcc-riscv64-unknown-elf", flush=True)
        print("  Or download from: https://github.com/riscv-collab/riscv-gnu-toolchain", flush=True)
        return None
    
    # Determine other tool names based on gcc prefix
    tool_prefix = gcc_cmd.replace("-gcc", "")
    objcopy_cmd = f"{tool_prefix}-objcopy"
    objdump_cmd = f"{tool_prefix}-objdump"
    
    # Compile assembly to ELF
    compile_cmd = [
        gcc_cmd,
        "-march=rv32i",
        "-mabi=ilp32",
        "-nostdlib",
        "-Ttext=0x00000000",
        "-o", str(elf_file),
        str(asm_file)
    ]
    print(f"Compiling {asm_file}...", flush=True)
    result = subprocess.run(compile_cmd, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Compilation error: {result.stderr}", flush=True)
        return None
    print(f"  Created {elf_file}", flush=True)
    
    # Convert ELF to binary
    objcopy_cmd_list = [
        objcopy_cmd,
        "-O", "binary",
        str(elf_file),
        str(bin_file)
    ]
    result = subprocess.run(objcopy_cmd_list, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Objcopy error: {result.stderr}", flush=True)
        return None
    print(f"  Created {bin_file}", flush=True)
    
    # Convert binary to hex
    objdump_cmd_list = [
        objdump_cmd,
        "-D",
        str(elf_file)
    ]
    
    result = subprocess.run(objdump_cmd_list, capture_output=True, text=True)
    if result.returncode == 0:
        with open(hex_file, 'w') as f:
            f.write(result.stdout)
    print(f"  Created {hex_file} (disassembly)", flush=True)
    
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
    
    print(f"  Created {coe_file}", flush=True)
    return coe_file

def main():
    print("[asm2coe.py] Script started", flush=True)
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
        print(f"Error: Input file '{input_file}' not found!", flush=True)
        return 1
    
    output_dir = Path(args.output) if args.output else Path('output')
    output_dir.mkdir(exist_ok=True, parents=True)
    print(f"[asm2coe.py] Output directory: {output_dir}", flush=True)
    
    base_name = input_file.stem
    coe_file = output_dir / f"{base_name}.coe"
    
    print(f"[asm2coe.py] Input file: {input_file}", flush=True)
    if args.coe_only:
        # Use existing binary file
        bin_file = output_dir / f"{base_name}.bin"
        if not bin_file.exists():
            print(f"Error: Binary file '{bin_file}' not found!", flush=True)
            return 1
    else:
        # Compile assembly to binary
        bin_file = compile_asm_to_bin(input_file, output_dir)
        if not bin_file:
            print("[asm2coe.py] compile_asm_to_bin failed", flush=True)
            return 1
    
    # Convert binary to COE
    print(f"[asm2coe.py] Converting {bin_file} to {coe_file}", flush=True)
    bin_to_coe(bin_file, coe_file)
    
    print(f"\nSuccess! Generated COE file: {coe_file}", flush=True)
    print(f"\nTo use in Vivado:", flush=True)
    print(f"  1. Open your block memory IP", flush=True)
    print(f"  2. Load the COE file: {coe_file}", flush=True)
    print(f"  3. Regenerate the IP", flush=True)
    
    return 0

if __name__ == '__main__':
    sys.exit(main())
