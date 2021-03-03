	.file	"draw.c"
| GNU C (GCC) version 4.8.0 (m68k-elf)
|	compiled by GNU C version 4.7.2, GMP version 4.2.4, MPFR version 2.4.1, MPC version 0.8
| GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
| options passed:  -imultilib m68000
| -iprefix d:\sysgcc\m68k-elf\bin\../lib/gcc/m68k-elf/4.8.0/
| C:/Users/zengfr/Desktop/c/test/make/../src/include/common/draw.c
| -mcpu=68000
| -auxbase-strip C:/Users/zengfr/Desktop/c/test/make/../src/include/common/draw.c.asm
| -O0 -Winline -Wall -std=c99 -fomit-frame-pointer -fverbose-asm
| options enabled:  -faggressive-loop-optimizations -fauto-inc-dec
| -fbranch-count-reg -fcommon -fdelete-null-pointer-checks -fdwarf2-cfi-asm
| -fearly-inlining -feliminate-unused-debug-types -ffunction-cse -fgcse-lm
| -fgnu-runtime -fident -finline-atomics -fira-hoist-pressure
| -fira-share-save-slots -fira-share-spill-slots -fivopts
| -fkeep-static-consts -fleading-underscore -fmath-errno
| -fmerge-debug-strings -fmove-loop-invariants -fomit-frame-pointer
| -fpeephole -fprefetch-loop-arrays -freg-struct-return
| -fsched-critical-path-heuristic -fsched-dep-count-heuristic
| -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
| -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
| -fsched-stalled-insns-dep -fshow-column -fsigned-zeros
| -fsplit-ivs-in-unroller -fstrict-volatile-bitfields -fsync-libcalls
| -ftrapping-math -ftree-coalesce-vars -ftree-forwprop
| -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
| -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pta
| -ftree-reassoc -ftree-scev-cprop -ftree-slp-vectorize
| -ftree-vect-loop-version -funit-at-a-time -fverbose-asm
| -fzero-initialized-in-bss -mstrict-align

	.text
	.align	2
	.globl	show_char
	.type	show_char, @function
show_char:
	lea (-24,%sp),%sp	|,
	move.l %d2,-(%sp)	|,
	move.l 32(%sp),%a1	| x, tmp44
	move.l 36(%sp),%a0	| y, tmp45
	move.l 40(%sp),%d1	| palette, tmp46
	move.l 44(%sp),%d0	| c, tmp47
	move.w %a1,%d2	|,
	move.b %d2,12(%sp)	|, x
	move.w %a0,%d2	|,
	move.b %d2,10(%sp)	|, y
	move.b %d1,8(%sp)	| tmp46, palette
	move.w %d0,6(%sp)	| tmp47, c
	move.w #-24568,26(%sp)	|, offect
	clr.w %d0	| tmp48
	move.b 12(%sp),%d0	| x, tmp48
	move.w %d0,24(%sp)	| tmp48, px
	clr.w %d0	| tmp49
	move.b 10(%sp),%d0	| y, tmp49
	move.w %d0,22(%sp)	| tmp49, py
	moveq #0,%d1	| D.2441
	move.b 8(%sp),%d1	| palette, D.2441
	moveq #0,%d0	| D.2441
	move.w 6(%sp),%d0	| c, D.2441
	swap %d0	| D.2441
	clr.w %d0	| D.2441
	or.l %d1,%d0	| D.2441, D.2441
	move.l %d0,18(%sp)	| D.2441, data
	moveq #0,%d1	| D.2441
	move.w 26(%sp),%d1	| offect, D.2441
	moveq #0,%d0	| D.2441
	move.w 24(%sp),%d0	| px, D.2441
	lsl.l #7,%d0	|, D.2441
	add.l %d0,%d1	| D.2441, D.2441
	moveq #0,%d0	| D.2441
	move.w 22(%sp),%d0	| py, D.2441
	add.l %d0,%d0	| D.2441, tmp50
	add.l %d0,%d0	| tmp50, tmp51
	add.l %d1,%d0	| D.2441, D.2441
	move.l %d0,14(%sp)	| D.2441, index
	move.l 14(%sp),%d0	| index, tmp53
	lsr.l #2,%d0	|, tmp52
	move.l %d0,14(%sp)	| tmp52, index
	move.l 14(%sp),%d0	| index, tmp54
	add.l %d0,%d0	| tmp54, tmp55
	add.l %d0,%d0	| tmp55, tmp56
	add.l #9437184,%d0	|, D.2443
	move.l %d0,%a0	| D.2443,
	move.l 18(%sp),(%a0)	| data, *_23
	move.l (%sp)+,%d2	|,
	lea (24,%sp),%sp	|,
	rts
	.size	show_char, .-show_char
	.align	2
	.globl	show_string
	.type	show_string, @function
