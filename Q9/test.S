	.globl test

test:
    // x0 -> the char set
    // x1 -> the word

    eor x19, x19, x19 // making sure x19 is zero
	add x19, xzr, x0 // the char set in memory

    eor x20, x20, x20 // making sure x20 is zero
	add x20, xzr, x1 // the word in memory

    eor x23, x23, x23 // making sure x23 is zero
    add x23, x30, xzr // saving the return address since we are using x30

    eor x10, x10, x10 // making sure x10 is zero
    eor x21, x21, x21 // making sure x21 is zero

    eor x16, x16, x16 // making sure x16 is zero before operating (result)

	ldr x3, =0x7fffffffffffffff
	ldr x21, =0x0000000000000000

    for:
        add x18, x20, x21
        ldrsb x10, [x18, #0] // the char

        cbz x10, end // if its the end of the string
        mov x0, x10
        add x21, x21, #1 // index = index + 1
        bl count_freq

        cmp x3, x0	// min char rep
        b.lt for
        mov x3, x0
        b for
    end:
        mov x0, x3
        ldr x13, =0x7fffffffffffffff
        cmp x3, x13	// found
        b.ne found
        mov x0, xzr

    count_freq:
        mov x10, x19
        mov x16, xzr

        for_count:
            ldrsb x11, [x10, #0]		// set_string[x10]
            cbz x11, return_result		// end of string, finish program
            add x10, x10, #1			// go to another byte

            cmp x0, x11					// if letters are not the same, go back to start of count
            b.ne for_count

            add x16, x16, #1
            b for_count

    found:
        mov x30, x23 // puting return address back
        br x30

    return_result:
        mov x0, x16 // the result being mived to the return reg result
        br x30
