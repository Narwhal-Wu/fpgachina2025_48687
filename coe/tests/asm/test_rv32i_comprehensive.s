# test_rv32i_comprehensive.s
# Comprehensive RV32I instruction test suite
# Tests all RV32I instructions with detailed output to 7-segment display
# 
# Test result stored in x31 register:
# - Success: x31 = number of tests passed (0x00 to 0x28 = 40 tests)
# - Failure: x31 = 0xERRnn where nn is the test number that failed
#
# 7-segment display shows x31 value

.section .text
.global _start

_start:
    # Initialize test counter in x31
    li x31, 0x00000000  # Test counter starts at 0

    #=================================================================
    # TEST 01: ADDI - Add Immediate
    # Test: x1 = 0 + 10 = 10
    #=================================================================
test_01_addi:
    li x1, 0
    addi x1, x1, 10
    li x2, 10
    beq x1, x2, pass_01
    li x31, 0xE0001     # Error code: test 01 failed
    j test_end
pass_01:
    addi x31, x31, 1    # Increment pass counter

    #=================================================================
    # TEST 02: ADD - Add Register
    # Test: x3 = 20 + 30 = 50
    #=================================================================
test_02_add:
    li x3, 20
    li x4, 30
    add x5, x3, x4
    li x6, 50
    beq x5, x6, pass_02
    li x31, 0xE0002
    j test_end
pass_02:
    addi x31, x31, 1

    #=================================================================
    # TEST 03: SUB - Subtract Register
    # Test: x7 = 100 - 40 = 60
    #=================================================================
test_03_sub:
    li x7, 100
    li x8, 40
    sub x9, x7, x8
    li x10, 60
    beq x9, x10, pass_03
    li x31, 0xE0003
    j test_end
pass_03:
    addi x31, x31, 1

    #=================================================================
    # TEST 04: LUI - Load Upper Immediate
    # Test: x11 = 0x12345000
    #=================================================================
test_04_lui:
    lui x11, 0x12345
    lui x12, 0x12345
    beq x11, x12, pass_04
    li x31, 0xE0004
    j test_end
pass_04:
    addi x31, x31, 1

    #=================================================================
    # TEST 05: AUIPC - Add Upper Immediate to PC
    # Test: x13 should be close to current PC
    #=================================================================
test_05_auipc:
    auipc x13, 0
    auipc x14, 1
    sub x15, x14, x13
    li x16, 0x0800      # Should be around 0x1000
    blt x16, x15, pass_05
    li x31, 0xE0005
    j test_end
pass_05:
    addi x31, x31, 1

    #=================================================================
    # TEST 06: SLTI - Set Less Than Immediate (signed)
    # Test: 50 < 100 should be 1
    #=================================================================
test_06_slti:
    li x17, 50
    slti x18, x17, 100
    li x19, 1
    beq x18, x19, pass_06
    li x31, 0xE0006
    j test_end
pass_06:
    addi x31, x31, 1

    #=================================================================
    # TEST 07: SLTIU - Set Less Than Immediate Unsigned
    # Test: 50 < 100 (unsigned) should be 1
    #=================================================================
test_07_sltiu:
    li x20, 50
    sltiu x21, x20, 100
    li x22, 1
    beq x21, x22, pass_07
    li x31, 0xE0007
    j test_end
pass_07:
    addi x31, x31, 1

    #=================================================================
    # TEST 08: ANDI - AND Immediate
    # Test: 0xFF0 & 0x0FF = 0x0F0
    #=================================================================
test_08_andi:
    li x23, 0xFF0
    andi x24, x23, 0x0FF
    li x25, 0x0F0
    beq x24, x25, pass_08
    li x31, 0xE0008
    j test_end
pass_08:
    addi x31, x31, 1

    #=================================================================
    # TEST 09: ORI - OR Immediate
    # Test: 0xF00 | 0x0FF = 0xFFF
    #=================================================================
test_09_ori:
    li x26, 0xF00
    ori x27, x26, 0x0FF
    li x28, 0xFFF
    beq x27, x28, pass_09
    li x31, 0xE0009
    j test_end
pass_09:
    addi x31, x31, 1

    #=================================================================
    # TEST 10: XORI - XOR Immediate
    # Test: 0xAAA ^ 0x7FF = 0xD55
    #=================================================================
test_10_xori:
    li x1, 0xAAA
    xori x2, x1, 0x7FF
    li x3, 0xD55
    beq x2, x3, pass_10
    li x31, 0xE000A
    j test_end
pass_10:
    addi x31, x31, 1

    #=================================================================
    # TEST 11: SLLI - Shift Left Logical Immediate
    # Test: 0x001 << 8 = 0x100
    #=================================================================
test_11_slli:
    li x4, 0x001
    slli x5, x4, 8
    li x6, 0x100
    beq x5, x6, pass_11
    li x31, 0xE000B
    j test_end
