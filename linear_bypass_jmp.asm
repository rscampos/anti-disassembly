; Raphael Campos Silva <raphaelcampos.rp@gmail.com>
; 14/01/2016
; 
; Description: Example of anti-disassembly to defeat linear-disassembly
; using 'unconditional jump' (jmp) with 'rogue byte'.
;
; nasm -f elf32 source.asm
; ld source.o -o binary
; objdump -M att -d binary

global _start
section .text
	do_write:
		mov eax, 4h
		mov ebx, 1h
		mov ecx, msg
		mov edx, 5h
		int 80h
		ret

	_start:
		jmp loc3
		
		db 0E8h
		
		loc3:
			push 2Ah
			call do_write

		xor eax, eax
		inc eax
		int 80h

msg	db "hello",0
