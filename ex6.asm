global _start

_start:
	sub esp, 5
	mov [esp], byte 'H'
	mov [esp+1], byte 'e'
	mov [esp+2], byte 'y'
	mov [esp+3], byte '!'
	mov [esp+4], byte 0x0a	; newline
	mov eax, 4		; sys_write system call
	mov ebx, 1		; stdout file descriptor
	mov ecx, esp	; pointer to bytes to write
	mov edx, 5		; number of bytes to write
	int 0x80			; interrupt for system call
	; exit the program
	; note that without this step
	; the program will seg fault
	mov eax, 1		; sys_exit system call
	mov ebx, 0		; set exit status 0
	int 0x80			; interrupt for system call
