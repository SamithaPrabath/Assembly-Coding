section .data
	msg db 'Enter a Number :'
	len_msg equ $-msg
	
	msg1 db 'Factorial :'
	len_msg1 equ $-msg1
	
	ans dw 1
	
	
section .bss
	num resb 1
	
section .text
	global _start
	
_start:
	mov eax,4
	mov ebx,1
	mov ecx,msg
	mov edx,len_msg
	int 80h
	
	mov eax,3
	mov ebx,1
	mov ecx,num
	mov edx,1
	int 80h
	
	mov eax,[ans]
	mov ebx,[ans]
	mov ecx,[num]
	sub ecx,'0'
	mov edx,1
	
	
L1:
	mov al,dl
	mov bl,[ans]
	
	mul bl
	mov [ans],ax

	inc dl
	loop L1

	mov ecx,10
	mov ebx,0
L2:
	mov edx,0
	div ecx
	push edx
	inc ebx
	cmp eax,0
	jne L2
	
	mov ecx,ebx
	push ecx
	
	mov eax,4
	mov ebx,1
	mov ecx,msg1
	mov edx,len_msg1
	int 80h
	
	pop ecx
	
L3:
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
	loop L3
	
	mov eax,1
	int 80h
