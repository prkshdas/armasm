.global _start

_start:
	@ Begin registers preloaded
	mov	r0, #'L'
	mov	r1, #'I'
	mov	r2, #'N'
	mov	r3, #'U'
	mov 	r4, #'X'
	@ end register preload

	ldr	r5, =outstr	@ load outstr address
	strb	r0, [r5]	@ store L to outstr
	add	r5, #1		@ increment out address
	strb 	r1, [r5]	@ store I to out address
	add 	r5, #1		@ increment out address
	strb	r2, [r5]	@ store N to out address
	add 	r5, #1		@ increment out address
	strb	r3, [r5]	@ store U to out address
	add	r5, #1		@ increment out address
	strb	r4, [r5]	@ store X to out address

	@ setup write
	mov	r7, #4		@ 4 = write
	mov	r0, #1		@ 1 = stdout
	ldr	r1, =outstr	@ load outstr address
	mov	r2,#6		@ outstr length 6 bytes

	svc	0


	@ setup exit
	mov	r7, #1		@ setup exit
	mov	r0, #0		@ return 0
	svc	0

.data
outstr:		.ascii		"     \n"

