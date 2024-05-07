
	.mode mlong
	.globl	__mulsi3
	.sect	.text
	.globl	mults
	.type	mults,@function
mults:
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
	bsr	__mulsi3
	puly
	puly
	puly
	puly
	puly
	sty	*_.frame
	rts
	.size	mults, .-mults
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
	bsr	mults
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