show_string:
	subq.l #8,%sp	|,
	move.l %d2,-(%sp)	|,
	move.l 16(%sp),%a0	| x, tmp40
	move.l 20(%sp),%d1	| y, tmp41
	move.l 24(%sp),%d0	| palette, tmp42
	move.w %a0,%d2	|,
	move.b %d2,10(%sp)	|, x
	move.b %d1,8(%sp)	| tmp41, y
	move.b %d0,6(%sp)	| tmp42, palette
	jra .L3	|
.L4:
	move.l 28(%sp),%d0	| s, s.0
	move.l %d0,%d1	| s.0,
	addq.l #1,%d1	|,
	move.l %d1,28(%sp)	|, s
	move.l %d0,%a0	| s.0,
	move.b (%a0),%d0	| *s.0_6, D.2444
	ext.w %d0	| D.2445
	move.w %d0,%d0	| D.2445,
	and.l #65535,%d0	|,
	move.l %d0,%a1	|, D.2446
	moveq #0,%d0	|
	move.b 6(%sp),%d0	| palette,
	move.l %d0,%a0	|, D.2446
	moveq #0,%d1	| D.2446
	move.b 8(%sp),%d1	| y, D.2446
	move.b 10(%sp),%d0	| x, x.1
	move.b %d0,%d2	| x.1,
	addq.b #1,%d2	|,
	move.b %d2,10(%sp)	|, x
	move.b %d0,%d0	| x.1, D.2446
	and.l #255,%d0	|, D.2446
	move.l %a1,-(%sp)	| D.2446,
	move.l %a0,-(%sp)	| D.2446,
	move.l %d1,-(%sp)	| D.2446,
	move.l %d0,-(%sp)	| D.2446,
	jsr show_char	|
	lea (16,%sp),%sp	|,
.L3:
	move.l 28(%sp),%d0	| s, tmp43
	move.l %d0,%a0	| tmp43,
	move.b (%a0),%d0	| *s_2, D.2444
	tst.b %d0	| D.2444
	jne .L4	|
	move.l (%sp)+,%d2	|,
	addq.l #8,%sp	|,
	rts
	.size	show_string, .-show_string
	.align	2
	.globl	show_bits
	.type	show_bits, @function
show_bits:
	lea (-12,%sp),%sp	|,
	move.l %d2,-(%sp)	|,
	move.l 20(%sp),%a1	| x, tmp38
	move.l 24(%sp),%a0	| y, tmp39
	move.l 28(%sp),%d1	| palette, tmp40
	move.l 32(%sp),%d0	| data, tmp41
	move.w %a1,%d2	|,
	move.b %d2,10(%sp)	|, x
	move.w %a0,%d2	|,
	move.b %d2,8(%sp)	|, y
	move.b %d1,6(%sp)	| tmp40, palette
	move.w %d0,4(%sp)	| tmp41, data
	moveq #15,%d0	|,
	move.l %d0,12(%sp)	|, bit
	jra .L6	|
.L9:
	moveq #0,%d0	| D.2447
	move.w 4(%sp),%d0	| data, D.2447
	move.l 12(%sp),%d1	| bit,
	asr.l %d1,%d0	|, D.2447
	moveq #1,%d2	|,
	and.l %d2,%d0	|, D.2447
	tst.l %d0	| D.2447
	jeq .L7	|
	moveq #49,%d0	|, iftmp.2
	jra .L8	|
.L7:
	moveq #48,%d0	|, iftmp.2
.L8:
	moveq #0,%d1	|
	move.b 8(%sp),%d1	| y,
	move.l %d1,%a0	|, D.2447
	move.b 10(%sp),%d1	| x, x.3
	move.b %d1,%d2	| x.3,
	addq.b #1,%d2	|,
	move.b %d2,10(%sp)	|, x
	move.b %d1,%d1	| x.3, D.2447
	and.l #255,%d1	|, D.2447
	move.l %d0,-(%sp)	| iftmp.2,
	clr.l -(%sp)	|
	move.l %a0,-(%sp)	| D.2447,
	move.l %d1,-(%sp)	| D.2447,
	jsr show_char	|
	lea (16,%sp),%sp	|,
	subq.l #1,12(%sp)	|, bit
