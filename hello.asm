
	.mode mlong
	.section	.rodata
.LC0:
	.string	"hello world"
	.sect	.text
	.globl	hello
	.type	hello,@function
hello:
	ldx	*_.frame
	pshx
	sts	*_.frame
	ldd	#.LC0
	pulx
	stx	*_.frame
	rts
	.size	hello, .-hello
	.section	.rodata
.LC1:
	.string	"\033[43;37m%s....\n"
	.sect	.text
	.globl	main
	.type	main,@function
main:
	ldx	*_.frame
	pshx
	pshx
	sts	*_.frame
	ldd	#.LC1
	ldx	*_.frame
	std	1,x
	bsr	hello
	ldx	*_.frame
	std	1,x
	clra
	clrb
	ldx	#0
	puly
	puly
	sty	*_.frame
	rts
	.size	main, .-main

