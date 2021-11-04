	.globl test
test:
	ldur x10, [x0, #0]

	ldr x11, =0xffffffffffffffff
	eor x10, x10, x11

	fim:
		stur x10, [x0, #0] // storing variables back
		br	x30 // return to main()

