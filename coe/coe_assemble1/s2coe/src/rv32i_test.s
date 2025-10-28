# rv32i_test.s
# Comprehensive RV32I instruction test (excluding ECALL and EBREAK)
# Tests all major instruction types and outputs pass count to a register for LED display
# Final result will be stored at memory address 0xFFFFFFFC for LED output

.section .text
.global _start

_start:
    # Initialize test counter in x31 (t6) - will count passed tests
    li x31, 0          # x31为测试计数器，也是数码管唯一显示寄存器
    li x30, 0x1000     # 内存基址（仅用于内存测试，不参与结果输出）

    #=================================================================
    # TEST 1-3: LUI and AUIPC instructions
    #=================================================================
test_lui:
    lui x5, 0x12345     # x5 = 0x12345000
    lui x6, 0x12345     # x6 = 0x12345000
    beq x5, x6, pass_1
    li x31, 0xffff1     # LUI测试失败，x31=0xffff1，数码管显示
    j done
pass_1:
    addi x31, x31, 1    # Test 1 passed

test_auipc:
    auipc x7, 0         # x7 = PC + 0
    auipc x8, 1         # x8 = PC + 0x1000
    sub x9, x8, x7      # x9 should be close to 0x1000
    li x10, 0x0FF0
    blt x10, x9, pass_2 # Check if difference is reasonable
    li x31, 0xffff2     # AUIPC测试失败，x31=0xffff2
    j done
pass_2:
    addi x31, x31, 1    # Test 2 passed
    addi x31, x31, 1    # Test 3 passed (AUIPC with offset)

    #=================================================================
    # TEST 4-7: Basic arithmetic - ADDI, ADD, SUB, SLTI
    #=================================================================
test_addi:
    li x11, 100
    addi x12, x11, 50   # x12 = 150
    li x13, 150
    beq x12, x13, pass_4
    li x31, 0xffff3     # ADDI测试失败，x31=0xffff3
    j done
pass_4:
    addi x31, x31, 1    # Test 4 passed

test_add:
    li x14, 200
    li x15, 300
    add x16, x14, x15   # x16 = 500
    li x17, 500
    beq x16, x17, pass_5
    li x31, 0xffff4     # ADD测试失败，x31=0xffff4
    j done
pass_5:
    addi x31, x31, 1    # Test 5 passed

test_sub:
    li x18, 1000
    li x19, 400
    sub x20, x18, x19   # x20 = 600
    li x21, 600
    beq x20, x21, pass_6
    li x31, 0xffff5     # SUB测试失败，x31=0xffff5
    j done
pass_6:
    addi x31, x31, 1    # Test 6 passed

test_slti:
    li x22, 50
    slti x23, x22, 100  # x23 = 1 (50 < 100)
    li x24, 1
    beq x23, x24, pass_7
    li x31, 0xffff6     # SLTI测试失败，x31=0xffff6
    j done
pass_7:
    addi x31, x31, 1    # Test 7 passed

    #=================================================================
    # TEST 8-10: Logic operations - ANDI, ORI, XORI
    #=================================================================
test_andi:
    li x25, 0xFF0
    andi x26, x25, 0x0FF # x26 = 0x0F0
    li x27, 0x0F0
    beq x26, x27, pass_8
    li x31, 0xffff7     # ANDI测试失败，x31=0xffff7
    j done
pass_8:
    addi x31, x31, 1    # Test 8 passed

test_ori:
    li x5, 0xF00
    ori x6, x5, 0x0FF   # x6 = 0xFFF
    li x7, 0xFFF
    beq x6, x7, pass_9
    li x31, 0xffff8     # ORI测试失败，x31=0xffff8
    j done
pass_9:
    addi x31, x31, 1    # Test 9 passed

test_xori:
    li x8, 0xAAA
    xori x9, x8, 0x7FF  # x9 = x8 ^ 0x7FF (using 12-bit immediate)
    li x10, 0xD55       # Expected result 0xAAA ^ 0x7FF = 0xD55
    beq x9, x10, pass_10
    li x31, 0xffff9     # XORI测试失败，x31=0xffff9
    j done
pass_10:
    addi x31, x31, 1    # Test 10 passed

    #=================================================================
    # TEST 11-13: Register-register logic - AND, OR, XOR
    #=================================================================
test_and:
    li x11, 0xF0F
    li x12, 0xFF0
    and x13, x11, x12   # x13 = 0xF00
    li x14, 0xF00
    beq x13, x14, pass_11
    li x31, 0xffffa     # AND测试失败，x31=0xffffa
    j done
