# test_arithmetic.s
# Test arithmetic instructions: ADD, ADDI, SUB
# x31 = number of passed tests

.section .text
.global _start

_start:
    li x31, 0

    # Test ADDI
    li x1, 100
    addi x2, x1, 50
    li x3, 150
    beq x2, x3, addi_pass
    li x31, 0xA0001
    j end
addi_pass:
    addi x31, x31, 1

    # Test ADD
    li x4, 200
    li x5, 300
    add x6, x4, x5
    li x7, 500
    beq x6, x7, add_pass
    li x31, 0xA0002
    j end
add_pass:
    addi x31, x31, 1

    # Test SUB
    li x8, 1000
    li x9, 600
    sub x10, x8, x9
    li x11, 400
    beq x10, x11, sub_pass
    li x31, 0xA0003
    j end
sub_pass:
    addi x31, x31, 1

end:
    j end
