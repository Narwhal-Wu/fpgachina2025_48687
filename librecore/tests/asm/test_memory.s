# test_memory.s
# Test memory instructions: LW, LH, LB, LHU, LBU, SW, SH, SB
# x31 = number of passed tests

.section .text
.global _start

_start:
    li x31, 0
    li x30, 0x1000    # Memory base address

    # Test SW/LW
    li x1, 0xABCD1234
    sw x1, 0(x30)
    lw x2, 0(x30)
    beq x1, x2, sw_lw_pass
    li x31, 0xD0001
    j end
sw_lw_pass:
    addi x31, x31, 1

    # Test SH/LH
    li x3, 0x5678
    sh x3, 4(x30)
    lh x4, 4(x30)
    li x5, 0x5678
    beq x4, x5, sh_lh_pass
    li x31, 0xD0002
    j end
sh_lh_pass:
    addi x31, x31, 1

    # Test LHU
    li x6, 0xFFFF
    sh x6, 8(x30)
    lhu x7, 8(x30)
    li x8, 0xFFFF
    beq x7, x8, lhu_pass
    li x31, 0xD0003
    j end
lhu_pass:
    addi x31, x31, 1

    # Test SB/LB
    li x9, 0x9A
    sb x9, 12(x30)
    lb x10, 12(x30)
    li x11, 0xFFFFFF9A
    beq x10, x11, sb_lb_pass
    li x31, 0xD0004
    j end
sb_lb_pass:
    addi x31, x31, 1

    # Test LBU
    li x12, 0xFF
    sb x12, 16(x30)
    lbu x13, 16(x30)
    li x14, 0xFF
    beq x13, x14, lbu_pass
    li x31, 0xD0005
    j end
lbu_pass:
    addi x31, x31, 1

end:
    j end
