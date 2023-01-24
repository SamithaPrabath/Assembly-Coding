section .text
	global _start
_start:

	mov edx, len3
	mov ecx, msg3
	mov ebx, 1
	mov eax, 4
	int 0x80
	
	mov edx, len1
	mov ecx, msg1
	mov ebx, 1
	mov eax, 4
	int 0x80
	
	mov edx, 40
	mov ecx, input1
	mov ebx, 2
	mov eax, 3
	int 0x80
	
	mov edx, len2
	mov ecx, msg2
	mov ebx, 1
	mov eax, 4
	int 0x80
	
	mov edx, 40
	mov ecx, input2
	mov ebx, 2
	mov eax, 3
	int 0x80
	
	mov edx, len3
	mov ecx, msg3
	mov ebx, 1
	mov eax, 4
	int 0x80
	
	mov edx, 40
	mov ecx, input1
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov edx, 40
	mov ecx, input2
	mov ebx, 1
	mov eax, 4
	int 0x80
	
	mov edx, len4
	mov ecx, msg4
	mov ebx, 1
	mov eax, 4
	int 0x80
	
	mov edx, len3
	mov ecx, msg3
	mov ebx, 1
	mov eax, 4
	int 0x80
	
	mov eax, 1
	int 0x80

section .bss
	input1 resb 40
	input2 resb 40	
section .data
	msg1 db 'Enter the Index No:',0xa
	len1 equ $ - msg1
	
	msg2 db 'Enter the Name:',0xa
	len2 equ $ - msg2
	
	msg3 db '*************************************************', 0xa
	len3 equ $ - msg3
	
	msg4 db 'Continues Assessment - 01',0ah,'Date - 23/09/2022',0ah,'CO3211 – Practical work on CO3221',0ah,'Department of Computer Science',0xa
	len4 equ $ - msg4
	
