global _start

_start:
	call func
	mov eax, 1		; system_exit sys call
	mov ebx, 0		; set exit code to 0
	int 0x80			; interrupt for system call

func:
	; =============================
	; Prologue of the function
	; =============================
	; If this function calls another function that 
	; also stores esp into ebp, it will change ebp
	; before it returns.
	; To fix this, push the previous value of ebp 
	; onto the stack to preserve it.

	; This allows nested function calls to operate
	; without interfering with each others stack
	; variables
	push ebp
	mov ebp, esp	; ebp is the base pointer register
	; ebp will hold the value of esp (stack pointer)
	; so that the function can restore the top of the stack
	; before returning
	sub esp, 4		; allocate 4 bytes
	;
	; ==============================
	; Function body
	; ============================== 
	mov [esp], byte 'H'
	mov [esp+1], byte 'i'
	mov [esp+2], byte '!'
	mov [esp+3], byte 0x0a	; newline
	mov eax, 4		; sys_write system call
	mov ebx, 1		; stdout file descriptor
	mov ecx, esp	; bytes to write
	mov edx, 4		; number of bytes to write
	int 0x80			; interrupt for system call
	;
	; ==============================
	; Epilogue
	; ==============================
	; restore the stack pointer
	mov esp, ebp
	; At the start of the function, ebp was preserved
	; by pushing it into the stack.
	; To restore the base pointer, pop it from 
	; the stack
	pop ebp
	ret