.L6:
	tst.l 12(%sp)	| bit
	jge .L9	|
	move.l (%sp)+,%d2	|,
	lea (12,%sp),%sp	|,
	rts
	.size	show_bits, .-show_bits
	.globl	__floatsidf
	.globl	__divdf3
	.globl	__fixunsdfsi
	.globl	__adddf3
	.globl	__ltdf2
	.align	2
	.globl	show_line
	.type	show_line, @function
show_line:
	lea (-56,%sp),%sp	|,
	move.l %d3,-(%sp)	|,
	move.l %d2,-(%sp)	|,
	move.l 84(%sp),%d0	| c, tmp43
	move.w %d0,10(%sp)	| tmp43, c
	move.l 76(%sp),%d0	| x1,
	sub.l 68(%sp),%d0	| x0,
	move.l %d0,32(%sp)	|, dx
	move.l 80(%sp),%d0	| y1,
	sub.l 72(%sp),%d0	| y0,
	move.l %d0,28(%sp)	|, dy
	move.l 68(%sp),-(%sp)	| x0,
	jsr __floatsidf	|
	addq.l #4,%sp	|,
	move.l %d0,52(%sp)	| tmp44, x
	move.l %d1,56(%sp)	|, x
	move.l 72(%sp),-(%sp)	| y0,
	jsr __floatsidf	|
	addq.l #4,%sp	|,
	move.l %d0,44(%sp)	| tmp45, y
	move.l %d1,48(%sp)	|, y
	move.l 28(%sp),%d0	| dy, tmp46
	tst.l %d0	| tmp46
	jge .L11	|
	neg.l %d0	| tmp46
.L11:
	move.l %d0,-(%sp)	| D.2448,
	jsr __floatsidf	|
	addq.l #4,%sp	|,
	move.l %d0,36(%sp)	| tmp47, espl
	move.l %d1,40(%sp)	|, espl
	move.l 32(%sp),%d0	| dx, tmp48
	tst.l %d0	| tmp48
	jge .L12	|
	neg.l %d0	| tmp48
.L12:
	move.l %d0,%d1	| tmp48, D.2448
	move.l 28(%sp),%d0	| dy, tmp49
	tst.l %d0	| tmp49
	jge .L13	|
	neg.l %d0	| tmp49
.L13:
	cmp.l %d1,%d0	| D.2448, D.2448
	jge .L14	|
	move.l 32(%sp),%d0	| dx, tmp50
	tst.l %d0	| tmp50
	jge .L15	|
	neg.l %d0	| tmp50
.L15:
	move.l %d0,-(%sp)	| D.2448,
	jsr __floatsidf	|
	addq.l #4,%sp	|,
	move.l %d0,36(%sp)	| tmp51, espl
	move.l %d1,40(%sp)	|, espl
.L14:
	move.l 32(%sp),-(%sp)	| dx,
	jsr __floatsidf	|
	addq.l #4,%sp	|,
	move.l 40(%sp),-(%sp)	| espl,
	move.l 40(%sp),-(%sp)	| espl,
	move.l %d1,-(%sp)	|,
	move.l %d0,-(%sp)	|,
	jsr __divdf3	|
	lea (16,%sp),%sp	|,
	move.l %d0,20(%sp)	| tmp52, xIncre
	move.l %d1,24(%sp)	|, xIncre
	move.l 28(%sp),-(%sp)	| dy,
	jsr __floatsidf	|
	addq.l #4,%sp	|,
	move.l 40(%sp),-(%sp)	| espl,
	move.l 40(%sp),-(%sp)	| espl,
	move.l %d1,-(%sp)	|,
	move.l %d0,-(%sp)	|,
	jsr __divdf3	|
	lea (16,%sp),%sp	|,
	move.l %d0,12(%sp)	| tmp53, yIncre
	move.l %d1,16(%sp)	|, yIncre
	clr.l 60(%sp)	| k
	jra .L16	|
