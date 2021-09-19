section .bss
	digitSpace resb 100  ; reserve 100 bytes
	digitSpacePos resb 8 ; reserve enough to hold the value of a single register

section .text
	global _start

_start:
	mov rax, 123
	call _printRAX

	mov rax, 60
	mov rdi, 0
	syscall

_printRAX:	; the subroutine will breakdown the digits backwords this is endianness
	mov rcx, digitSpace
	mov rbx, 10
	mov [rcx], rbx
	inc rcx
	mov [digitSpacePos], rcx  ; digitspace keeps track of where we are

_printRAXLoop:
	mov rdx, 0
	mov rbx, 10
	div rbx		; rax(123) / rbx
	push rax ; now 12 R 3. 3 will go to rdx
	add rdx, 48   ; convert to character

	mov rcx, [digitSpacePos]
	mov [rcx], dl ; lower 8 bytes of rdx, this will load the character from digitSpace
	inc rcx
	mov [digitSpacePos], rcx

	pop rax
	cmp rax, 0
	jne _printRAXLoop

_printRAXLoop2:
	mov rcx, [digitSpacePos]
	mov rax, 1
	mov rdi, 1
	mov rsi, rcx
	mov rdx, 1
	syscall

	mov rcx, [digitSpacePos]
	dec rcx
	mov [digitSpacePos], rcx

	cmp rcx, digitSpace
	jge _printRAXLoop2

	ret
