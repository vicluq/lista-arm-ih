	.globl test

test:
	and x12, x12, xzr // string index
	and x13, x13, xzr // the result

	loop_string:
		// get byte (char) - x0 is 16bytes
		ldrsb x11, [x0, x12] // the char
		add x12, x12, #1 // inc index
		cbz x11, end

		cmp x11, #97
		b.ne not_A // if x11 != A -> go to next char
		add x13, x13, #1 // if x11 == A -> inc x13
		b loop_string // go back to the start

		not_A:
		cmp x11, #101 // E
		b.ne not_E
		add x13, x13, #1
		b loop_string

		not_E:
		cmp x11, #105 // I
		b.ne not_I
		add x13, x13, #1
		b loop_string

		not_I:
		cmp x11, #111 // O
		b.ne not_O
		add x13, x13, #1
		b loop_string

		not_O:
		cmp x11, #117 // U
		b.ne loop_string
		add x13, x13, #1
		b loop_string

	end:
		add x0, x13, #0
		br	x30 // return to main()

