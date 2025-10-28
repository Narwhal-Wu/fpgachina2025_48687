
test_output\rv32i_test.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00000f93          	li	t6,0
   4:	00001f37          	lui	t5,0x1

00000008 <test_lui>:
   8:	123452b7          	lui	t0,0x12345
   c:	12345337          	lui	t1,0x12345
  10:	00628863          	beq	t0,t1,20 <pass_1>
  14:	00100fb7          	lui	t6,0x100
  18:	ff1f8f93          	addi	t6,t6,-15 # ffff1 <_stack_top+0xbfff1>
  1c:	46c0006f          	j	488 <done>

00000020 <pass_1>:
  20:	001f8f93          	addi	t6,t6,1

00000024 <test_auipc>:
  24:	00000397          	auipc	t2,0x0
  28:	00001417          	auipc	s0,0x1
  2c:	407404b3          	sub	s1,s0,t2
  30:	00001537          	lui	a0,0x1
  34:	ff050513          	addi	a0,a0,-16 # ff0 <_erodata+0xb64>
  38:	00954863          	blt	a0,s1,48 <pass_2>
  3c:	00100fb7          	lui	t6,0x100
  40:	ff2f8f93          	addi	t6,t6,-14 # ffff2 <_stack_top+0xbfff2>
  44:	4440006f          	j	488 <done>

00000048 <pass_2>:
  48:	001f8f93          	addi	t6,t6,1
  4c:	001f8f93          	addi	t6,t6,1

00000050 <test_addi>:
  50:	06400593          	li	a1,100
  54:	03258613          	addi	a2,a1,50
  58:	09600693          	li	a3,150
  5c:	00d60863          	beq	a2,a3,6c <pass_4>
  60:	00100fb7          	lui	t6,0x100
  64:	ff3f8f93          	addi	t6,t6,-13 # ffff3 <_stack_top+0xbfff3>
  68:	4200006f          	j	488 <done>

0000006c <pass_4>:
  6c:	001f8f93          	addi	t6,t6,1

00000070 <test_add>:
  70:	0c800713          	li	a4,200
  74:	12c00793          	li	a5,300
  78:	00f70833          	add	a6,a4,a5
  7c:	1f400893          	li	a7,500
  80:	01180863          	beq	a6,a7,90 <pass_5>
  84:	00100fb7          	lui	t6,0x100
  88:	ff4f8f93          	addi	t6,t6,-12 # ffff4 <_stack_top+0xbfff4>
  8c:	3fc0006f          	j	488 <done>

00000090 <pass_5>:
  90:	001f8f93          	addi	t6,t6,1

00000094 <test_sub>:
  94:	3e800913          	li	s2,1000
  98:	19000993          	li	s3,400
  9c:	41390a33          	sub	s4,s2,s3
  a0:	25800a93          	li	s5,600
  a4:	015a0863          	beq	s4,s5,b4 <pass_6>
  a8:	00100fb7          	lui	t6,0x100
  ac:	ff5f8f93          	addi	t6,t6,-11 # ffff5 <_stack_top+0xbfff5>
  b0:	3d80006f          	j	488 <done>

000000b4 <pass_6>:
  b4:	001f8f93          	addi	t6,t6,1

000000b8 <test_slti>:
  b8:	03200b13          	li	s6,50
  bc:	064b2b93          	slti	s7,s6,100
  c0:	00100c13          	li	s8,1
  c4:	018b8863          	beq	s7,s8,d4 <pass_7>
  c8:	00100fb7          	lui	t6,0x100
  cc:	ff6f8f93          	addi	t6,t6,-10 # ffff6 <_stack_top+0xbfff6>
  d0:	3b80006f          	j	488 <done>

000000d4 <pass_7>:
  d4:	001f8f93          	addi	t6,t6,1

000000d8 <test_andi>:
  d8:	00001cb7          	lui	s9,0x1
  dc:	ff0c8c93          	addi	s9,s9,-16 # ff0 <_erodata+0xb64>
  e0:	0ffcfd13          	andi	s10,s9,255
  e4:	0f000d93          	li	s11,240
  e8:	01bd0863          	beq	s10,s11,f8 <pass_8>
  ec:	00100fb7          	lui	t6,0x100
  f0:	ff7f8f93          	addi	t6,t6,-9 # ffff7 <_stack_top+0xbfff7>
  f4:	3940006f          	j	488 <done>

