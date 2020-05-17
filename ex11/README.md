# Example 11: Make Assembly Functions Accessible to C

## How to Run

Use the following commands to compile and run the program:
```
$ nasm -f elf32 add42.asm -o add42.o
$ gcc -m32 add42.o main.c -o ex11.o
$ ./ex11.o
```

## Expected Results
```
Result: 72
```