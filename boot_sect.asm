mov ah, 0x0e ; tty mode

; attempt 1
mov al, "1"
int 0x10
mov al, the_secret
int 0x10

; attampt 2
mov al, "2"
int 0x10
mov al, [the_secret]
int 0x10

;attempt 3
mov al, "3"
int 0x10
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

; attempt 4
mov al, "4"
int 0x10
mov al, [0x7c2d]
int 0x10

jmp $ ; jump to current address = infinite loop

the_secret:
	db "X"

; padding and magic number
times 510-($-$$) db 0
dw 0xaa55
