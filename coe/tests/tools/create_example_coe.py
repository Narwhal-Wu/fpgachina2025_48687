#!/usr/bin/env python3
"""
Manual COE Generator for RV32I Tests
Creates a sample COE file from pre-compiled instructions for immediate testing
"""

import os
import sys

def create_basic_test_coe(output_file):
    """
    Create a basic test COE file with hand-assembled instructions
    This test performs:
    1. Initialize x31 to 0
    2. Simple ADDI test
    3. Simple ADD test
    4. Infinite loop
    """
    
    instructions = [
        # Test initialization
        0x00000f93,  # li x31, 0        (addi x31, x0, 0)
        
        # Test 1: ADDI
        0x00a00093,  # li x1, 10        (addi x1, x0, 10)
        0x00500113,  # li x2, 5         (addi x2, x0, 5)
        0x00208133,  # add x2, x1, x2   (x2 = 15)
        0x00f00193,  # li x3, 15        (addi x3, x0, 15)
        0x00310463,  # beq x2, x3, +8   (if equal, skip error)
        0xf0001f93,  # li x31, 0xF0001  (error code)
        0x0080006f,  # j end
        0x001f8f93,  # addi x31, x31, 1 (increment test count)
        
        # Test 2: ADD
        0x01400213,  # li x4, 20        (addi x4, x0, 20)
        0x01e00293,  # li x5, 30        (addi x5, x0, 30)
        0x00520333,  # add x6, x4, x5   (x6 = 50)
        0x03200393,  # li x7, 50        (addi x7, x0, 50)
        0x00730463,  # beq x6, x7, +8   (if equal, skip error)
        0xf0002f93,  # li x31, 0xF0002  (error code)
        0x0040006f,  # j end
        0x001f8f93,  # addi x31, x31, 1 (increment test count)
        
        # End: infinite loop
        0x0000006f,  # j 0 (infinite loop)
    ]
    
    with open(output_file, 'w') as f:
        f.write("memory_initialization_radix=16;\n")
        f.write("memory_initialization_vector=\n")
        
        for i, inst in enumerate(instructions):
            if i < len(instructions) - 1:
                f.write(f"{inst:08X},\n")
            else:
                f.write(f"{inst:08X};\n")
    
    print(f"Created basic test COE file: {output_file}")
    print(f"Instructions: {len(instructions)}")
    print("\nExpected result on 7-segment display:")
    print("  Success: 00000002 (2 tests passed)")
    print("  Failure: F0000001 or F0000002 (test 1 or 2 failed)")

def create_simple_loop_coe(output_file):
    """Create a very simple loop that just increments x31"""
    
    instructions = [
        0x00000f93,  # li x31, 0        (addi x31, x0, 0)
        0x001f8f93,  # addi x31, x31, 1 (increment x31)
        0x001f8f93,  # addi x31, x31, 1 (increment x31)
        0x001f8f93,  # addi x31, x31, 1 (increment x31)
        0x0000006f,  # j 0x10 (infinite loop)
    ]
    
    with open(output_file, 'w') as f:
        f.write("memory_initialization_radix=16;\n")
        f.write("memory_initialization_vector=\n")
        
        for i, inst in enumerate(instructions):
            if i < len(instructions) - 1:
                f.write(f"{inst:08X},\n")
            else:
                f.write(f"{inst:08X};\n")
    
    print(f"Created simple loop COE file: {output_file}")
    print("Expected result on 7-segment display: 00000003")

def main():
    output_dir = "examples"
    os.makedirs(output_dir, exist_ok=True)
    
    print("=" * 60)
    print("RV32I Test COE Generator")
    print("=" * 60)
    print()
    
    # Create basic test
    basic_file = os.path.join(output_dir, "test_basic_manual.coe")
    create_basic_test_coe(basic_file)
    print()
    
    # Create simple loop
    simple_file = os.path.join(output_dir, "test_simple_loop.coe")
    create_simple_loop_coe(simple_file)
    print()
    
    print("=" * 60)
    print("Generated example COE files in:", output_dir)
    print("=" * 60)
    print("\nTo use:")
    print("1. Open Vivado and your project")
    print("2. Open Block Memory Generator IP (IROM)")
    print("3. Load one of the COE files")
    print("4. Regenerate IP, synthesize, and download to FPGA")
    print("5. Observe the 7-segment display for test results")
    print()
    print("Note: For full test suite, use asm2coe.py with the .s files")

if __name__ == '__main__':
    main()
