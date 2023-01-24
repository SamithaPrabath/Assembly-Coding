section .data
	num1 dw 47
	num2 dw 72
	num3 dw 31
	
	ans dw 0
	
	msg db 'Biggest Number is : '
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

	mov ax,[num1]
	mov bx,[num2]
	mov cx,[num3]
	
	cmp ax,bx
	jge L1
	
	cmp bx,cx
	jge L3
	
	push cx
	jmp Print
	
L1:
	cmp ax,cx
	jg L2
	
	push cx
	jmp Print
	

L2:
	push ax
	jmp Print

L3:
	push bx
	jmp Print
	
Print :
	pop ax
	
	mov ecx,10
	mov ebx,0
	
O1:
	mov edx,0
	div ecx
	push edx
	inc ebx
	cmp eax,0
	jne O1
	
	mov ecx,ebx
O2:
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
	loop O2
	
	mov eax,4
	mov ebx,1
	mov ecx,new_line
	mov edx,1
	int 80h
	
	mov eax,1
	int 80h
	
