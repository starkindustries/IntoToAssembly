; c defines the _start function already
; c requires the programmer to define the main function
global main

; extern lets nasm know that 'printf' is an external symbol
extern printf

section .data
	; The 'printf' function will replace '%i' 
	; with an integer.
	; 0x0a is the newline character
	; 0x00 denotes the end of the string
	; 0x00 is known as the null terminator
	msg db "testing %i...", 0x0a, 0x00

main:
	; prologue
	push ebp
	mov ebp, esp

	; function body
	; arguments are pushed in reverse order
	push 123		; 123 is the 2nd param
	push msg		; msg is the 1st param
	call printf	
	mov eax, 0	; exit status 

	; epilogue
	mov esp, ebp
	pop ebp
	ret
