section .data
	ans dw 1
	
	comma db ','

section .text
	global _start

_start:
	mov eax,3
	mov ecx,7
	push eax
L1:
	pop eax
	mov [ans],eax
	inc eax
	push eax
	push ecx
	
	mov eax,[ans]
	add eax,'0'
	mov [ans],eax
	
	mov eax,4
	mov ebx,1
	mov ecx,ans
	mov edx,1
	int 80h
	
	pop ecx
	loop L1
	
	mov eax,1
	int 80h
	
	
