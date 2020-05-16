global _start

section .data
	addr db "yellow", 0x0a	; 0x0a is newline character
	len equ	$ - addr				; equ is used to set constant var 'len'

section .text
_start:
	mov [addr], byte 'H'
	mov [addr+5], byte '!'
	mov eax, 4		; sys_write system call
	mov ebx, 1		; stdout file descriptor
	mov ecx, addr	; bytes to write
	mov edx, len	; specify number of bytes to write
	int 0x80			; interrupt for system call
	mov eax, 1		; sys_exit system call
	mov ebx, 0		; exit status is 0
	int 0x80			; interrupt for system call
