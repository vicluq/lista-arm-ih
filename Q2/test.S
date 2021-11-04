	.globl test
test:
	ldur x9, [x0, #0] // a
	ldur x10, [x1, #0] // b
	ldur x11, [x2, #0] // c
	ldur x12, [x3, #0] // x

	eor x12, x12, x12 // x = 0

	cmp x9, #0
	blt false // a < 0

	cmp x10, #32
	bgt false // b > 32

	cmp x11, #25
	ble false // c <= 25

	b fim

	false:
		add x12, x12, #1

	fim:
		stur x9, [x0, #0] // storing variables back
		stur x10, [x1, #0]
		stur x11, [x2, #0]
		stur x12, [x3, #0]
		br	x30 // return to main()
