@ Find factorial of a number and wrtie with stdout
@
@	Registers:
@		r0:	total
@		r1:	current number
@		r12:	frame base pointer
@
@ Factorial beginning number
.equ		maxnum,			9


.global _start


_start:
	mov	r0, #maxnum		@ load base number from constant
	mov	r12, sp			@ set stack base to the stack pointer
	push	{r0}			@ add param to stack
	bl	factorial

	@ setup interger to ascii
	mov	r0, r0
	ldr	r1, =outstr		@ load outstr address
	bl	itoa
	
	@ write number
	mov	r7, #4
	mov	r0, #1
	mov	r1, r1
	mov	r2, #11
	svc	0

	@exit
	mov	r7, #1
	mov	r0, #0
	svc	0


@ factorial function
factorial:
	@ close out caller frame
	push	{lr}			@ save address to return to
	push	{r12}			@ save address to old base point
	@ move base point sp and start new frame
	mov	r12, sp			@ set base stack pointer
	ldr	r0, [r12, #8]		@ load param 0 into r0
	
	@ if x == 1 then 1
	cmp	r0, #1			@ see if we have 1
	beq	fexit			@ exit factorial with 1 in r0

	@ else x * factorial(x-1)
	push 	{r0}
	sub	r0, #1			
	push 	{r0}
	bl	factorial
	ldr	r1, [r12, #-4]
	mul 	r0, r1, r0
	b	fexit
fexit:
	mov 	sp, r12			@ move sp to frame base
	pop 	{r12}			@ restore old base point
	pop	{lr}			@ restore caller address
	bx	lr			@ return to caller fn	


.data
outstr:		.fill			11
