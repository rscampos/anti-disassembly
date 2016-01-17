; Raphael Campos Silva <raphaelcampos.rp@gmail.com>
; 14/01/2016
;
; Description: Example of anti-disassembly to defeat flow-oriented 
; wit 'rogue byte'. After jump, 'inc eax' and 'dec eax' appers
; resulting in a nop. The 'rogue byte' in this case can't be ignored.
;
; nasm -f elf32 source.asm
; ld source.o -o binary
; objdump -M att -d binary

global _start
section .text
	_start:
		jmp $+1
		db 0xc0
		dec eax
