.section .text
.globl _start

/*
  bench_branch_predict.s
  - 三类分支模式的可重复基准：
    1) always-taken:   计数器递减，bnez 回环（大多数取跳转）
    2) mostly-not-tk:  大多数不跳（只有最后一次为真）
    3) alternate:      条件交替（约一半跳转）
  - 可选外设计时器（AHB 从设备，基址 0x4000_0000），若未接入也可运行。
  - 最终将进度/结果累积到 x31(t6)，便于 7 段数码管显示。
*/

/* 参数 */
.set WARM_ITERS,   512
.set MEAS_ITERS,  8192

/* 计时器 MMIO 基址（与 tests/rtl/AHB_decoder.v 对应：0x4000_0000~0x7FFF_FFFF 为从设备1） */
.set TIMER_BASE,   0x40000000
.set TMR_CNT_LO,   0x00
.set TMR_CNT_HI,   0x04
.set TMR_CTRL,     0x08
.set TMR_ID,       0x0C
.set TMR_ID_VAL,   0x54494D52   /* 'TIMR' */

/* 标记用 MMIO（可选）：若外设实现写 0x3000_0000 开始的 MARK，便于逻辑分析/示波 */
.set MARK_BASE,    0x30000000
.set MARK_START,   0x00
.set MARK_END,     0x04

/* 寄存器约定
  t6(x31): 显示/进度累计
  a0:      迭代次数或返回值
  s0-s1:   64 位计时读数（可选）
  t0-t5:   临时
*/

_start:
    li      t6, 0                  # 清显示寄存器

    /* 预热（用于未来的分支预测）：不计时 */
    li      a0, WARM_ITERS
    jal     ra, loop_always_taken
    li      a0, WARM_ITERS
    jal     ra, loop_mostly_not_taken
    li      a0, WARM_ITERS
    jal     ra, loop_alternate

    /* Case 1: always-taken */
    jal     ra, mark_start
    jal     ra, timer_reset
    li      a0, MEAS_ITERS
    jal     ra, loop_always_taken
    jal     ra, mark_end
    jal     ra, timer_read64           # s1:s0 = cycles
    addi    t6, t6, 1                  # 标记完成 Case 1

    /* Case 2: mostly-not-taken */
    jal     ra, mark_start
    jal     ra, timer_reset
    li      a0, MEAS_ITERS
    jal     ra, loop_mostly_not_taken
    jal     ra, mark_end
    jal     ra, timer_read64
    addi    t6, t6, 1                  # 标记完成 Case 2

    /* Case 3: alternate */
    jal     ra, mark_start
    jal     ra, timer_reset
    li      a0, MEAS_ITERS
    jal     ra, loop_alternate
    jal     ra, mark_end
    jal     ra, timer_read64
    addi    t6, t6, 1                  # 标记完成 Case 3

bench_done:
    j       bench_done                 # 停机

/* -------------------------------------- */
/* 分支模式实现                           */
/* -------------------------------------- */
/* always-taken: bnez 总是成立直到最后一次 */
loop_always_taken:
    mv      t0, a0
1:  addi    t0, t0, -1
    bnez    t0, 1b
    ret

/* mostly-not-taken: 只有最后一次为真
   结构：先判断是否为 0（绝大多数为假），最后一次跳出 */
loop_mostly_not_taken:
    mv      t0, a0
1:  beq     t0, x0, 2f        # 大多数周期不跳
    addi    t0, t0, -1
    j       1b
2:  ret

/* alternate: 条件交替，约一半跳转 */
loop_alternate:
    mv      t0, a0
    li      t1, 1
1:  xori    t1, t1, 1
    beq     t1, x0, 2f         # 一半命中跳转
    addi    t0, t0, -1
2:  bnez    t0, 1b
    ret

/* -------------------------------------- */
/* 计时器/标记（可选外设，不存在时安全降级） */
/* -------------------------------------- */
/* 写 MARK_START */
mark_start:
    la      t2, mark_start_addr
    lw      t0, 0(t2)
    beq     x0, x0, 1f
mark_start_addr:
    .word   MARK_BASE + MARK_START
1:
    sw      x0, 0(t0)          # 写入 0
    ret

/* 写 MARK_END */
mark_end:
    la      t2, mark_end_addr
    lw      t0, 0(t2)
    beq     x0, x0, 1f
mark_end_addr:
    .word   MARK_BASE + MARK_END
1:
    sw      x0, 0(t0)
    ret

/* 复位计时器：写 CTRL.bit0=1，若外设不存在，此写入仅会落在 BRAM 映射别处，不影响功能 */
timer_reset:
    la      t2, tmr_ctrl_addr
    lw      t0, 0(t2)
    li      t1, 1
    sw      t1, 0(t0)
    ret

tmr_ctrl_addr:
    .word   TIMER_BASE + TMR_CTRL

/* 读 64 位计数器，返回 s1:s0
   读取流程：HI -> LO -> HI，确保一致性。若外设不存在，读值无定义，但不影响主流程。 */
timer_read64:
    la      t2, tmr_hi_addr
    lw      t3, 0(t2)          # t3 = &CNT_HI
    la      t2, tmr_lo_addr
    lw      t4, 0(t2)          # t4 = &CNT_LO

1:  lw      s1, 0(t3)          # HI1
    lw      s0, 0(t4)          # LO
    lw      t5, 0(t3)          # HI2
    bne     s1, t5, 1b         # 不一致则重读
    ret

tmr_lo_addr:
    .word   TIMER_BASE + TMR_CNT_LO

tmr_hi_addr:
    .word   TIMER_BASE + TMR_CNT_HI
