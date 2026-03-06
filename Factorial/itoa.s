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

.global itoa

itoa: 
    	push    {r4-r9}         
    	mov     r4, r1         
    	mov     r9, r1         
    	mov     r5, r0          
                            
                            
   	 mov     r7, #9        
   	 mov     r8, #0 
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

   	mov     r1, r9         
    	pop     {r4-r9}         
    	bx      lr             

.data
outstr:		.fill	11