000000f8 <pass_8>:
  f8:	001f8f93          	addi	t6,t6,1

000000fc <test_ori>:
  fc:	000012b7          	lui	t0,0x1
 100:	f0028293          	addi	t0,t0,-256 # f00 <_erodata+0xa74>
 104:	0ff2e313          	ori	t1,t0,255
 108:	000013b7          	lui	t2,0x1
 10c:	fff38393          	addi	t2,t2,-1 # fff <_erodata+0xb73>
 110:	00730863          	beq	t1,t2,120 <pass_9>
 114:	00100fb7          	lui	t6,0x100
 118:	ff8f8f93          	addi	t6,t6,-8 # ffff8 <_stack_top+0xbfff8>
 11c:	36c0006f          	j	488 <done>

00000120 <pass_9>:
 120:	001f8f93          	addi	t6,t6,1

00000124 <test_xori>:
 124:	00001437          	lui	s0,0x1
 128:	aaa40413          	addi	s0,s0,-1366 # aaa <_erodata+0x61e>
 12c:	7ff44493          	xori	s1,s0,2047
 130:	00001537          	lui	a0,0x1
 134:	d5550513          	addi	a0,a0,-683 # d55 <_erodata+0x8c9>
 138:	00a48863          	beq	s1,a0,148 <pass_10>
 13c:	00100fb7          	lui	t6,0x100
 140:	ff9f8f93          	addi	t6,t6,-7 # ffff9 <_stack_top+0xbfff9>
 144:	3440006f          	j	488 <done>

00000148 <pass_10>:
 148:	001f8f93          	addi	t6,t6,1

0000014c <test_and>:
 14c:	000015b7          	lui	a1,0x1
 150:	f0f58593          	addi	a1,a1,-241 # f0f <_erodata+0xa83>
 154:	00001637          	lui	a2,0x1
 158:	ff060613          	addi	a2,a2,-16 # ff0 <_erodata+0xb64>
 15c:	00c5f6b3          	and	a3,a1,a2
 160:	00001737          	lui	a4,0x1
 164:	f0070713          	addi	a4,a4,-256 # f00 <_erodata+0xa74>
 168:	00e68863          	beq	a3,a4,178 <pass_11>
 16c:	00100fb7          	lui	t6,0x100
 170:	ffaf8f93          	addi	t6,t6,-6 # ffffa <_stack_top+0xbfffa>
 174:	3140006f          	j	488 <done>

00000178 <pass_11>:
 178:	001f8f93          	addi	t6,t6,1

0000017c <test_or>:
 17c:	000017b7          	lui	a5,0x1
 180:	f0078793          	addi	a5,a5,-256 # f00 <_erodata+0xa74>
 184:	0ff00813          	li	a6,255
 188:	0107e8b3          	or	a7,a5,a6
 18c:	00001937          	lui	s2,0x1
 190:	fff90913          	addi	s2,s2,-1 # fff <_erodata+0xb73>
 194:	01288863          	beq	a7,s2,1a4 <pass_12>
 198:	00100fb7          	lui	t6,0x100
 19c:	ffbf8f93          	addi	t6,t6,-5 # ffffb <_stack_top+0xbfffb>
 1a0:	2e80006f          	j	488 <done>

000001a4 <pass_12>:
 1a4:	001f8f93          	addi	t6,t6,1

000001a8 <test_xor>:
 1a8:	000019b7          	lui	s3,0x1
 1ac:	fff98993          	addi	s3,s3,-1 # fff <_erodata+0xb73>
 1b0:	00001a37          	lui	s4,0x1
 1b4:	aaaa0a13          	addi	s4,s4,-1366 # aaa <_erodata+0x61e>
 1b8:	0149cab3          	xor	s5,s3,s4
 1bc:	55500b13          	li	s6,1365
 1c0:	016a8863          	beq	s5,s6,1d0 <pass_13>
 1c4:	00100fb7          	lui	t6,0x100
 1c8:	ffcf8f93          	addi	t6,t6,-4 # ffffc <_stack_top+0xbfffc>
 1cc:	2bc0006f          	j	488 <done>

