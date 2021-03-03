	.file	"menu.c"
| GNU C (GCC) version 4.8.0 (m68k-elf)
|	compiled by GNU C version 4.7.2, GMP version 4.2.4, MPFR version 2.4.1, MPC version 0.8
| GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
| options passed:  -imultilib m68000
| -iprefix d:\sysgcc\m68k-elf\bin\../lib/gcc/m68k-elf/4.8.0/
| C:/Users/zengfr/Desktop/c/test/make/../src/proj/dino/c/menu.c -mcpu=68000
| -auxbase-strip C:/Users/zengfr/Desktop/c/test/make/../src/proj/dino/c/menu.c.asm
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

	.section	.rodata
.LC0:
	.string	"MENU"
.LC1:
	.string	""
.LC2:
	.string	"---MAIN_MENU---"
.LC3:
	.string	"%s"
.LC4:
	.string	"  %s"
.LC5:
	.string	"* %s"
.LC6:
	.string	"-%s-"
	.text
	.align	2
	.globl	showMainMenu
	.type	showMainMenu, @function
showMainMenu:
	lea (-188,%sp),%sp	|,
	moveq #20,%d0	|,
	move.l %d0,176(%sp)	|, count
	move.l 176(%sp),2(%sp)	| count, status.pos_max
	clr.l 184(%sp)	| i
	jra .L2	|
.L3:
	move.l 184(%sp),%d0	| i, i.0
	move.l %d0,%d1	| i.0, D.2398
	add.l #.LC0,%d1	|, D.2398
	move.l 184(%sp),%d0	| i, tmp51
	lsl.l #3,%d0	|, tmp52
	lea (188,%sp),%a0	|,,
	add.l %a0,%d0	|, tmp53
	add.l #-172,%d0	|, tmp54
	move.l %d0,%a0	| tmp54,
	move.l %d1,(%a0)	| D.2398, menuItems[i_1].Text
	move.l 184(%sp),%d0	| i, tmp55
	lsl.l #3,%d0	|, tmp56
	moveq #67,%d1	|,
	not.b %d1	|
	add.l %sp,%d1	|,
	add.l %d1,%d0	|, tmp57
	add.l #-168,%d0	|, tmp58
	move.l %d0,%a0	| tmp58,
	move.l #1708662,(%a0)	|, menuItems[i_1].Action
	addq.l #1,184(%sp)	|, i
.L2:
	move.l 184(%sp),%d0	| i,
	cmp.l 176(%sp),%d0	| count,
	jlt .L3	|
.L12:
	pea .LC1	|
	pea .LC2	|
	clr.l -(%sp)	|
	clr.l -(%sp)	|
	jsr printText	|
	lea (16,%sp),%sp	|,
	clr.l 180(%sp)	| i
	jra .L4	|
.L5:
	move.l 180(%sp),%d0	| i, tmp59
	lsl.l #3,%d0	|, tmp60
	moveq #67,%d1	|,
	not.b %d1	|
	add.l %sp,%d1	|,
	add.l %d1,%d0	|, tmp61
	add.l #-172,%d0	|, tmp62
	move.l %d0,%a0	| tmp62,
	move.l (%a0),%d0	| menuItems[i_2].Text, D.2398
	move.l %d0,-(%sp)	| D.2398,
	pea .LC3	|
	clr.l -(%sp)	|
	move.l 192(%sp),-(%sp)	| i,
	jsr printText	|
	lea (16,%sp),%sp	|,
	addq.l #1,180(%sp)	|, i
.L4:
	moveq #16,%d0	|,
	cmp.l 180(%sp),%d0	| i,
	jge .L5	|
	jra .L6	|
.L9:
	pea 2.w	|
	jsr chkKeyPress	|
	addq.l #4,%sp	|,
	tst.w %d0	| D.2399
	jeq .L7	|
	clr.l -(%sp)	|
	jsr playSound	|
	addq.l #4,%sp	|,
	move.l 6(%sp),%d0	| status.pos, D.2400
	move.l %d0,10(%sp)	| D.2400, status.pos_old
	move.l 6(%sp),%d0	| status.pos, D.2400
	subq.l #1,%d0	|, D.2400
	move.l %d0,6(%sp)	| D.2400, status.pos
	move.w #1,14(%sp)	|, status.isChange
	move.l 6(%sp),%d0	| status.pos, D.2400
	tst.l %d0	| D.2400
	jge .L7	|
	moveq #16,%d1	|,
	move.l %d1,6(%sp)	|, status.pos
.L7:
	pea 3.w	|
	jsr chkKeyPress	|
	addq.l #4,%sp	|,
	tst.w %d0	| D.2399
	jeq .L8	|
	clr.l -(%sp)	|
	jsr playSound	|
	addq.l #4,%sp	|,
	move.l 6(%sp),%d0	| status.pos, D.2400
	move.l %d0,10(%sp)	| D.2400, status.pos_old
	move.l 6(%sp),%d0	| status.pos, D.2400
	addq.l #1,%d0	|, D.2400
	move.l %d0,6(%sp)	| D.2400, status.pos
	move.w #1,14(%sp)	|, status.isChange
	move.l 6(%sp),%d0	| status.pos, D.2400
	moveq #16,%d1	|,
	cmp.l %d0,%d1	| D.2400,
	jge .L8	|
	clr.l 6(%sp)	| status.pos
