
	.mode mlong
	.sect	.text
	.globl	subs
	.type	subs,@function
subs:
	ldy	*_.frame
	pshy
	pshx
	pshx
	sts	*_.frame
	ldy	*_.d1
	pshy
	ldy	*_.d2
	pshy
	ldy	*_.frame
	std	3,y
	stx	1,y
	ldy	*_.frame
	ldd	3,y
	std	*_.d2
	ldd	1,y
	std	*_.d1
	ldd	*_.d2
	ldx	*_.d1
	ldy	*_.frame
	subd	11,y
	xgdx
	sbcb	10,y
	sbca	9,y
	xgdx
	puly
	sty	*_.d2
	puly
	sty	*_.d1
	puly
	puly
	puly
	sty	*_.frame
	rts
	.size	subs, .-subs
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
	bsr	subs
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