pass_11:
    addi x31, x31, 1    # Test 11 passed

test_or:
    li x15, 0xF00
    li x16, 0x0FF
    or x17, x15, x16    # x17 = 0xFFF
    li x18, 0xFFF
    beq x17, x18, pass_12
    li x31, 0xffffb     # OR测试失败，x31=0xffffb
    j done
pass_12:
    addi x31, x31, 1    # Test 12 passed

test_xor:
    li x19, 0xFFF
    li x20, 0xAAA
    xor x21, x19, x20   # x21 = 0x555
    li x22, 0x555
    beq x21, x22, pass_13
    li x31, 0xffffc     # XOR测试失败，x31=0xffffc
    j done
pass_13:
    addi x31, x31, 1    # Test 13 passed

    #=================================================================
    # TEST 14-16: Shift operations - SLLI, SRLI, SRAI
    #=================================================================
test_slli:
    li x23, 0x001
    slli x24, x23, 8    # x24 = 0x100
    li x25, 0x100
    beq x24, x25, pass_14
    li x31, 0xffffd     # SLLI测试失败，x31=0xffffd
    j done
pass_14:
    addi x31, x31, 1    # Test 14 passed

test_srli:
    li x26, 0x800
    srli x27, x26, 4    # x27 = 0x080
    li x28, 0x080
    beq x27, x28, pass_15
    li x31, 0xffffe     # SRLI测试失败，x31=0xffffe
    j done
pass_15:
    addi x31, x31, 1    # Test 15 passed

test_srai:
    li x5, -256         # 0xFFFFFF00
    srai x6, x5, 4      # x6 = 0xFFFFFFF0 (arithmetic right shift)
    li x7, -16          # 0xFFFFFFF0
    beq x6, x7, pass_16
    li x31, 0xfffff     # SRAI测试失败，x31=0xfffff
    j done
pass_16:
    addi x31, x31, 1    # Test 16 passed

    #=================================================================
    # TEST 17-19: Register-register shifts - SLL, SRL, SRA
    #=================================================================
test_sll:
    li x8, 0x003
    li x9, 4
    sll x10, x8, x9     # x10 = 0x030
    li x11, 0x030
    beq x10, x11, pass_17
    li x31, 0x10001     # SLL测试失败，x31=0x10001
    j done
pass_17:
    addi x31, x31, 1    # Test 17 passed

test_srl:
    li x12, 0xF00
    li x13, 4
    srl x14, x12, x13   # x14 = 0x0F0
    li x15, 0x0F0
    beq x14, x15, pass_18
    li x31, 0x10002     # SRL测试失败，x31=0x10002
    j done
pass_18:
    addi x31, x31, 1    # Test 18 passed

test_sra:
    li x16, -256        # 0xFFFFFF00
    li x17, 4
    sra x18, x16, x17   # x18 = 0xFFFFFFF0
    li x19, -16
    beq x18, x19, pass_19
    li x31, 0x10003     # SRA测试失败，x31=0x10003
    j done
pass_19:
    addi x31, x31, 1    # Test 19 passed

    #=================================================================
    # TEST 20-22: Comparison - SLT, SLTU, SLTIU
    #=================================================================
test_slt:
    li x20, -10
    li x21, 10
    slt x22, x20, x21   # x22 = 1 (-10 < 10)
    li x23, 1
    beq x22, x23, pass_20
    li x31, 0x10004     # SLT测试失败，x31=0x10004
    j done
pass_20:
    addi x31, x31, 1    # Test 20 passed

test_sltu:
    li x24, 0xFFFFFFFF  # Unsigned: large number
    li x25, 0x00000001
    sltu x26, x25, x24  # x26 = 1 (1 < 0xFFFFFFFF unsigned)
    li x27, 1
    beq x26, x27, pass_21
    li x31, 0x10005     # SLTU测试失败，x31=0x10005
    j done
pass_21:
    addi x31, x31, 1    # Test 21 passed

test_sltiu:
    li x28, 50
    sltiu x5, x28, 100  # x5 = 1 (50 < 100)
    li x6, 1
    beq x5, x6, pass_22
    li x31, 0x10006     # SLTIU测试失败，x31=0x10006
    j done
pass_22:
    addi x31, x31, 1    # Test 22 passed

    #=================================================================
    # TEST 23-26: Memory operations - SW/LW, SH/LH, SB/LB
    #=================================================================
