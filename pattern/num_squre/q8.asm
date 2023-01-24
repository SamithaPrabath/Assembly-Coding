section .data
	star 	DB '*'
	num DB '0'
	newLine DB 0xa
	
	
section .text
	global _start



_start:
	
	mov ecx,5
	
q7:	
	push ecx
	mov ecx,5
	q1:
		push ecx
		
		mov eax,4
		mov ebx,1
		mov ecx,num
		mov edx,1
		
		int 0x80
		
		pop ecx
		loop q1
		
	mov eax,4
	mov ebx,1
	mov ecx,newLine
	mov edx,1
	
	int 0x80
	
	mov eax,[num]
	sub eax,'0'
	inc eax
	add eax,'0'
	mov [num],eax
	
	pop ecx
	loop q7


	mov eax,1
	int 80h
