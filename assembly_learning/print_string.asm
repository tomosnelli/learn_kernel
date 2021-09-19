section .data
	text db "Hello World!",10,0
	text2 db "World?",10,0

section .text
	global _start

_start:
	; put 1 to rax to say we want to use sys_write
	mov rax, text 
	call _print

	mov rax, text2
	call _print

	mov rax, 60
	mov rdi, 0	; pass error code to rdi, 0 if nothing happened
	syscall

	

; make a subroutine to count number of character till it hits 0.

; input goes to rax as a pointer to a string
; output will print string at rax
_print:
	; push rax to stack
	; this will save the value(address) that rax holds
	push rax

	; use rbx to count the string
	mov rbx, 0

_Loop:
	; increment rax. this will give the next character to check
	inc rax
	inc rbx

	; cl is 8bit equivalent of rcx
	mov cl, [rax]
	cmp cl, 0

	; jump not equal   so if not equal go do _Loop
	jne _Loop

	; for printing out strings
	mov rax, 1
	mov rdi, 1
	pop rsi
	mov rdx, rbx
	syscall 
	ret
	
