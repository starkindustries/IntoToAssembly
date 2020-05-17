; Intro to x86 Assembly Part 5
; https://www.youtube.com/watch?v=KgfljMtrKkI

global _start

section .data
	myNum equ 40

_start:
	; Function arguments are pushed onto the stack
	; right before the call instruction.
	; The return argument is passed via the eax register
	push myNum		; push the func parameter onto the stack
	call times2		; call 'times2' function
	mov ebx, eax	; set exit code to the result of computation
	mov eax, 1		; system_exit sys call
	int 0x80			; interrupt for system call

times2:
	; prologue
	push ebp
	mov ebp, esp
	
	; function body
	mov eax, [ebp+8]	; get the function parameter, save in eax
	add eax, eax			; add the param to itself to double it (2x)
	
	; epilogue
	mov esp, ebp
	pop ebp
	ret

