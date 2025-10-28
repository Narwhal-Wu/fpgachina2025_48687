# test_logic.s
# Test logical instructions: AND, OR, XOR, ANDI, ORI, XORI
# x31 = number of passed tests

.section .text
.global _start

_start:
    li x31, 0

    # Test ANDI
    li x1, 0xFF0
    andi x2, x1, 0x0FF
    li x3, 0x0F0
    beq x2, x3, andi_pass
    li x31, 0xB0001
    j end
andi_pass:
    addi x31, x31, 1

    # Test ORI
    li x4, 0xF00
    ori x5, x4, 0x0FF
    li x6, 0xFFF
    beq x5, x6, ori_pass
    li x31, 0xB0002
    j end
ori_pass:
    addi x31, x31, 1

    # Test XORI
    li x7, 0xAAA
    xori x8, x7, 0x7FF
    li x9, 0xD55
    beq x8, x9, xori_pass
    li x31, 0xB0003
    j end
xori_pass:
    addi x31, x31, 1

    # Test AND
    li x10, 0xF0F
    li x11, 0xFF0
    and x12, x10, x11
    li x13, 0xF00
    beq x12, x13, and_pass
    li x31, 0xB0004
    j end
and_pass:
    addi x31, x31, 1

    # Test OR
    li x14, 0xF00
    li x15, 0x0FF
    or x16, x14, x15
    li x17, 0xFFF
    beq x16, x17, or_pass
    li x31, 0xB0005
    j end
or_pass:
    addi x31, x31, 1

    # Test XOR
    li x18, 0xFFF
    li x19, 0xAAA
    xor x20, x18, x19
    li x21, 0x555
    beq x20, x21, xor_pass
    li x31, 0xB0006
    j end
xor_pass:
    addi x31, x31, 1

end:
    j end
