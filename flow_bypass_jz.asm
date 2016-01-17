; Raphael Campos Silva <raphaelcampos.rp@gmail.com>
; 14/01/2016
;
; Description: Example of anti-disassembly to defeat flow-oriented 
; using 'conditional jump' after xor instruction which sets ZF flag.
; Can be used others 'conditional jump' after instructions which uses 
; especific bit in EFLAGS register after set them somehow.
;  - Ex: JC, JB, JNC, JAE... 
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
		; "...conditional jump instruction placed where the condition 
		; will always be the same..." - Pratical Malware Analysis
		; "Jump Instructions with a constant condition"
		xor eax, eax
		jz loc3
		
		db 0E8h
		
		loc3:
			push 2Ah
			call do_write

		xor eax, eax
		inc eax
		int 80h

msg	db "hello",0