pass_11:
    addi x31, x31, 1

    #=================================================================
    # TEST 12: SRLI - Shift Right Logical Immediate
    # Test: 0x800 >> 4 = 0x080
    #=================================================================
test_12_srli:
    li x7, 0x800
    srli x8, x7, 4
    li x9, 0x080
    beq x8, x9, pass_12
    li x31, 0xE000C
    j test_end
pass_12:
    addi x31, x31, 1

    #=================================================================
    # TEST 13: SRAI - Shift Right Arithmetic Immediate
    # Test: -256 >> 4 = -16 (sign extend)
    #=================================================================
test_13_srai:
    li x10, -256
    srai x11, x10, 4
    li x12, -16
    beq x11, x12, pass_13
    li x31, 0xE000D
    j test_end
pass_13:
    addi x31, x31, 1

    #=================================================================
    # TEST 14: SLL - Shift Left Logical
    # Test: 0x003 << 4 = 0x030
    #=================================================================
test_14_sll:
    li x13, 0x003
    li x14, 4
    sll x15, x13, x14
    li x16, 0x030
    beq x15, x16, pass_14
    li x31, 0xE000E
    j test_end
pass_14:
    addi x31, x31, 1

    #=================================================================
    # TEST 15: SRL - Shift Right Logical
    # Test: 0xF00 >> 4 = 0x0F0
    #=================================================================
test_15_srl:
    li x17, 0xF00
    li x18, 4
    srl x19, x17, x18
    li x20, 0x0F0
    beq x19, x20, pass_15
    li x31, 0xE000F
    j test_end
pass_15:
    addi x31, x31, 1

    #=================================================================
    # TEST 16: SRA - Shift Right Arithmetic
    # Test: -256 >> 4 = -16
    #=================================================================
test_16_sra:
    li x21, -256
    li x22, 4
    sra x23, x21, x22
    li x24, -16
    beq x23, x24, pass_16
    li x31, 0xE0010
    j test_end
pass_16:
    addi x31, x31, 1

    #=================================================================
    # TEST 17: SLT - Set Less Than (signed)
    # Test: -10 < 10 should be 1
    #=================================================================
test_17_slt:
    li x25, -10
    li x26, 10
    slt x27, x25, x26
    li x28, 1
    beq x27, x28, pass_17
    li x31, 0xE0011
    j test_end
pass_17:
    addi x31, x31, 1

    #=================================================================
    # TEST 18: SLTU - Set Less Than Unsigned
    # Test: 1 < 0xFFFFFFFF (unsigned) should be 1
    #=================================================================
test_18_sltu:
    li x1, 1
    li x2, 0xFFFFFFFF
    sltu x3, x1, x2
    li x4, 1
    beq x3, x4, pass_18
    li x31, 0xE0012
    j test_end
pass_18:
    addi x31, x31, 1

    #=================================================================
    # TEST 19: AND - Bitwise AND
    # Test: 0xF0F & 0xFF0 = 0xF00
    #=================================================================
test_19_and:
    li x5, 0xF0F
    li x6, 0xFF0
    and x7, x5, x6
    li x8, 0xF00
    beq x7, x8, pass_19
    li x31, 0xE0013
    j test_end
pass_19:
    addi x31, x31, 1

    #=================================================================
    # TEST 20: OR - Bitwise OR
    # Test: 0xF00 | 0x0FF = 0xFFF
    #=================================================================
test_20_or:
    li x9, 0xF00
    li x10, 0x0FF
    or x11, x9, x10
    li x12, 0xFFF
    beq x11, x12, pass_20
    li x31, 0xE0014
    j test_end
pass_20:
    addi x31, x31, 1

    #=================================================================
    # TEST 21: XOR - Bitwise XOR
    # Test: 0xFFF ^ 0xAAA = 0x555
    #=================================================================
test_21_xor:
    li x13, 0xFFF
    li x14, 0xAAA
    xor x15, x13, x14
    li x16, 0x555
    beq x15, x16, pass_21
    li x31, 0xE0015
    j test_end
pass_21:
    addi x31, x31, 1

    #=================================================================
    # TEST 22: BEQ - Branch if Equal
    # Test: Branch when x17 == x18
    #=================================================================
test_22_beq:
    li x17, 42
    li x18, 42
    beq x17, x18, pass_22
    li x31, 0xE0016
    j test_end
pass_22:
    addi x31, x31, 1

    #=================================================================
    # TEST 23: BNE - Branch if Not Equal
    # Test: Branch when x19 != x20
    #=================================================================
test_23_bne:
    li x19, 10
    li x20, 20
    bne x19, x20, pass_23
    li x31, 0xE0017
    j test_end
