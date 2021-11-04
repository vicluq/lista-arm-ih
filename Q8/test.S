	.globl test

test:
	and x10, x10, xzr // store quocient -> quoc * 10
	and x11, x11, xzr // store each num
	and x12, x12, xzr // store fact result
	and x13, x13, xzr // store final result
	mov x14, #10

	loop:
		// getting unity
		udiv x10, x0, x14 // 111 / 10 = 11
		mul x10, x10, x14 // 11 * 10 = 110
		sub x11, x0, x10  // x11 = 111 - 110 = 1
		add x12, x12, #1 // x12 = 1

		udiv x0, x0, x14
		cbz x11, end // if there is no factorial do calculate
		b factorial  // if there is a factorial to calculate

	factorial:
		mul x12, x12, x11 // x12 *= x11
		sub x11, x11, #1  // x11 = x11 - 1
		cbz x11, make_sum
		b factorial

	make_sum:
		add x13, x13, x12
		and x12, x12, xzr // zeroing x12
		b loop

	end:
		add x0, x13, #0 // storing return value to return content register
		br	x30 // return to main()

