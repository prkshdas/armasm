@		program to read 209867295 and write it using stdout
@		input number
.equ		basenum,	209867295

@ power macro
.macro		power		base, exp
	mov	r0, \base		@ load base number
	mov	r1, \exp		@ load exponent

	cmp	r1, #0
	moveq	r2, #1
	beq	2f
	mov	r2, r0
	sub 	r1, #1
1:
	cmp 	r1, #0
	ble	2f
	mul	r2, r0, r2
	sub	r1, #1
	b	1b
2:
	mov	r0, r2
.endm

.global _start

_start:
	ldr	r4, =outstr		@ load address
	ldr	r5, =basenum		@ load base number
	mov	r7, #9
	mov	r8, #0
findstart:
	power	#10, r7
	mov	r6, r0
	cmp 	r6, r5
	ble	finddigit
	sub	r7, #1
	b 	findstart
finddigit:
	cmp	r5, r6
	blt	write
	add	r8, r8, #1	
	sub	r5, r5, r6
	b	finddigit
write:
	add 	r8, #'0'
	strb	r8, [r4], #1
	
	@ decrement
	sub 	r7, #1
	cmp	r7, #0
	blt	exit
	power	#10, r7
	mov	r6, r0
	mov	r8, #0
	b	finddigit
exit:
	mov	r8, #'\n'
	strb	r8, [r4]

	@ setup write
	mov 	r7, #4
	mov	r0, #1
	ldr	r1, =outstr
	mov	r2, #11
	svc	0

	@ exit
	mov	r7, #1
	mov 	r0, #0
	svc	0

.data
outstr:		.fill	11
