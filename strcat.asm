
	.mode mlong
	.sect	.text
	.globl	strslen
	.type	strslen,@function
strslen:
	ldx	*_.frame
	pshx
	pshx
	pshx
	pshx
	pshx
	sts	*_.frame
	ldx	*_.d1
	pshx
	ldx	*_.d2
	pshx
	ldx	*_.frame
	std	1,x
	ldy	*_.frame
	clr	6,y
	clr	5,y
	clr	4,y
	clr	3,y
.L2:
	ldx	*_.frame
	ldx	5,x
	stx	*_.d2
	clr	*_.d1+1
	clr	*_.d1
	ldy	*_.frame
	ldd	1,y
	addd	*_.d2
	ldx	*_.frame
	std	7,x
	ldy	*_.frame
	ldy	7,y
	ldab	0,y
	cmpb	#0
	bne	.L4
	bra	.L3
.L4:
	ldy	*_.frame
	ldd	5,y
	ldx	3,y
	addd	#1
	bcc	.L5
	inx	
.L5:
	ldy	*_.frame
	std	5,y
	stx	3,y
	bra	.L2
.L3:
	ldy	*_.frame
	ldd	5,y
	std	*_.d2
	ldd	3,y
	std	*_.d1
	ldd	*_.d2
	ldx	*_.d1
	puly
	sty	*_.d2
	puly
	sty	*_.d1
	puly
	puly
	puly
	puly
	puly
	sty	*_.frame
	rts
	.size	strslen, .-strslen
	.globl	strcats
	.type	strcats,@function
strcats:
	ldx	*_.frame
	pshx
	tsx
	xgdx
	addd	#-10
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
	clr	6,y
	clr	5,y
	clr	4,y
	clr	3,y
	ldx	*_.frame
	ldd	1,x
	bsr	strslen
	std	*_.d2
	clr	*_.d1+1
	clr	*_.d1
	ldy	*_.frame
	ldd	1,y
	addd	*_.d2
	ldx	*_.frame
	std	7,x
.L7:
	ldy	*_.frame
	ldy	5,y
	sty	*_.d2
	clr	*_.d1+1
	clr	*_.d1
	ldx	*_.frame
	ldd	15,x
	addd	*_.d2
	ldy	*_.frame
	std	9,y
	ldy	*_.frame
	ldy	9,y
	ldab	0,y
	cmpb	#0
	bne	.L9
	bra	.L8
.L9:
	ldx	*_.frame
	ldx	5,x
	stx	*_.d2
	clr	*_.d1+1
	clr	*_.d1
	ldy	*_.frame
	ldd	7,y
	ldx	*_.d2
	std	*_.tmp
	xgdx
	addd	*_.tmp
	xgdx
	ldy	*_.frame
	ldy	5,y
	sty	*_.d2
	clr	*_.d1+1
	clr	*_.d1
	ldy	*_.frame
	ldd	15,y
	addd	*_.d2
	std	*_.tmp
	ldy	*_.tmp
	ldab	0,y
	stab	0,x
	ldy	*_.frame
	ldd	5,y
	ldx	3,y
	addd	#1
	bcc	.L10
	inx	
.L10:
	ldy	*_.frame
	std	5,y
	stx	3,y
	bra	.L7
.L8:
	ldx	*_.frame
	ldx	5,x
	stx	*_.d2
	clr	*_.d1+1
	clr	*_.d1
	ldy	*_.frame
	ldd	7,y
	ldx	*_.d2
	std	*_.tmp
	xgdx
	addd	*_.tmp
	xgdx
	ldy	*_.frame
	ldy	5,y
	sty	*_.d2
	clr	*_.d1+1
	clr	*_.d1
	ldy	*_.frame
	ldd	15,y
	addd	*_.d2
	std	*_.tmp
	ldy	*_.tmp
	ldab	0,y
	stab	0,x
	ldy	*_.frame
	ldd	5,y
	std	*_.d2
	ldd	3,y
	std	*_.d1
	ldd	*_.d2
	ldx	*_.d1
	puly
	sty	*_.d2
	puly
	sty	*_.d1
	tsy
	xgdy
	addd	#10
	xgdy
	tys
	puly
	sty	*_.frame
	rts
	.size	strcats, .-strcats
	.section	.rodata
.LC0:
	.string	"hello "
.LC1:
	.string	"world \n "
	.sect	.text
	.globl	main
	.type	main,@function
main:
	ldx	*_.frame
	pshx
	tsx
	xgdx
	addd	#-50
	xgdx
	txs
	sts	*_.frame
	clrb
	ldx	*_.frame
	stab	1,x
	ldx	#.LC0
	pshx
	ldd	#1
	addd	*_.frame
	bsr	strcats
	ins
	ins
	ldx	#.LC1
	pshx
	ldd	#1
	addd	*_.frame
	bsr	strcats
	ins
	ins
	clra
	clrb
	ldx	#0
	tsy
	xgdy
	addd	#50
	xgdy
	tys
	puly
	sty	*_.frame
	rts
	.size	main, .-main

