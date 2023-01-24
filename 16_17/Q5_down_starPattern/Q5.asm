section .data
	star db '*'
	
	new_line db 0xa
	
section .text
	global _start
	
_start:
	mov ecx,6


L1:
	push ecx
	L2:
		push ecx
		
		mov eax,4
		mov ebx,1
		mov ecx,star
		mov edx,1
		int 80h
		
		pop ecx
		loop L2
	
	mov eax,4
	mov ebx,1
	mov ecx,new_line
	mov edx,1
	int 80h
	pop ecx
	loop L1
	
	mov eax,1
	int 80h
