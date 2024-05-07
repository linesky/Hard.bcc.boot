
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
	.section	.rodata
.LC0:
	.string	"hello world\n"
	.sect	.text
	.globl	main
	.type	main,@function
main:
	ldx	*_.frame
	pshx
	pshx
	pshx
	pshx
	sts	*_.frame
	ldd	#.LC0
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
	ldy	*_.frame
	std	5,y
	stx	3,y
	clra
	clrb
	ldx	#0
	puly
	puly
	puly
	puly
	sty	*_.frame
	rts
	.size	main, .-main
