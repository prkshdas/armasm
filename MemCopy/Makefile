build:
	arm-linux-gnueabi-as -o main.o main.s
	arm-linux-gnueabi-ld -o main main.o

execute:
	qemu-arm ./main

clean:
	rm main main.o
