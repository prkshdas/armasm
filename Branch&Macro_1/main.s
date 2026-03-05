@ program that takes a string and remove duplicate letters
@
@
@ Registers:
@		r0 = input string address
@		r1 = output string address
@		r2 = tmp byte 
@		r3 = last read byte

.include "write.s"


.global _start

_start:
	ldr			r0, =instr		@ load address of instr into r0
	ldr			r1, =outstr		@ load address of outstr into r1
	mov			r3, #0			@ init register r3

loop:
	ldrb			r2, [r0], #1		@ load and increment
	cmp			r2, #0			@ check if null
	beq			exit			@ if equal end of the string
	cmp			r2, r3			@ see if equal to last value
	beq			loop			@ if equal, go to beginning of the loop
	strb			r2, [r1], #1		@ store and increment
	mov			r3, r2			@ update r3
	b			loop			

exit:
	nullwrite		outstr
	
	@setup exit
	mov 			r7, #1			@ setup exit
	mov			r0, #0
	svc			0

.data
instr:				.ascii			"Heeyy I'mm usinng Linnux "
				.asciz			"and enjoyying ittt!\n"

outstr:				.fill			128,1,0		@ reserve 128 bytes