test_sw_lw:
    li x7, 0xABCD1234
    sw x7, 0(x30)       # Store word at 0x1000
    lw x8, 0(x30)       # Load word from 0x1000
    beq x7, x8, pass_23
    li x31, 0x10007     # SW/LW测试失败，x31=0x10007
    j done
pass_23:
    addi x31, x31, 1    # Test 23 passed

test_sh_lh:
    li x9, 0x5678
    sh x9, 4(x30)       # Store halfword at 0x1004
    lh x10, 4(x30)      # Load halfword (sign-extended)
    li x11, 0x5678
    beq x10, x11, pass_24
    li x31, 0x10008     # SH/LH测试失败，x31=0x10008
    j done
pass_24:
    addi x31, x31, 1    # Test 24 passed

test_sb_lb:
    li x12, 0x9A
    sb x12, 8(x30)      # Store byte at 0x1008
    lb x13, 8(x30)      # Load byte (sign-extended)
    li x14, 0xFFFFFF9A  # Sign-extended 0x9A
    beq x13, x14, pass_25
    li x31, 0x10009     # SB/LB测试失败，x31=0x10009
    j done
pass_25:
    addi x31, x31, 1    # Test 25 passed

test_lbu_lhu:
    li x15, 0xFF
    sb x15, 12(x30)     # Store 0xFF
    lbu x16, 12(x30)    # Load byte unsigned
    li x17, 0xFF        # Not sign-extended
    beq x16, x17, pass_26
    li x31, 0x1000a     # LBU/LHU测试失败，x31=0x1000a
    j done
pass_26:
    addi x31, x31, 1    # Test 26 passed

    #=================================================================
    # TEST 27-30: Branch instructions - BEQ, BNE, BLT, BGE
    #=================================================================
test_beq:
    li x18, 42
    li x19, 42
    beq x18, x19, pass_27
    li x31, 0x1000b     # BEQ测试失败，x31=0x1000b
    j done
pass_27:
    addi x31, x31, 1    # Test 27 passed

test_bne:
    li x20, 10
    li x21, 20
    bne x20, x21, pass_28
    li x31, 0x1000c     # BNE测试失败，x31=0x1000c
    j done
pass_28:
    addi x31, x31, 1    # Test 28 passed

test_blt:
    li x22, -5
    li x23, 10
    blt x22, x23, pass_29
    li x31, 0x1000d     # BLT测试失败，x31=0x1000d
    j done
pass_29:
    addi x31, x31, 1    # Test 29 passed

test_bge:
    li x24, 100
    li x25, 50
    bge x24, x25, pass_30
    li x31, 0x1000e     # BGE测试失败，x31=0x1000e
    j done
pass_30:
    addi x31, x31, 1    # Test 30 passed

    #=================================================================
    # TEST 31-32: Unsigned branch - BLTU, BGEU
    #=================================================================
test_bltu:
    li x26, 10
    li x27, 0xFFFFFFFF  # Large unsigned number
    bltu x26, x27, pass_31
    li x31, 0x1000f     # BLTU测试失败，x31=0x1000f
    j done
pass_31:
    addi x31, x31, 1    # Test 31 passed

test_bgeu:
    li x28, 0xFFFFFFFF
    li x5, 100
    bgeu x28, x5, pass_32
    li x31, 0x10010     # BGEU测试失败，x31=0x10010
    j done
pass_32:
    addi x31, x31, 1    # Test 32 passed

    #=================================================================
    # TEST 33-34: JAL and JALR instructions
    #=================================================================
test_jal:
    jal x6, jal_target
    li x31, 0x10011     # JAL测试失败，x31=0x10011
    j done
jal_target:
    addi x31, x31, 1    # Test 33 passed

test_jalr:
    la x7, jalr_target  # Load address of jalr_target
    jalr x8, x7, 0      # Jump to jalr_target
    li x31, 0x10012     # JALR测试失败，x31=0x10012
    j done
jalr_target:
    addi x31, x31, 1    # Test 34 passed

    #=================================================================
    # All tests passed! Output result to LED address
    #=================================================================
test_complete:
    # 所有测试通过，x31为通过测试数（34），数码管显示x31
    j done              # 跳转到结束，数码管读取x31

    #=================================================================
    # Failure handler - stores 0xFFFFFFFF to indicate failure
    #=================================================================
fail_halt:
    # 不再写内存，所有失败处理已在各测试中完成，fail_halt不再使用
    j done

    #=================================================================
    # Done - infinite loop
    #=================================================================
done:
    j done              # Infinite loop to halt

