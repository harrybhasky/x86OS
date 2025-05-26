[org 0x7c00] ; tell asembler that origin data stored at the memory location where BIOS reads first sector of HD
mov [BOOT_D], dl

xor ax,ax
mov bx, ax
mov cx, ax
mov es, ax
mov ds, ax
mov bp, 0x8000 ; stack base
mov sp, bp

mov bx, 0x7e00 ;mem loc for data to be re3ad

mov ah, 2       ; function 2 - read sector
mov al, 1       ; read 1 sector
mov ch, 0       ; cylinder 0
mov dh, 0       ; head 0
mov cl, 2       ; sector 2 (MBR is sector 1)
mov dl, [BOOT_D] ; use boot disk ID
int 0x13

mov ah, 0x0e
mov al, [0x7e00]
int 0x10
jmp $ ;infinite loop
BOOT_D: db 0


; magic padding

times 510-($-$$) db 0              
dw 0xaa55

times 512 db 'A'

