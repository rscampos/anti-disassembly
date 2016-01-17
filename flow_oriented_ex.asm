; Raphael Campos Silva <raphaelcampos.rp@gmail.com>
; 14/01/2016
;
; Description: First example of anti-disassembly (flow-oriented).
;
; nasm -f elf32 source.asm
; ld source.o -o binary
; objdump -M intel -d binary

global _start
section .text
	_start:
		test eax, eax
		jz short loc_1A
		push Failed_string
		jmp short loc_1D

		; --------
		Failed_string db "Failed",0
		; --------
		
		loc_1A:
			xor eax, eax
		loc_1D:
			xor eax, eax
			inc eax
			int 80h
