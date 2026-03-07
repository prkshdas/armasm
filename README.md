# arm-asm 🦾

Just me learning ARM assembly from scratch — poking at registers, figuring out how syscalls work, and generally trying to understand what's happening one level below C.

Everything here is written for **AArch64 (ARM64)**, assembled with `as` and linked with `ld` (or via `gcc`). Most of it runs on a Raspberry Pi or any Linux ARM64 machine. You can also use QEMU if you don't have physical hardware.

---

## What's in here

| Folder | What it does |
|---|---|
| `HelloWorld` | The ritual first step — print a string using a raw `write` syscall |
| `RegToMem` | Moving values between registers and memory, understanding `ldr`/`str` |
| `MemCopy` | Copying a block of memory manually, byte by byte |
| `IntToAscii` | Converting an integer to its ASCII string representation for printing |
| `UserInp` | Reading user input from stdin via syscall |
| `SumOfSqu` | Computing sum of squares — arithmetic and looping |
| `Factorial` | Recursive factorial using the stack (`bl`, `ret`, pushing/popping `lr`) |
| `Branch&Macro` | Branching with `b`, `beq`, `bne`, etc. + basic macro usage |
| `Branch&Macro_1` | More branching and macro experiments |

---

## Why I'm doing this

Mostly curiosity. I wanted to actually understand what happens when code runs — not just in theory, but concretely: what's in a register, how does a function call work at the instruction level, what does the stack look like. ARM assembly makes all of that visible.

Also ARM is everywhere — phones, Apple Silicon, Raspberry Pis — so it felt like a more relevant starting point than x86.

---

## Running any of these

Make sure you have the ARM toolchain. On a native ARM64 Linux machine:

```bash
sudo apt install binutils gcc
```

For most programs, you can assemble and link manually:

```bash
as -o program.o program.s
ld -o program program.o
./program
```

Or if there's a `Makefile` inside a folder, just:

```bash
make
./program
```

If you're on x86 and want to run this via QEMU:

```bash
sudo apt install qemu-user qemu-user-static gcc-aarch64-linux-gnu binutils-aarch64-linux-gnu

aarch64-linux-gnu-as -o program.o program.s
aarch64-linux-gnu-ld -o program program.o
qemu-aarch64 ./program
```
or

```bash
arm-linux-gnueabi-as -o program.o program.s
arm-linux-gnueabi-ld -o program program.o
qemu-arm ./program
```

---

## Things I've picked up so far

- ARM uses a load/store architecture — you can't operate directly on memory, everything goes through registers first
- `x0`–`x7` are argument/return registers; `x8` holds the syscall number
- The stack pointer (`sp`) must stay 16-byte aligned or you'll get a bus error
- `bl` saves the return address into `lr` (x30); `ret` jumps back to it
- Macros in ARM assembly are just text substitution — handy but can get messy fast
- `svc #0` is how you make a Linux syscall on AArch64

---

## Resources I've been using

- [ARM Architecture Reference Manual (AArch64)](https://developer.arm.com/documentation/ddi0487/latest)
- [AArch64 Linux Syscall Table](https://arm.syscall.sh/)
- [Azeria Labs ARM Assembly tutorials](https://azeria-labs.com/writing-arm-assembly-part-1/)

---

*This is a learning repo, not a library. Expect rough edges, minimal comments, and the occasional wrong turn.*
