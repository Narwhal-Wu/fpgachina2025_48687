# test_simple_bram.s
# 简单BRAM写读测试：写入几个数据到BRAM，再读回校验，全部通过x31=3

.section .text
.global _start

_start:
    li x31, 0
    li x30, 0x1000    # BRAM基地址

    # 写入第一个数据
    li x1, 0x12345678
    sw x1, 0(x30)
    lw x2, 0(x30)
    lw x31, 0(x30)
    beq x1, x2, pass1
    j fail
pass1:

    # 写入第二个数据
    li x3, 0xAABBCCDD
    sw x3, 4(x30)
    lw x4, 4(x30)
    lw x31, 4(x30)
    beq x3, x4, pass2
    j fail
pass2:

    # 写入第三个数据
    li x5, 0x0F0F0F0F
    sw x5, 8(x30)
    lw x6, 8(x30)
    lw x31, 8(x30)
    beq x5, x6, pass3
    j fail
pass3:
    j end

fail:
    li x31, 0xDEAD
    j end

end:
    j end