000001d0 <pass_13>:
 1d0:	001f8f93          	addi	t6,t6,1

000001d4 <test_slli>:
 1d4:	00100b93          	li	s7,1
 1d8:	008b9c13          	slli	s8,s7,0x8
 1dc:	10000c93          	li	s9,256
 1e0:	019c0863          	beq	s8,s9,1f0 <pass_14>
 1e4:	00100fb7          	lui	t6,0x100
 1e8:	ffdf8f93          	addi	t6,t6,-3 # ffffd <_stack_top+0xbfffd>
 1ec:	29c0006f          	j	488 <done>

000001f0 <pass_14>:
 1f0:	001f8f93          	addi	t6,t6,1

000001f4 <test_srli>:
 1f4:	00001d37          	lui	s10,0x1
 1f8:	800d0d13          	addi	s10,s10,-2048 # 800 <_erodata+0x374>
 1fc:	004d5d93          	srli	s11,s10,0x4
 200:	08000e13          	li	t3,128
 204:	01cd8863          	beq	s11,t3,214 <pass_15>
 208:	00100fb7          	lui	t6,0x100
 20c:	ffef8f93          	addi	t6,t6,-2 # ffffe <_stack_top+0xbfffe>
 210:	2780006f          	j	488 <done>

00000214 <pass_15>:
 214:	001f8f93          	addi	t6,t6,1

00000218 <test_srai>:
 218:	f0000293          	li	t0,-256
 21c:	4042d313          	srai	t1,t0,0x4
 220:	ff000393          	li	t2,-16
 224:	00730863          	beq	t1,t2,234 <pass_16>
 228:	00100fb7          	lui	t6,0x100
 22c:	ffff8f93          	addi	t6,t6,-1 # fffff <_stack_top+0xbffff>
 230:	2580006f          	j	488 <done>

00000234 <pass_16>:
 234:	001f8f93          	addi	t6,t6,1

00000238 <test_sll>:
 238:	00300413          	li	s0,3
 23c:	00400493          	li	s1,4
 240:	00941533          	sll	a0,s0,s1
 244:	03000593          	li	a1,48
 248:	00b50863          	beq	a0,a1,258 <pass_17>
 24c:	00010fb7          	lui	t6,0x10
 250:	001f8f93          	addi	t6,t6,1 # 10001 <STACK_SIZE+0xe001>
 254:	2340006f          	j	488 <done>

00000258 <pass_17>:
 258:	001f8f93          	addi	t6,t6,1

0000025c <test_srl>:
 25c:	00001637          	lui	a2,0x1
 260:	f0060613          	addi	a2,a2,-256 # f00 <_erodata+0xa74>
 264:	00400693          	li	a3,4
 268:	00d65733          	srl	a4,a2,a3
 26c:	0f000793          	li	a5,240
 270:	00f70863          	beq	a4,a5,280 <pass_18>
 274:	00010fb7          	lui	t6,0x10
 278:	002f8f93          	addi	t6,t6,2 # 10002 <STACK_SIZE+0xe002>
 27c:	20c0006f          	j	488 <done>

00000280 <pass_18>:
 280:	001f8f93          	addi	t6,t6,1

00000284 <test_sra>:
 284:	f0000813          	li	a6,-256
 288:	00400893          	li	a7,4
 28c:	41185933          	sra	s2,a6,a7
 290:	ff000993          	li	s3,-16
 294:	01390863          	beq	s2,s3,2a4 <pass_19>
 298:	00010fb7          	lui	t6,0x10
 29c:	003f8f93          	addi	t6,t6,3 # 10003 <STACK_SIZE+0xe003>
 2a0:	1e80006f          	j	488 <done>

000002a4 <pass_19>:
 2a4:	001f8f93          	addi	t6,t6,1

000002a8 <test_slt>:
 2a8:	ff600a13          	li	s4,-10
 2ac:	00a00a93          	li	s5,10
 2b0:	015a2b33          	slt	s6,s4,s5
 2b4:	00100b93          	li	s7,1
 2b8:	017b0863          	beq	s6,s7,2c8 <pass_20>
 2bc:	00010fb7          	lui	t6,0x10
 2c0:	004f8f93          	addi	t6,t6,4 # 10004 <STACK_SIZE+0xe004>
 2c4:	1c40006f          	j	488 <done>