.L8:
	move.w 14(%sp),%d0	| status.isChange, D.2399
	tst.w %d0	| D.2399
	jeq .L6	|
	move.l 10(%sp),%d0	| status.pos_old, D.2400
	move.l %d0,-(%sp)	| D.2400,
	moveq #20,%d0	|, tmp63
	add.l %sp,%d0	|, tmp63
	move.l %d0,-(%sp)	| tmp63,
	pea .LC4	|
	subq.l #2,%sp	|,
	moveq #30,%d0	|, tmp64
	add.l %sp,%d0	|, tmp64
	subq.l #4,%d0	|, tmp64
	move.l %d0,%a0	| tmp64,
	move.l (%a0),-(%sp)	| status,
	subq.l #4,%d0	|, tmp64
	move.l %d0,%a0	| tmp64,
	move.l (%a0),-(%sp)	| status,
	subq.l #4,%d0	|, tmp64
	move.l %d0,%a0	| tmp64,
	move.l (%a0),-(%sp)	| status,
	subq.l #2,%d0	|, tmp64
	move.l %d0,%a0	| tmp64,
	move.w (%a0),-(%sp)	| status,
	jsr printMenuItem	|
	lea (28,%sp),%sp	|,
	move.l 6(%sp),%d0	| status.pos, D.2400
	move.l %d0,-(%sp)	| D.2400,
	moveq #20,%d0	|, tmp65
	add.l %sp,%d0	|, tmp65
	move.l %d0,-(%sp)	| tmp65,
	pea .LC5	|
	subq.l #2,%sp	|,
	moveq #30,%d0	|, tmp66
	add.l %sp,%d0	|, tmp66
	subq.l #4,%d0	|, tmp66
	move.l %d0,%a0	| tmp66,
	move.l (%a0),-(%sp)	| status,
	subq.l #4,%d0	|, tmp66
	move.l %d0,%a0	| tmp66,
	move.l (%a0),-(%sp)	| status,
	subq.l #4,%d0	|, tmp66
	move.l %d0,%a0	| tmp66,
	move.l (%a0),-(%sp)	| status,
	subq.l #2,%d0	|, tmp66
	move.l %d0,%a0	| tmp66,
	move.w (%a0),-(%sp)	| status,
	jsr printMenuItem	|
	lea (28,%sp),%sp	|,
	clr.w 14(%sp)	| status.isChange
.L6:
	pea 1.w	|
	jsr chkKeyPress	|
	addq.l #4,%sp	|,
	tst.w %d0	| D.2399
	jeq .L9	|
	move.l 6(%sp),%d0	| status.pos, D.2400
	tst.l %d0	| D.2400
	jgt .L10	|
	jra .L14	|
.L10:
	move.l 6(%sp),%d0	| status.pos, D.2400
	move.l %d0,-(%sp)	| D.2400,
	moveq #20,%d0	|, tmp67
	add.l %sp,%d0	|, tmp67
	move.l %d0,-(%sp)	| tmp67,
	pea .LC6	|
	subq.l #2,%sp	|,
	moveq #30,%d0	|, tmp68
	add.l %sp,%d0	|, tmp68
	subq.l #4,%d0	|, tmp68
	move.l %d0,%a0	| tmp68,
	move.l (%a0),-(%sp)	| status,
	subq.l #4,%d0	|, tmp68
	move.l %d0,%a0	| tmp68,
	move.l (%a0),-(%sp)	| status,
	subq.l #4,%d0	|, tmp68
	move.l %d0,%a0	| tmp68,
	move.l (%a0),-(%sp)	| status,
	subq.l #2,%d0	|, tmp68
	move.l %d0,%a0	| tmp68,
	move.w (%a0),-(%sp)	| status,
	jsr printMenuItem	|
	lea (28,%sp),%sp	|,
	move.l 6(%sp),%d0	| status.pos, D.2400
	lsl.l #3,%d0	|, tmp69
	moveq #67,%d1	|,
	not.b %d1	|
	add.l %sp,%d1	|,
	add.l %d1,%d0	|, tmp70
	add.l #-172,%d0	|, tmp71
	move.l %d0,%a0	| tmp71,
	move.l 4(%a0),-(%sp)	| menuItems,
	move.l (%a0),-(%sp)	| menuItems,
	jsr callMenuItemAction	|
	addq.l #8,%sp	|,
	jra .L12	|
.L14:
	nop
	lea (188,%sp),%sp	|,
	rts
	.size	showMainMenu, .-showMainMenu
	.align	2
	.globl	callMenuItemAction
	.type	callMenuItemAction, @function
callMenuItemAction:
	move.l 8(%sp),%d0	| item.Action, D.2408
	move.l %d0,%a0	| D.2409,
	jsr (%a0)	|
	rts
	.size	callMenuItemAction, .-callMenuItemAction
	.align	2
	.globl	printText
	.type	printText, @function
printText:
	nop
	rts
	.size	printText, .-printText
	.align	2
	.globl	printMenuItem
	.type	printMenuItem, @function
printMenuItem:
	nop
	rts
	.size	printMenuItem, .-printMenuItem
	.align	2
	.globl	chkKeyPress
	.type	chkKeyPress, @function
chkKeyPress:
	subq.l #4,%sp	|,
	move.l 8(%sp),%d0	| key, tmp33
	move.w %d0,2(%sp)	| tmp33, key
	clr.w %d0	| D.2410
	addq.l #4,%sp	|,
	rts
	.size	chkKeyPress, .-chkKeyPress
	.align	2
	.globl	playSound
	.type	playSound, @function
playSound:
	subq.l #4,%sp	|,
	move.l 8(%sp),%d0	| index, tmp31
	move.w %d0,2(%sp)	| tmp31, index
	nop
	addq.l #4,%sp	|,
	rts
	.size	playSound, .-playSound
	.ident	"GCC: (GNU) 4.8.0"
