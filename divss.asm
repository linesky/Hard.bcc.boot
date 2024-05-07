;;;-----------------------------------------
;;; Start MC68HC11 gcc assembly output
;;; gcc compiler 3.3.6-m68hc1x-20060122
;;; Command:	/usr/lib/gcc-lib/m68hc11/3.3.6-m68hc1x-20060122/cc1 -quiet -D__GNUC__=3 -D__GNUC_MINOR__=3 -D__GNUC_PATCHLEVEL__=6 -Dmc68hc1x -D__mc68hc1x__ -D__mc68hc1x -D__INT__=32 -Dmc6811 -DMC6811 -Dmc68hc11 divs.c -quiet -dumpbase divs.c -auxbase-strip divss -o divss.asm
;;; Compiled:	Tue May  7 18:11:05 2024
;;; (META)compiled by GNU C version 4.6.3.
;;;-----------------------------------------
	.file	"divs.c"
	.mode mlong
	.globl	__divsi3
	.sect	.text
	.globl	divs
	.type	divs,@function
divs:
	ldy	*_.frame
	pshy
	pshx
	pshx
	sts	*_.frame
	ldy	*_.frame
	std	3,y
	stx	1,y
	ldy	*_.frame
	ldd	11,y
	pshb
	psha
	ldd	9,y
	pshb
	psha
	ldy	*_.frame
	ldd	3,y
	ldx	1,y
	bsr	__divsi3
	puly
	puly
	puly
	puly
	puly
	sty	*_.frame
	rts
	.size	divs, .-divs
	.section	.rodata
.LC0:
	.string	"\033[43;37m%d....\n"
	.sect	.text
	.globl	main
	.type	main,@function
main:
	ldx	*_.frame
	pshx
	tsx
	xgdx
	addd	#-14
	xgdx
	txs
	sts	*_.frame
	ldy	*_.frame
	ldd	#10
	std	3,y
	clra
	clrb
	std	1,y
	ldy	*_.frame
	ldd	#5
	std	7,y
	clra
	clrb
	std	5,y
	ldx	*_.frame
	clr	12,x
	clr	11,x
	clr	10,x
	clr	9,x
	ldx	#.LC0
	ldy	*_.frame
	stx	13,y
	ldy	*_.frame
	ldd	7,y
	pshb
	psha
	ldd	5,y
	pshb
	psha
	ldy	*_.frame
	ldd	3,y
	ldx	1,y
	bsr	divs
	puly
	puly
	ldy	*_.frame
	std	11,y
	stx	9,y
	clra
	clrb
	ldx	#0
	tsy
	xgdy
	addd	#14
	xgdy
	tys
	puly
	sty	*_.frame
	rts
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.6-m68hc1x-20060122"
