	.globl test
test:
	ldur x12, [x0, #0]

	for:
		cmp x12, #0
		ble fim // se for >=0 vai pra fim
		sub x12, x12, #1 // x12 = x12 - 1
		b for // volta ao início do loop

	fim:
		stur x12, [x0, #0] // storing variables back
		br	x30 // return to main()

