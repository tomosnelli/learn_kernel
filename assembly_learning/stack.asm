; didn't add section .data... probably will work??
section .text
	global _start

_start:
	push 3
	call _seeStack
	push 2
	call _seeStack
	push 1
	call _seeStack
	push 0
	call _seeStack

_seeStack:
	mov r10, [rsp]
	mov rax, 1
	mov rdi, 1
	mov rsi, r10
	mov rdx, 4
	syscall
	ret
	
