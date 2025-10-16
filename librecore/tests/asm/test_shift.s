# test_shift.s
# Test shift instructions: SLL, SRL, SRA, SLLI, SRLI, SRAI
# x31 = number of passed tests

.section .text
.global _start

_start:
    li x31, 0

    # Test SLLI
    li x1, 0x001
    slli x2, x1, 8
    li x3, 0x100
    beq x2, x3, slli_pass
    li x31, 0xC0001
    j end
slli_pass:
    addi x31, x31, 1

    # Test SRLI
    li x4, 0x800
    srli x5, x4, 4
    li x6, 0x080
    beq x5, x6, srli_pass
    li x31, 0xC0002
    j end
srli_pass:
    addi x31, x31, 1

    # Test SRAI
    li x7, -256
    srai x8, x7, 4
    li x9, -16
    beq x8, x9, srai_pass
    li x31, 0xC0003
    j end
srai_pass:
    addi x31, x31, 1

    # Test SLL
    li x10, 0x003
    li x11, 4
    sll x12, x10, x11
    li x13, 0x030
    beq x12, x13, sll_pass
    li x31, 0xC0004
    j end
sll_pass:
    addi x31, x31, 1

    # Test SRL
    li x14, 0xF00
    li x15, 4
    srl x16, x14, x15
    li x17, 0x0F0
    beq x16, x17, srl_pass
    li x31, 0xC0005
    j end
srl_pass:
    addi x31, x31, 1

    # Test SRA
    li x18, -256
    li x19, 4
    sra x20, x18, x19
    li x21, -16
    beq x20, x21, sra_pass
    li x31, 0xC0006
    j end
sra_pass:
    addi x31, x31, 1

end:
    j end
