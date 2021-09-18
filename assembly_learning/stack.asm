section .data
	; this is 2 bytes
	digit db 0,10

section .text
	global _start

_start:
	;mov rax, 7
	;call _printRAXDigit
	; the above code causes a coredump for some reason. I need to learn more

	push 4
	push 3
	push 2
	push 1

	pop rax
	call _printRAXDigit
	pop rax
	call _printRAXDigit
	pop rax
	call _printRAXDigit
	pop rax
	call _printRAXDigit

	mov rax, 60
	mov rdi, 0
	syscall

_printRAXDigit:
	add rax, 48		; so rax now has and ASCII code "0"
	mov [digit], al ; move the lower bits for data into what digit is pointing to 10 is newline and no problem
	mov rax, 1
	mov rdi, 1
	mov rsi, digit
	mov rdx, 2
	syscall
	ret
