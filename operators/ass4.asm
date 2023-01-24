section .data
	newLine db 0xa
	
	msg1 db 0xa,'Add : ',0xa
	len1 equ $-msg1
	operation1 db ' + '
	num1 db '5'
	num2 db '2'
	
	msg2 db 0xa,'Sub : ',0xa
	len2 equ $-msg2
	operation2 db ' - '
	num3 db '8'
	num4 db '3'
	
	msg3 db 0xa,'Mul : ',0xa
	len3 equ $-msg3
	operation3 db ' * '
	num5 db '1'
	num6 db '4'
	
	
	msg4 db 0xa,'Div : ',0xa
	len4 equ $-msg4
	operation4 db ' / '
	num7 db '9'
	num8 db '4'

	msg5 db 0xa,'............Answers.......... '
	len5 equ $-msg5
	
	
	msg6 db 0xa,'Quotient : '
	len6 equ $-msg6
	
	msg7 db 0xa,'Reminder : '
	len7 equ $-msg7
	
	

section .bss
	ans resb 2
	rem resb 2

section .text
	global _start
	
_start:
	call Addition
	
	call Subtraction
	
	call Multiplication
	
	call Division
	

Addition:

	mov eax,4
	mov ebx,1
	mov ecx,msg1
	mov edx,len1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,num1
	mov edx,1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,operation1
	mov edx,3
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,num2
	mov edx,1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,msg5
	mov edx,len5
	int 80h
	
	mov eax,[num1]
	sub eax,'0'
	mov ebx,[num2]
	sub ebx,'0'
	add eax,ebx
	add eax,'0'
	mov [ans],eax
	
	mov eax,4
	mov ebx,1
	mov ecx,ans
	mov edx,1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,newLine
	mov edx,1
	int 80h
	
Subtraction:

	mov eax,4
	mov ebx,1
	mov ecx,msg2
	mov edx,len2
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,num3
	mov edx,1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,operation2
	mov edx,3
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,num4
	mov edx,1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,msg5
	mov edx,len5
	int 80h

	mov eax,[num3]
	sub eax,'0'
	mov ebx,[num4]
	sub ebx,'0'
	sub eax,ebx
	add eax,'0'
	mov [ans],eax
	
	mov eax,4
	mov ebx,1
	mov ecx,ans
	mov edx,1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,newLine
	mov edx,1
	int 80h
	
Multiplication:
	
	mov eax,4
	mov ebx,1
	mov ecx,msg3
	mov edx,len3
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,num5
	mov edx,1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,operation3
	mov edx,3
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,num6
	mov edx,1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,msg5
	mov edx,len5
	int 80h
	
	mov eax,[num5]
	sub eax,'0'
	mov ebx,[num6]
	sub ebx,'0'
	mul ebx
	add eax,'0'
	mov [ans],eax
	
	mov eax,4
	mov ebx,1
	mov ecx,ans
	mov edx,1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,newLine
	mov edx,1
	int 80h
	
Division:

	mov eax,4
	mov ebx,1
	mov ecx,msg4
	mov edx,len4
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,num7
	mov edx,1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,operation4
	mov edx,3
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,num8
	mov edx,1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,msg5
	mov edx,len5
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,newLine
	mov edx,1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,msg6
	mov edx,len6
	int 80h

	mov ax,[num7]
	sub ax,'0'
	mov bl,[num6]
	sub bl,'0'
	xor ah,ah
	div bl
	add ax,'0'
	mov [ans],al
	add ah,'0'
	mov [rem],ah
	
	mov eax,4
	mov ebx,1
	mov ecx,ans
	mov edx,1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,newLine
	mov edx,1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,msg7
	mov edx,len7
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,rem
	mov edx,1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,newLine
	mov edx,1
	int 80h
	
	mov eax,1
	int 80h

	
