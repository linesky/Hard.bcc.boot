
	.mode mlong
	; extern	strlen
	.sect	.text
	.globl	cfill
	.type	cfill,@function
cfill:
	ldx	*_.frame
	pshx
	tsx
	xgdx
	addd	#-22
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
	bsr	strlen
	lsrd
	ldy	*_.frame
	std	9,y
	clr	8,y
	clr	7,y
	ldy	*_.frame
	ldd	31,y
	std	*_.d2
	ldd	29,y
	std	*_.d1
	ldy	*_.frame
	ldd	*_.d2
	std	17,y
	ldd	*_.d1
	std	15,y
	ldx	*_.frame
	ldx	15,x
	cpx	#0
	bgt	.L2
	ldy	*_.frame
	ldd	15,y
	cpd	#0
	blt	.L3
	ldx	*_.frame
	ldx	17,x
	cpx	#0
	bhs	.L2
.L3:
	ldy	*_.frame
	ldd	17,y
	addd	#1
	std	17,y
	bcc	.L9
	inc	16,y
	bne	.L9
	inc	15,y
.L9:
.L2:
	ldy	*_.frame
	ldd	17,y
	ldx	15,y
	ldy	#1
	bsr	___ashrsi3
	ldy	*_.frame
	std	13,y
	stx	11,y
	ldx	*_.frame
	clr	6,x
	clr	5,x
	clr	4,x
	clr	3,x
.L4:
	ldy	*_.frame
	ldd	5,y
	std	21,y
	ldd	3,y
	std	19,y
	ldy	*_.frame
	ldd	19,y
	cpd	29,y
	blt	.L7
	ldy	*_.frame
	ldd	19,y
	cpd	29,y
	bgt	.L1
	ldy	*_.frame
	ldd	21,y
	cpd	31,y
	blo	.L7
	bra	.L1
.L7:
	ldx	*_.frame
	ldd	9,x
	ldy	*_.frame
	subd	13,y
	ldx	*_.frame
	addd	5,x
	std	*_.d2
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
	ldab	28,y
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
	bra	.L4
.L1:
	pulx
	stx	*_.d2
	pulx
	stx	*_.d1
	tsx
	xgdx
	addd	#22
	xgdx
	txs
	pulx
	stx	*_.frame
	rts
	.size	cfill, .-cfill
	; extern	memcpy
	; extern	memset
	.section	.rodata
.LC0:
	.string	"hello world\n"
	.zero	67
	.sect	.text
	.globl	main
	.type	main,@function
main:
	ldx	*_.frame
	pshx
	tsx
	xgdx
	addd	#-80
	xgdx
	txs
	sts	*_.frame
	ldd	#1
	addd	*_.frame
	ldy	#.LC0
	ldx	#13
	pshx
	pshy
	bsr	memcpy
	puly
	puly
	ldd	*_.frame
	addd	#14
	ldx	#67
	pshx
	ldx	#0
	pshx
	ldx	#0
	pshx
	bsr	memset
	puly
	puly
	puly
	ldx	#3
	pshx
	ldx	#0
	pshx
	ldab	#46
	pshb
	des
	ldd	#1
	addd	*_.frame
	bsr	cfill
	puly
	puly
	puly
	clra
	clrb
	ldx	#0
	tsy
	xgdy
	addd	#80
	xgdy
	tys
	puly
	sty	*_.frame
	rts
	.size	main, .-main
