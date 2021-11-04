	.globl test
test:
	ldur x12, [x0, #0] // 0xffff0000ffff0000 -> 1111111111111111000000000000000011111111111111110000000000000000
	ldur x13, [x1, #0] // 0x0000ffff0000ffff

	ldr x14, =0x0000000000fff000 // x14 = 111111111111000000000000 23 to 12 as 1
	and x15, x12, x14 // x15 = x12 & x14 -> extract 23 to 12 and set the rest to zero


	ldr x16, =0xffffffffffffffff
	eor x14, x14, x16 // x16 xor x14 -> invert bits 23 to 12 from x14 and clear x13 23 to 12 bits
	and x13, x13, x14 // clear 23 to 12 using and with 0's
	orr x13, x13, x15 // replacing x13's bits

	fim:
		stur x12, [x0, #0] // storing variables back
		stur x13, [x1, #0]
		br	x30 // return to main()

