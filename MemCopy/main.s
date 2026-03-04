@ Memory copy

.global _start



_start:
	ldr		r0, =instr	@ load address of input string to r0
	ldr		r1, =outstr	@ load address of output string to r1

	ldrb		r3, [r0]	@ load 1st byte
	strb		r3, [r1]	@ store 1st byte in the memory
	add		r0, #1		@ increment instr address
	add		r1, #1		@ increment outstr address

	ldrb		r3, [r0]	@ load 2nd byte
	strb		r3, [r1]	@ store 2nd byte
	add 		r0, #1		@ increment instr address
	add		r1, #1		@ increment outstr address

	ldrb		r3, [r0]	@ load 3rd byte
	strb		r3, [r1]	@ store 3rd byte
	add		r0, #1		@ increment instr address
	add		r1, #1		@ increment outstr address

	ldrb		r3, [r0]	@ load 4th byte
	strb		r3, [r1]	@ store 4th byte
	add 		r0, #1		@ increment instr address
	add		r1, #1		@ increment outstr address

	ldrb		r3, [r0]	@ load 5th byte
	strb		r3, [r1]	@ store 5th byte
	add		r0, #1		@ increment instr address
	add		r1, #1		@ increment outstr address

	ldrb		r3, [r0]	@ load 6th byte
	strb		r3, [r1]	@ store 6th byte
	add		r0, #1		@ increment instr address
	add 		r1, #1		@ inrement outstr address

	mov		r3, #'\n'	@ load line ending to r3
	strb		r3, [r1]	@ store line ending to output


	@ setup write syscall
	mov		r7, #4		@ setup write
	mov		r0, #1		@ config stdout
	ldr		r1, =outstr	@ load address of outstr
	mov		r2, #7		@ string size
	svc		0		@ ask linux to write

	@ setup exit
	mov		r7, #1		@ setup exit
	mov		r0, #0		@ return 0
	svc		0		@ ask linux to terminate



.data
instr:			.ascii		"SUMMER"
outstr:			.fill		7, 1, 0		