000002c8 <pass_20>:
 2c8:	001f8f93          	addi	t6,t6,1

000002cc <test_sltu>:
 2cc:	fff00c13          	li	s8,-1
 2d0:	00100c93          	li	s9,1
 2d4:	018cbd33          	sltu	s10,s9,s8
 2d8:	00100d93          	li	s11,1
 2dc:	01bd0863          	beq	s10,s11,2ec <pass_21>
 2e0:	00010fb7          	lui	t6,0x10
 2e4:	005f8f93          	addi	t6,t6,5 # 10005 <STACK_SIZE+0xe005>
 2e8:	1a00006f          	j	488 <done>

000002ec <pass_21>:
 2ec:	001f8f93          	addi	t6,t6,1

000002f0 <test_sltiu>:
 2f0:	03200e13          	li	t3,50
 2f4:	064e3293          	sltiu	t0,t3,100
 2f8:	00100313          	li	t1,1
 2fc:	00628863          	beq	t0,t1,30c <pass_22>
 300:	00010fb7          	lui	t6,0x10
 304:	006f8f93          	addi	t6,t6,6 # 10006 <STACK_SIZE+0xe006>
 308:	1800006f          	j	488 <done>

0000030c <pass_22>:
 30c:	001f8f93          	addi	t6,t6,1

00000310 <test_sw_lw>:
 310:	abcd13b7          	lui	t2,0xabcd1
 314:	23438393          	addi	t2,t2,564 # abcd1234 <_stack_top+0xabc91234>
 318:	007f2023          	sw	t2,0(t5) # 1000 <_erodata+0xb74>
 31c:	000f2403          	lw	s0,0(t5)
 320:	00838863          	beq	t2,s0,330 <pass_23>
 324:	00010fb7          	lui	t6,0x10
 328:	007f8f93          	addi	t6,t6,7 # 10007 <STACK_SIZE+0xe007>
 32c:	15c0006f          	j	488 <done>

00000330 <pass_23>:
 330:	001f8f93          	addi	t6,t6,1

00000334 <test_sh_lh>:
 334:	000054b7          	lui	s1,0x5
 338:	67848493          	addi	s1,s1,1656 # 5678 <STACK_SIZE+0x3678>
 33c:	009f1223          	sh	s1,4(t5)
 340:	004f1503          	lh	a0,4(t5)
 344:	000055b7          	lui	a1,0x5
 348:	67858593          	addi	a1,a1,1656 # 5678 <STACK_SIZE+0x3678>
 34c:	00b50863          	beq	a0,a1,35c <pass_24>
 350:	00010fb7          	lui	t6,0x10
 354:	008f8f93          	addi	t6,t6,8 # 10008 <STACK_SIZE+0xe008>
 358:	1300006f          	j	488 <done>

0000035c <pass_24>:
 35c:	001f8f93          	addi	t6,t6,1

00000360 <test_sb_lb>:
 360:	09a00613          	li	a2,154
 364:	00cf0423          	sb	a2,8(t5)
 368:	008f0683          	lb	a3,8(t5)
 36c:	f9a00713          	li	a4,-102
 370:	00e68863          	beq	a3,a4,380 <pass_25>
 374:	00010fb7          	lui	t6,0x10
 378:	009f8f93          	addi	t6,t6,9 # 10009 <STACK_SIZE+0xe009>
 37c:	10c0006f          	j	488 <done>

00000380 <pass_25>:
 380:	001f8f93          	addi	t6,t6,1

00000384 <test_lbu_lhu>:
 384:	0ff00793          	li	a5,255
 388:	00ff0623          	sb	a5,12(t5)
 38c:	00cf4803          	lbu	a6,12(t5)
 390:	0ff00893          	li	a7,255
 394:	01180863          	beq	a6,a7,3a4 <pass_26>
 398:	00010fb7          	lui	t6,0x10
 39c:	00af8f93          	addi	t6,t6,10 # 1000a <STACK_SIZE+0xe00a>
 3a0:	0e80006f          	j	488 <done>

000003a4 <pass_26>:
 3a4:	001f8f93          	addi	t6,t6,1

