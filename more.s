org 0x7E00
bits 16

more:
	mov ah, 02h
	xor bx, bx
	mov dx, 16
	int 10h

	mov ax, 0A24h
	xor bx, bx
	mov cx, 1
	int 10h

halt:
	; Trap execution if it escapes for whatever reason
	hlt
	jmp 	halt
