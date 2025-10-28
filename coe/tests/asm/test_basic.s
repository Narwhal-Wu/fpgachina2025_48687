# test_basic.s
# Basic functionality test for RV32I processor
# Simple test to verify processor is working
# Result displayed on 7-segment display via x31

.section .text
.global _start

_start:
    # Initialize x31 to 0
    li x31, 0x00000000
    
    # Test 1: Simple ADDI
    li x1, 5
    addi x1, x1, 10
    li x2, 15
    beq x1, x2, test1_pass
    li x31, 0xF0001
    j end
test1_pass:
    addi x31, x31, 1
    
    # Test 2: Simple ADD
    li x3, 10
    li x4, 20
    add x5, x3, x4
    li x6, 30
    beq x5, x6, test2_pass
    li x31, 0xF0002
    j end
test2_pass:
    addi x31, x31, 1
    
    # Test 3: Memory write/read
    li x7, 0x1000
    li x8, 0x12345678
    sw x8, 0(x7)
    lw x9, 0(x7)
    beq x8, x9, test3_pass
    li x31, 0xF0003
    j end
test3_pass:
    addi x31, x31, 1
    
    # All tests passed - x31 should be 3
end:
    j end
