section .data
	star 	DB '*'

	newLine DB 0xa
	
	
section .text
	global _start



_start:
	
	mov ecx,4
	
q7:	
	push ecx
	mov ecx,6
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
	pop ecx
	loop q7


	mov eax,1
	int 80h