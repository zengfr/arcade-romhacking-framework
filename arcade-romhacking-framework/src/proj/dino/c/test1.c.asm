	.file	"test1.c"
| GNU C (GCC) version 4.8.0 (m68k-elf)
|	compiled by GNU C version 4.7.2, GMP version 4.2.4, MPFR version 2.4.1, MPC version 0.8
| GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
| options passed:  -imultilib m68000
| -iprefix d:\sysgcc\m68k-elf\bin\../lib/gcc/m68k-elf/4.8.0/
| C:/Users/zengfr/Desktop/c/test/make/../src/proj/dino/c/test1.c
| -mcpu=68000
| -auxbase-strip C:/Users/zengfr/Desktop/c/test/make/../src/proj/dino/c/test1.c.asm
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
	.globl	show_menu
	.type	show_menu, @function
show_menu:
	subq.l #8,%sp	|,
	move.l %d2,-(%sp)	|,
	move.l 16(%sp),%a0	| x, tmp34
	move.l 20(%sp),%d1	| y, tmp35
	move.l 24(%sp),%d0	| palette, tmp36
	move.w %a0,%d2	|,
	move.b %d2,10(%sp)	|, x
	move.b %d1,8(%sp)	| tmp35, y
	move.b %d0,6(%sp)	| tmp36, palette
	moveq #0,%d0	|
	move.b 6(%sp),%d0	| palette,
	move.l %d0,%a0	|, D.1310
	moveq #0,%d1	| D.1310
	move.b 8(%sp),%d1	| y, D.1310
	moveq #0,%d0	| D.1310
	move.b 10(%sp),%d0	| x, D.1310
	move.l 28(%sp),-(%sp)	| s,
	move.l %a0,-(%sp)	| D.1310,
	move.l %d1,-(%sp)	| D.1310,
	move.l %d0,-(%sp)	| D.1310,
	jsr show_string	|
	lea (16,%sp),%sp	|,
	move.l (%sp)+,%d2	|,
	addq.l #8,%sp	|,
	rts
	.size	show_menu, .-show_menu
	.align	2
	.globl	action
	.type	action, @function
action:
	rts
	.size	action, .-action
	.section	.rodata
.LC0:
	.string	"MENU-stage"
.LC1:
	.string	"MENU-live"
.LC2:
	.string	"MENU-hit"
.LC3:
	.string	"MENU-color"
.LC4:
	.string	"MENU-enemy"
.LC5:
	.string	"MENU-boss"
.LC6:
	.string	"EXIT"
	.text
	.align	2
	.globl	showMenu
	.type	showMenu, @function
showMenu:
	subq.l #8,%sp	|,
	move.l #action,4(%sp)	|, p
	move.l 4(%sp),(%sp)	| p, act
	move.l (%sp),-(%sp)	| act,
	pea .LC0	|
	clr.l -(%sp)	|
	pea 10.w	|
	pea 8.w	|
	jsr show_menu	|
	lea (20,%sp),%sp	|,
	move.l (%sp),-(%sp)	| act,
	pea .LC1	|
	clr.l -(%sp)	|
	pea 11.w	|
	pea 8.w	|
	jsr show_menu	|
	lea (20,%sp),%sp	|,
	move.l (%sp),-(%sp)	| act,
	pea .LC2	|
	clr.l -(%sp)	|
	pea 12.w	|
	pea 8.w	|
	jsr show_menu	|
	lea (20,%sp),%sp	|,
	move.l (%sp),-(%sp)	| act,
	pea .LC3	|
	clr.l -(%sp)	|
	pea 13.w	|
	pea 8.w	|
	jsr show_menu	|
	lea (20,%sp),%sp	|,
	move.l (%sp),-(%sp)	| act,
	pea .LC4	|
	clr.l -(%sp)	|
	pea 14.w	|
	pea 8.w	|
	jsr show_menu	|
	lea (20,%sp),%sp	|,
	move.l (%sp),-(%sp)	| act,
	pea .LC5	|
	clr.l -(%sp)	|
	pea 15.w	|
	pea 8.w	|
	jsr show_menu	|
	lea (20,%sp),%sp	|,
	move.l (%sp),-(%sp)	| act,
	pea .LC6	|
	clr.l -(%sp)	|
	pea 16.w	|
	pea 8.w	|
	jsr show_menu	|
	lea (20,%sp),%sp	|,
	pea 14.w	|
	pea 14.w	|
	pea 8.w	|
	pea 6.w	|
	jsr show_rectangle	|
	lea (16,%sp),%sp	|,
	addq.l #8,%sp	|,
	rts
	.size	showMenu, .-showMenu
	.align	2
	.globl	main
	.type	main, @function
main:
	jsr showMenu	|
	moveq #0,%d0	| D.1318
	rts
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.0"
