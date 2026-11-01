org 0x7C00
bits 16

start:
	xor ax, ax
	mov [8000], ax
	mov ax, 0xFFFF
	mov bp, ax
	mov sp, bp

try:
	mov ax, [8000]
	inc ax
	mov [8000], ax

	mov ax, 0x7E0
	mov es, ax
	mov ax, 0x0201
	mov cx, 0x0002
	xor dx, dx
	xor bx, bx
	int 13h

	push ax
	cmp ah, 0
	jne bad

	mov ah, 02h
	xor bx, bx
	mov dx, 32
	int 10h

	mov ax, 0A31H
	xor bx, bx
	mov cx, 1
	int 10h

	jmp 0x7E00 

bad:
	mov ax, [8000]
	cmp ax, 4
	je super_bad

	mov ah, 02h
	xor bx, bx
	mov dx, 0032h
	int 10h

	pop ax
	mov ah, 0AH
	xor bx, bx
	mov cx, 1
	int 10h
	jmp try

super_bad:
	mov ah, 02h
	xor bx, bx
	mov dx, 0000h
	int 10h

	mov ax, 0A30H
	xor bx, bx
	mov cx, 1
	int 10h
	

halt:
	; Trap execution if it escapes for whatever reason
	hlt
	jmp 	halt

times 510 - ($ - $$) db 0
dw 0xaa55
