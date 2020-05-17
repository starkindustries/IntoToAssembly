global _start

_start:
	call func		; call label "func"
	mov eax, 1	; sys_exit system call
	int 0x80		; interrupt for system call
	
func:
	mov ebx, 42	;	
	pop eax			; pop item from stack and save into eax
	; note that last item pushed onto stack was
	; the return location that the 'call' operation
	; pushed onto the stack
	jmp eax			; jump back to location stored in eax
	; the 'ret' (return) instruction does the same
	; thing as the 'pop' and 'jmp' instructions above

