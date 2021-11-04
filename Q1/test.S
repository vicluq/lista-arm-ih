	.globl test
test:
	ldur x9, [x0, #0] // loading to temp regs
	ldur x10, [x1, #0]
	ldur x11, [x2, #0]

	sub x12, x10, x11
	cbnz x12, else // check if b - m == 0
	sub x11, x10, x9 // m = b - a
	b fim // leaves in case it is zero

	else:
		sub x11, x9, x10 // m = a - b

	fim:
		stur x9, [x0, #0] // storing variables back
		stur x10, [x1, #0]
		stur x11, [x2, #0]
		br	x30 // return to main()
