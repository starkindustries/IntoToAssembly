#!/bin/bash

# Print number of arguments
echo "#args: $#"

# Verify that at least one argument is given
if [ $# != 1 ]
then
	echo "Error: No filename argument given."
else
	echo "Running $0.."
	echo "Compiling: $1"
fi

# Compile the file with nasm
nasm -f elf32 $1 -o a1.out

# Link the output file
ld -m elf_i386 a1.out -o a2.out

# Run the compiled file
./a2.out

# Print the exit code
echo "Program exited with code: $?"


