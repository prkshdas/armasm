@ sum of squares
@


.global _start

_start:
	ldr	r4, =inarr		@ load input numbers
	mov 	r6, #0			@ init r6
loop:
	ldrb	r5, [r4], #1		@ load first integer and increment
	cmp	r5, #0			@ compare with 0
	
	@ if yes
	beq	exit			@ break loop
	mla	r6, r5, r5, r6		@ r6 = (r5 * r5) + r6
	b	loop
exit:
	@ setup integer to ascii
	mov	r0, r6
	ldr	r1, =outstr
	bl	itoa

	@ set up write
	mov 	r7, #4
	mov	r0, #1
	ldr 	r1, =outstr
	mov	r2, #11
	svc	0

	@ setup exit
	mov	r7, #1
	mov	r0, #0
	svc	0

.data
inarr:      	.byte   		65,71,71,71,67,72,66,51,58,50
            	.byte   		60,60,55,64,52,69,52,67,55,69,0
outstr:     	.fill   		11
