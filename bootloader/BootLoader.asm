;------------------------------------------------------------------------------
; temporary Makefile
;
; Author: Seok Hong (seok85.hong@gmail.com)
; Date: 2014-10-12
;
; Changelog:
;	0.0.1 - first version
;------------------------------------------------------------------------------
[ORG 0x00]	; set startup address to 0x00
[BITS 16]	; use 16bit code

SECTION .text	; define .text section

mov ax, 0xB800	; AX <- 0xB800
mov ds, ax	; DS <- AX(0xB800)

mov byte [0x00], 'M'	; DS:offset; 0xB800:0x000 <- 'M'
mov byte [0x01], 0x4A	; DS:offset; 0xB000:0x001 <- 0x4A 
			; 0x4A; (background:red, foreground:light green)

jmp $		; run infinite-loop

times 510 - ( $ - $$)	db 0x00	; $: current address
				; $$: start address of currect section(.text section)
				; $-$$: offset related by current section

dw 0xAA55	; bootloader magic number