000003a8 <test_beq>:
 3a8:	02a00913          	li	s2,42
 3ac:	02a00993          	li	s3,42
 3b0:	01390863          	beq	s2,s3,3c0 <pass_27>
 3b4:	00010fb7          	lui	t6,0x10
 3b8:	00bf8f93          	addi	t6,t6,11 # 1000b <STACK_SIZE+0xe00b>
 3bc:	0cc0006f          	j	488 <done>

000003c0 <pass_27>:
 3c0:	001f8f93          	addi	t6,t6,1

000003c4 <test_bne>:
 3c4:	00a00a13          	li	s4,10
 3c8:	01400a93          	li	s5,20
 3cc:	015a1863          	bne	s4,s5,3dc <pass_28>
 3d0:	00010fb7          	lui	t6,0x10
 3d4:	00cf8f93          	addi	t6,t6,12 # 1000c <STACK_SIZE+0xe00c>
 3d8:	0b00006f          	j	488 <done>

000003dc <pass_28>:
 3dc:	001f8f93          	addi	t6,t6,1

000003e0 <test_blt>:
 3e0:	ffb00b13          	li	s6,-5
 3e4:	00a00b93          	li	s7,10
 3e8:	017b4863          	blt	s6,s7,3f8 <pass_29>
 3ec:	00010fb7          	lui	t6,0x10
 3f0:	00df8f93          	addi	t6,t6,13 # 1000d <STACK_SIZE+0xe00d>
 3f4:	0940006f          	j	488 <done>

000003f8 <pass_29>:
 3f8:	001f8f93          	addi	t6,t6,1

000003fc <test_bge>:
 3fc:	06400c13          	li	s8,100
 400:	03200c93          	li	s9,50
 404:	019c5863          	ble	s9,s8,414 <pass_30>
 408:	00010fb7          	lui	t6,0x10
 40c:	00ef8f93          	addi	t6,t6,14 # 1000e <STACK_SIZE+0xe00e>
 410:	0780006f          	j	488 <done>

00000414 <pass_30>:
 414:	001f8f93          	addi	t6,t6,1

00000418 <test_bltu>:
 418:	00a00d13          	li	s10,10
 41c:	fff00d93          	li	s11,-1
 420:	01bd6863          	bltu	s10,s11,430 <pass_31>
 424:	00010fb7          	lui	t6,0x10
 428:	00ff8f93          	addi	t6,t6,15 # 1000f <STACK_SIZE+0xe00f>
 42c:	05c0006f          	j	488 <done>

00000430 <pass_31>:
 430:	001f8f93          	addi	t6,t6,1

00000434 <test_bgeu>:
 434:	fff00e13          	li	t3,-1
 438:	06400293          	li	t0,100
 43c:	005e7863          	bleu	t0,t3,44c <pass_32>
 440:	00010fb7          	lui	t6,0x10
 444:	010f8f93          	addi	t6,t6,16 # 10010 <STACK_SIZE+0xe010>
 448:	0400006f          	j	488 <done>

0000044c <pass_32>:
 44c:	001f8f93          	addi	t6,t6,1

00000450 <test_jal>:
 450:	0100036f          	jal	t1,460 <jal_target>
 454:	00010fb7          	lui	t6,0x10
 458:	011f8f93          	addi	t6,t6,17 # 10011 <STACK_SIZE+0xe011>
 45c:	02c0006f          	j	488 <done>

00000460 <jal_target>:
 460:	001f8f93          	addi	t6,t6,1

00000464 <test_jalr>:
 464:	00000397          	auipc	t2,0x0
 468:	01838393          	addi	t2,t2,24 # 47c <jalr_target>
 46c:	00038467          	jalr	s0,t2
 470:	00010fb7          	lui	t6,0x10
 474:	012f8f93          	addi	t6,t6,18 # 10012 <STACK_SIZE+0xe012>
 478:	0100006f          	j	488 <done>

0000047c <jalr_target>:
 47c:	001f8f93          	addi	t6,t6,1

00000480 <test_complete>:
 480:	0080006f          	j	488 <done>

00000484 <fail_halt>:
 484:	0040006f          	j	488 <done>

00000488 <done>:
 488:	0000006f          	j	488 <done>
