section .data
	arr db 3,4,10
	ans db 1
	
	msg db 'Multiplication of Series : '
	msg_len equ $-msg
	
	new_line db 0xa
	
section .text
	global _start
	
_start:
	mov eax,4
	mov ebx,1
	mov ecx,msg
	mov edx,msg_len
	int 80h


	mov al,[arr]
	mov bl,[arr+1]
	
	mul bl
	
	mov bl,[arr+2]
	
	mul bl
	
	mov ecx,10
	mov ebx,0
	
L1:
	mov edx,0
	div ecx
	push edx
	inc ebx
	cmp eax,0
	jne L1
	
	
	mov ecx,ebx

L2:
	pop edx
	add edx,'0'
	mov [ans],edx
	
	push ecx
	
	mov eax,4
	mov ebx,1
	mov ecx,ans
	mov edx,1
	int 80h
	pop ecx
	loop L2
	
	mov eax,4
	mov ebx,1
	mov ecx,new_line
	mov edx,1
	int 80h
	
	mov eax,1
	int 80h
	
	
	
