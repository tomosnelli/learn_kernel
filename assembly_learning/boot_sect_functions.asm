; define strings just like C
mystring:
	db 'Hello, World', 0

; control structures
cmp ax, 4		;if ax = 4
je ax_is_four	;do something (by jumping to that label
jmp else		;else, do another thing
jmp endif		;resume the normal flow

ax_is_four:
	.....
	jump endif

else:
	.....
	jmp endif	;not actually necessary but printed here for completeness
endif:


