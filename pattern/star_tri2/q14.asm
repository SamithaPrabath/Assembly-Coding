section .data
	star 	DB '*'
	newLine DB 0xa
	num db '1'
	spac db ' '
	num1 db '1'
	
section .bss
	
section .text
	global _start



_start:
	mov ecx,5
	mov ebx,6
	mov eax,0h
	mov [num1],eax
q7:	
	push ecx
	dec ebx
	mov ecx,ebx
	push ebx
	
	space:
		push ecx
		
		mov eax,4
		mov ebx,1
		mov ecx,spac
		mov edx,1
		
		int 0x80
		pop ecx
		dec ecx
		cmp ecx,0
		jg space
	
	mov eax,[num1]
	inc eax
	mov [num1],eax
	mov ecx,eax
	q1:
		push ecx
		mov eax,4
		mov ebx,1
		mov ecx,star
		mov edx,1
		int 0x80
		pop ecx
		loop q1
	
	
	
	mov eax,4
	mov ebx,1
	mov ecx,newLine
	mov edx,1
	
	int 0x80
	
	pop ebx
	pop ecx
	loop q7

mov eax,1
int 80h
