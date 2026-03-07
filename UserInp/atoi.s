@ ascii to integer converter



.global atoi


atoi:
	push		{r4-r7}			@ save registers we will use
	mov		r4, #0			@ init total
	mov 		r5, #10			@ load 10 for multiplication
	mov		r7, r0			@ copy data to r7
loop:
	ldrb		r6, [r7], #1		@ load and increment
	cmp		r6, #0			@ check null
	beq		exit			@ break if null
	mul		r4, r5, r4		@ mul total by 10
	sub		r6, r6, #'0'		@ sub char 0 to get int value
	add 		r4, r4, r6		@ add to total
	b		loop
exit:
	mov		r0, r4
	pop		{r4-r7}
	bx		lr
