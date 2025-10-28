# test_branch.s
# Test branch instructions: BEQ, BNE, BLT, BGE, BLTU, BGEU
# x31 = number of passed tests

.section .text
.global _start

_start:
    li x31, 0

    # Test BEQ
    li x1, 42
    li x2, 42
    beq x1, x2, beq_pass
    li x31, 0xD0001
    j end
beq_pass:
    addi x31, x31, 1

    # Test BNE
    li x3, 10
    li x4, 20
    bne x3, x4, bne_pass
    li x31, 0xD0002
    j end
bne_pass:
    addi x31, x31, 1

    # Test BLT
    li x5, -5
    li x6, 10
    blt x5, x6, blt_pass
    li x31, 0xD0003
    j end
blt_pass:
    addi x31, x31, 1

    # Test BGE
    li x7, 100
    li x8, 50
    bge x7, x8, bge_pass
    li x31, 0xD0004
    j end
bge_pass:
    addi x31, x31, 1

    # Test BLTU
    li x9, 10
    li x10, 0xFFFFFFFF
    bltu x9, x10, bltu_pass
    li x31, 0xD0005
    j end
bltu_pass:
    addi x31, x31, 1

    # Test BGEU
    li x11, 0xFFFFFFFF
    li x12, 100
    bgeu x11, x12, bgeu_pass
    li x31, 0xD0006
    j end
bgeu_pass:
    addi x31, x31, 1

end:
    j end
