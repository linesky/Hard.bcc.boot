
	.mode mlong
	.globl	__divsi3
	.section	.rodata
.LC0:
	.string	"0123456789ABCDEF0123456789ABCDEF"
	.sect	.text
	.globl	strshex
	.type	strshex,@function
strshex:
	ldx	*_.frame
	pshx
	tsx
	xgdx
	addd	#-24
	xgdx
	txs
	sts	*_.frame
	ldx	*_.d1
	pshx
	ldx	*_.d2
	pshx
	ldx	*_.frame
	std	1,x
	ldy	*_.frame
	ldd	31,y
	std	5,y
	ldd	29,y
	std	3,y
	ldy	*_.frame
	ldd	#8
	std	9,y
	clra
	clrb
	std	7,y
	ldx	*_.frame
	clr	14,x
	clr	13,x
	clr	12,x
	clr	11,x
	ldy	*_.frame
	ldd	#16
	std	17,y
	clra
	clrb
	std	15,y
	ldy	*_.frame
	ldd	#15
	std	21,y
	clra
	clrb
	std	19,y
	ldd	#.LC0
	ldx	*_.frame
	std	23,x
	ldy	*_.frame
	ldy	9,y
	sty	*_.d2
	clr	*_.d1+1
	clr	*_.d1
	ldx	*_.frame
	ldd	1,x
	ldx	*_.d2
	std	*_.tmp
	xgdx
	addd	*_.tmp
	xgdx
	clrb
	stab	0,x
	ldy	*_.frame
	ldd	#7
	std	9,y
	clra
	clrb
	std	7,y
.L2:
	ldx	*_.frame
	ldx	7,x
	cpx	#-1
	bgt	.L5
	ldy	*_.frame
	ldd	7,y
	cpd	#-1
	blt	.L1
	ldx	*_.frame
	ldx	9,x
	cpx	#-1
	bhi	.L5
	bra	.L1
.L5:
	ldy	*_.frame
	ldd	5,y
	std	*_.d2
	ldd	3,y
	std	*_.d1
	ldd	*_.d2
	ldx	*_.d1
	ldy	*_.frame
	anda	21,y
	andb	22,y
	xgdx
	anda	19,y
	andb	20,y
	xgdx
	std	*_.d2
	stx	*_.d1
	ldy	*_.frame
	ldd	*_.d2
	std	13,y
	ldd	*_.d1
	std	11,y
	ldx	*_.frame
	ldx	9,x
	stx	*_.d2
	clr	*_.d1+1
	clr	*_.d1
	ldy	*_.frame
	ldd	1,y
	ldx	*_.d2
	std	*_.tmp
	xgdx
	addd	*_.tmp
	xgdx
	ldy	*_.frame
	ldy	13,y
	sty	*_.d2
	clr	*_.d1+1
	clr	*_.d1
	ldy	*_.frame
	ldd	23,y
	addd	*_.d2
	std	*_.tmp
	ldy	*_.tmp
	ldab	0,y
	stab	0,x
	ldy	*_.frame
	ldd	17,y
	pshb
	psha
	ldd	15,y
	pshb
	psha
	ldy	*_.frame
	ldd	5,y
	ldx	3,y
	bsr	__divsi3
	puly
	puly
	ldy	*_.frame
	std	5,y
	stx	3,y
	ldy	*_.frame
	ldd	9,y
	ldx	7,y
	subd	#1
	bcc	.L7
	dex
.L7:
	ldy	*_.frame
	std	9,y
	stx	7,y
	bra	.L2
.L1:
	pulx
	stx	*_.d2
	pulx
	stx	*_.d1
	tsx
	xgdx
	addd	#24
	xgdx
	txs
	pulx
	stx	*_.frame
	rts
	.size	strshex, .-strshex
	.globl	main
	.type	main,@function
main:
	ldx	*_.frame
	pshx
	tsx
	xgdx
	addd	#-54
	xgdx
	txs
	sts	*_.frame
	ldx	*_.frame
	clr	4,x
	clr	3,x
	clr	2,x
	clr	1,x
	ldd	*_.frame
	addd	#5
	ldy	#22136
	pshy
	ldy	#4660
	pshy
	bsr	strshex
	puly
	puly
	clra
	clrb
	ldx	#0
	tsy
	xgdy
	addd	#54
	xgdy
	tys
	puly
	sty	*_.frame
	rts
	.size	main, .-main

