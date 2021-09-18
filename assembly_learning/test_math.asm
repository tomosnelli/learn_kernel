section .data
	; this is 2 bytes
	digit db 0,10

section .text
	global _start

_start:
	;mov rax, 7
	;call _printRAXDigit
	; the above code causes a coredump for some reason. I need to learn more

	mov rax, 6
	mov rbx, 2
	div rbx
	call _printRAXDigit

	mov rax, 1
	add rax, 4
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