.L17:
	moveq #0,%d3	| D.2448
	move.w 10(%sp),%d3	| c, D.2448
	move.l 48(%sp),-(%sp)	| y,
	move.l 48(%sp),-(%sp)	| y,
	jsr __fixunsdfsi	|
	addq.l #8,%sp	|,
	move.b %d0,%d0	| tmp54, D.2450
	moveq #0,%d2	| D.2448
	move.b %d0,%d2	| D.2450, D.2448
	move.l 56(%sp),-(%sp)	| x,
	move.l 56(%sp),-(%sp)	| x,
	jsr __fixunsdfsi	|
	addq.l #8,%sp	|,
	move.b %d0,%d0	| tmp55, D.2450
	move.b %d0,%d0	| D.2450, D.2448
	and.l #255,%d0	|, D.2448
	move.l %d3,-(%sp)	| D.2448,
	clr.l -(%sp)	|
	move.l %d2,-(%sp)	| D.2448,
	move.l %d0,-(%sp)	| D.2448,
	jsr show_char	|
	lea (16,%sp),%sp	|,
	move.l 24(%sp),-(%sp)	| xIncre,
	move.l 24(%sp),-(%sp)	| xIncre,
	move.l 64(%sp),-(%sp)	| x,
	move.l 64(%sp),-(%sp)	| x,
	jsr __adddf3	|
	lea (16,%sp),%sp	|,
	move.l %d0,52(%sp)	| tmp56, x
	move.l %d1,56(%sp)	|, x
	move.l 16(%sp),-(%sp)	| yIncre,
	move.l 16(%sp),-(%sp)	| yIncre,
	move.l 56(%sp),-(%sp)	| y,
	move.l 56(%sp),-(%sp)	| y,
	jsr __adddf3	|
	lea (16,%sp),%sp	|,
	move.l %d0,44(%sp)	| tmp57, y
	move.l %d1,48(%sp)	|, y
	addq.l #1,60(%sp)	|, k
.L16:
	move.l 60(%sp),-(%sp)	| k,
	jsr __floatsidf	|
	addq.l #4,%sp	|,
	move.l 40(%sp),-(%sp)	| espl,
	move.l 40(%sp),-(%sp)	| espl,
	move.l %d1,-(%sp)	|,
	move.l %d0,-(%sp)	|,
	jsr __ltdf2	|
	lea (16,%sp),%sp	|,
	tst.l %d0	| tmp58
	jlt .L17	|
	move.l (%sp)+,%d2	|,
	move.l (%sp)+,%d3	|,
	lea (56,%sp),%sp	|,
	rts
	.size	show_line, .-show_line
	.align	2
	.globl	show_rectangle
	.type	show_rectangle, @function
show_rectangle:
	subq.l #4,%sp	|,
	move.w #45,2(%sp)	|, c1
	moveq #0,%d1	| D.2456
	move.w 2(%sp),%d1	| c1, D.2456
	move.l 8(%sp),%d0	| x0, D.2456
	add.l 16(%sp),%d0	| w, D.2456
	move.l %d1,-(%sp)	| D.2456,
	move.l 16(%sp),-(%sp)	| y0,
	move.l %d0,-(%sp)	| D.2456,
	move.l 24(%sp),-(%sp)	| y0,
	move.l 24(%sp),-(%sp)	| x0,
	jsr show_line	|
	lea (20,%sp),%sp	|,
	moveq #0,%d0	|
	move.w 2(%sp),%d0	| c1,
	move.l %d0,%a1	|, D.2456
	move.l 12(%sp),%a0	| y0, D.2456
	add.l 20(%sp),%a0	| h, D.2456
	move.l 8(%sp),%d1	| x0, D.2456
	add.l 16(%sp),%d1	| w, D.2456
	move.l 12(%sp),%d0	| y0, D.2456
	add.l 20(%sp),%d0	| h, D.2456
	move.l %a1,-(%sp)	| D.2456,
	move.l %a0,-(%sp)	| D.2456,
	move.l %d1,-(%sp)	| D.2456,
	move.l %d0,-(%sp)	| D.2456,
	move.l 24(%sp),-(%sp)	| x0,
	jsr show_line	|
	lea (20,%sp),%sp	|,
	addq.l #4,%sp	|,
	rts
	.size	show_rectangle, .-show_rectangle
	.ident	"GCC: (GNU) 4.8.0"
