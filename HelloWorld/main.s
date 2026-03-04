.global _start

_start:
	mov		r7, #4		@ setup write
	mov		r0, #1		@ setup stdout
	ldr		r1, =hello	@ adress of hello
	mov		r2, #13		@ size of the hello
	svc		0		@ ask linux to write to stdout

	@ setup exit
	mov		r7, #1		@ setup exit
	mov		r0, #0		@ return 0	
	svc		0		@ ask linux to terminate

.data
hello:			.ascii		"Hello World!\n"

