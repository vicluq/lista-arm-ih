		.globl test

test:
	and x12, x12, xzr // string index
	and x13, x13, xzr // the result

	loop_string:
		// get byte (char) - x0 is 16bytes
		ldrsb x11, [x0, x12] // the char -> x11
		add x12, x12, #1 // inc index
		cbz x11, end

		cmp x11, #65 // A
		b.eq inc_points1
		cmp x11, #69 // E
		b.eq inc_points1
		cmp x11, #73 // I
		b.eq inc_points1
		cmp x11, #79 // O
		b.eq inc_points1
		cmp x11, #85 // U
		b.eq inc_points1

		cmp x11, #68 // D
		b.eq inc_points2
		cmp x11, #71 // G
		b.eq inc_points2
		cmp x11, #84 // T
		b.eq inc_points2

		cmp x11, #66 // B
		b.eq inc_points3
		cmp x11, #67 // C
		b.eq inc_points3
		cmp x11, #77 // M
		b.eq inc_points3
		cmp x11, #78 // N
		b.eq inc_points3
		cmp x11, #80 // P
		b.eq inc_points3

		cmp x11, #66 // F
		b.eq inc_points4
		cmp x11, #67 // H
		b.eq inc_points4
		cmp x11, #86 // V
		b.eq inc_points4
		cmp x11, #87 // W
		b.eq inc_points4
		cmp x11, #89 // Y
		b.eq inc_points4

		cmp x11, #75 // K
		b.eq inc_points5
		cmp x11, #82 // R
		b.eq inc_points5
		cmp x11, #83 // S
		b.eq inc_points5

		cmp x11, #74 // J
		b.eq inc_points6
		cmp x11, #76 // L
		b.eq inc_points6
		cmp x11, #88 // X
		b.eq inc_points6

		cmp x11, #81 // Q
		b.eq inc_points7
		cmp x11, #90 // Z
		b.eq inc_points7

		inc_points1:
			add x13, x13, #1
			b loop_string
		inc_points2:
			add x13, x13, #2
			b loop_string
		inc_points3:
			add x13, x13, #3
			b loop_string
		inc_points4:
			add x13, x13, #4
			b loop_string
		inc_points5:
			add x13, x13, #5
			b loop_string
		inc_points6:
			add x13, x13, #8
			b loop_string
		inc_points7:
			add x13, x13, #10
			b loop_string

	end:
		eor x0, x0, x0 // clearing x0 to store return value
		add x0, x13, #0
		br	x30 // return to main()


