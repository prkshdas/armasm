@@@
@ outputs a null terminated string
@	r0 : output string address
@	r1 : search address
@	r2 : temp byte
@	r3 : str length
@
@
@	labels:
@		1: beginning of search loop
@		2: exit of loop
@@@

.macro			nullwrite		outstr
	@ find length
	ldr		r0, =\outstr		@ load outstr address
	mov 		r1, r0			@ copy value to r1
1:	
	ldrb		r2, [r1]		@ load char to check
	cmp		r2, #0			@ compare with zero
	beq		2f			@ go forward
	add		r1, #1			@ move to next letter
	b		1b			@ go backward
2:
	sub		r3, r1, r0		@ calc length of the string
	
	@ setup write
	mov		r7, #4			@ 4 = write (setup write)
	mov		r0, #1			@ 1 = stdout
	ldr		r1, =\outstr		@ load outstr address
	mov		r2, r3			@ r3 = length

	svc 		0
.endm
