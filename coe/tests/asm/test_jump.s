# test_jump.s
# Test jump instructions: JAL, JALR
# x31 = number of passed tests

.section .text
.global _start

_start:
    li x31, 0

    # Test JAL
    jal x1, jal_target
    li x31, 0xE0001    # Should not reach here
    j end
jal_target:
    addi x31, x31, 1

    # Test JALR
    la x2, jalr_target
    jalr x3, x2, 0
    li x31, 0xE0002    # Should not reach here
    j end
jalr_target:
    addi x31, x31, 1

end:
    j end
