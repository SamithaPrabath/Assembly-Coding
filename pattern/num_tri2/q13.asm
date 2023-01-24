section .data
	star 	DB '*'
	newLine DB 0xa
	num db '1'
	
section .bss
	
section .text
	global _start



_start:
	mov ecx,5
	mov eax,0
	
q7:	
	push ecx
	inc eax
	mov ecx,eax
	push eax
	
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
	add eax,'1'
	mov [num],eax
	
	pop eax
	pop ecx
	loop q7


	mov eax,1
	int 80h
