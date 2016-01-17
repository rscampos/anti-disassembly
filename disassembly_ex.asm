; Raphael Campos Silva <raphaelcampos.rp@gmail.com>
; 14/01/2016
;
; Description: Simple disassembly example, just to
; check the generated machine code.
;
; nasm -f elf32 source.asm
; ld source.o -o binary
; objdump -M intel -d binary

global _start
section .text
	_start:
		xor eax, eax
		inc eax
		dec eax
		mov ebx, eax
		xor eax, eax

		; exit syscall
		mov eax, 1
		int 80h
