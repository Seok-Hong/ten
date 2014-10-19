;------------------------------------------------------------------------------
; temporary Makefile
;
; Author: Seok Hong (seok85.hong@gmail.com)
; Date: 2014-10-12
;
; Changelog:
;	0.0.1 - first version
;------------------------------------------------------------------------------
[ORG 0x00]		; set startup address to 0x00
[BITS 16]		; use 16bit code

SECTION .text		; define .text section

jmp 0x07c0:START	; far-jump to START label with store the 0x07C0 into CS

START:
	mov ax, 0x07c0		; AX <- 0x07c0
	mov ds, ax		; DS <- AX(0x07c0)

	mov ax, 0xB800		; AX <- 0xB800
	mov es, ax		; ES <- AX(0xB800)

	mov si, 0

.SCREENCLEARLOOP:			; remove screen (80*28*2)
	mov byte [es:si], 0		; remove character
	mov byte [es:si + 1], 0x02	; see. table 4-2, on book1 (p.123)
					; set background:black 
					; set foreground:green

	add si, 2		; move next character position

	cmp si, 80*25*2		; si value will be size of screen

	jl .SCREENCLEARLOOP	; if si less than 80*25*2, clear next position.

	mov si, 0		; clear si register to print boot message
	mov di, 0		; clear di register to print boot message

.MESSAGELOOP:
	mov cl, byte [si+MESSAGE1]	; set cl register to MESSAGE1 label

	cmp cl, 0		; until cl == 0 (this mean, boot message is end with 0)
	je .MESSAGEEND

	mov byte [es:di], cl	; set character from MESSAGE1 label.

	add si, 1		; move next character of MESSAGE1
	add di, 2		; skip back/foreground character

	jmp .MESSAGELOOP

.MESSAGEEND:			; If we print all of MESSAGE1, we will be here.

	jmp $			; run infinite-loop

MESSAGE1:	db 'TEN OS Boot Loader Start~!!', 0	; BootLoader Message

times 510 - ( $ - $$)	db 0x00	; $: current address
				; $$: start address of currect section(.text section)
				; $-$$: offset related by current section

dw 0xAA55		; bootloader magic number
