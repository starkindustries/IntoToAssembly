# Intro to x86 Assembly Language

By Davy Wybiral

[Intro x86 Assembly Language Playlist](https://www.youtube.com/playlist?list=PLmxT2pVYo5LB5EzTPZGfFN0c2GDiSXgQe)

Github

https://github.com/code-tutorials/assembly-intro

## How to Run

Files `ex1.asm` to `ex9.asm` can be compiled and run with these commands:

```
$ nasm -f elf32 $1 -o a1.out
$ ld -m elf_i386 a1.out -o a2.out
$ ./a2.out
```

The bash script `script.sh` automates the above three commands. For example, the following command will compile and run the `ex4.asm` file:

`$ ./script.sh ex4.asm`

For `ex10.asm`, compile and run with the following:

```
$ nasm -f elf32 ex10.asm -o ex10.o
$ gcc -m32 ex10.o -o ex10
$ ./ex10
```

For example 11, see the [example 11 readme](./ex11).