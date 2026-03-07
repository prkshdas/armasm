.global _start


_start:
	add 		sp, #8			@ move sp to our arguments
	mov		r4, #0			@ init total
loop:
	@ setup ascii to integer
	pop		{r0}			@ pop address onto r0
	cmp		r0, #0			@ check null
	beq		exit
	bl		atoi			@ call atoi
	add 		r4, r4, r0
	b		loop
exit:
	@ setup itoa
	mov 		r0, r4
	ldr		r1, =output
	bl		itoa
	
	@ setup write
	mov 		r7, #4
	mov		r0, #1
	ldr		r1, =output
	mov		r2, #11
	svc		0
	
	@ setup exit
	mov 		r7, #1
	mov 		r0, #0
	svc		0

.data
output:			.fill			11
