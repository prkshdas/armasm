@@@
@ used macro to search null char and calc string length
@ printed Hello world with 0 error
@@@

.include "write.s"

.global _start

_start:
	@ write hello world
	nullwrite	hello

	@ setup exit syscall
	mov		r7, #1		@ setup exit (1 = exit)
	mov		r0, #0		@ return 0 (0 error)		
	svc		0		@ terminate

.data
	@ ascii and asciz same but asciz add automatically add the null char
hello:			.asciz		"Hello World!\n"
