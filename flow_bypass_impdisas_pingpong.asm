; Raphael Campos Silva <raphaelcampos.rp@gmail.com>
; 14/01/2016
;
; Description: Example of anti-disassembly to defeat flow-oriented 
; with 'rogue byte'. The 'rogue byte' in this case can't be ignored. 
;
; nasm -f elf32 source.asm
; ld source.o -o binary
; objdump -M att -d binary

global _start
section .text
	_start:
                mov ax, 05EBh
		xor eax, eax
		jz $-4
		db 0E8h
		push 0Ah
		push 0
		push 1