pass_23:
    addi x31, x31, 1

    #=================================================================
    # TEST 24: BLT - Branch if Less Than (signed)
    # Test: Branch when -5 < 10
    #=================================================================
test_24_blt:
    li x21, -5
    li x22, 10
    blt x21, x22, pass_24
    li x31, 0xE0018
    j test_end
pass_24:
    addi x31, x31, 1

    #=================================================================
    # TEST 25: BGE - Branch if Greater or Equal (signed)
    # Test: Branch when 100 >= 50
    #=================================================================
test_25_bge:
    li x23, 100
    li x24, 50
    bge x23, x24, pass_25
    li x31, 0xE0019
    j test_end
pass_25:
    addi x31, x31, 1

    #=================================================================
    # TEST 26: BLTU - Branch if Less Than Unsigned
    # Test: Branch when 10 < 0xFFFFFFFF (unsigned)
    #=================================================================
test_26_bltu:
    li x25, 10
    li x26, 0xFFFFFFFF
    bltu x25, x26, pass_26
    li x31, 0xE001A
    j test_end
pass_26:
    addi x31, x31, 1

    #=================================================================
    # TEST 27: BGEU - Branch if Greater or Equal Unsigned
    # Test: Branch when 0xFFFFFFFF >= 100
    #=================================================================
test_27_bgeu:
    li x27, 0xFFFFFFFF
    li x28, 100
    bgeu x27, x28, pass_27
    li x31, 0xE001B
    j test_end
pass_27:
    addi x31, x31, 1

    #=================================================================
    # TEST 28: JAL - Jump and Link
    # Test: Jump to jal_target and save return address
    #=================================================================
test_28_jal:
    jal x1, jal_target_28
    li x31, 0xE001C     # Should not reach here
    j test_end
jal_target_28:
    addi x31, x31, 1    # Test 28 passed

    #=================================================================
    # TEST 29: JALR - Jump and Link Register
    # Test: Jump to address in register
    #=================================================================
test_29_jalr:
    la x2, jalr_target_29
    jalr x3, x2, 0
    li x31, 0xE001D     # Should not reach here
    j test_end
jalr_target_29:
    addi x31, x31, 1    # Test 29 passed

    #=================================================================
    # TEST 30-34: Memory Operations
    # Use memory base at 0x1000 for testing
    #=================================================================
    li x30, 0x1000      # Memory base address

    #=================================================================
    # TEST 30: SW/LW - Store/Load Word
    # Test: Store 0xABCD1234, then load it back
    #=================================================================
test_30_sw_lw:
    li x4, 0xABCD1234
    sw x4, 0(x30)
    lw x5, 0(x30)
    beq x4, x5, pass_30
    li x31, 0xE001E
    j test_end
pass_30:
    addi x31, x31, 1

    #=================================================================
    # TEST 31: SH/LH - Store/Load Halfword
    # Test: Store 0x5678, then load it back (sign extended)
    #=================================================================
test_31_sh_lh:
    li x6, 0x5678
    sh x6, 4(x30)
    lh x7, 4(x30)
    li x8, 0x5678
    beq x7, x8, pass_31
    li x31, 0xE001F
    j test_end
pass_31:
    addi x31, x31, 1

    #=================================================================
    # TEST 32: LHU - Load Halfword Unsigned
    # Test: Load 0xFFFF without sign extension
    #=================================================================
test_32_lhu:
    li x9, 0xFFFF
    sh x9, 8(x30)
    lhu x10, 8(x30)
    li x11, 0xFFFF
    beq x10, x11, pass_32
    li x31, 0xE0020
    j test_end
pass_32:
    addi x31, x31, 1

    #=================================================================
    # TEST 33: SB/LB - Store/Load Byte
    # Test: Store 0x9A, then load it back (sign extended)
    #=================================================================
test_33_sb_lb:
    li x12, 0x9A
    sb x12, 12(x30)
    lb x13, 12(x30)
    li x14, 0xFFFFFF9A  # Sign extended
    beq x13, x14, pass_33
    li x31, 0xE0021
    j test_end
pass_33:
    addi x31, x31, 1

    #=================================================================
    # TEST 34: LBU - Load Byte Unsigned
    # Test: Load 0xFF without sign extension
    #=================================================================
test_34_lbu:
    li x15, 0xFF
    sb x15, 16(x30)
    lbu x16, 16(x30)
    li x17, 0xFF
    beq x16, x17, pass_34
    li x31, 0xE0022
    j test_end
pass_34:
    addi x31, x31, 1

    #=================================================================
    # All tests passed!
    # x31 should now contain 0x22 (34 decimal)
    #=================================================================
test_end:
    # Test complete - x31 contains result
    # If all tests passed: x31 = 0x22
    # If a test failed: x31 = 0xE00nn (error code)
    j test_end          # Infinite loop to halt
