section .data
	msg1 	DB 0xa,'Enter a digit :----- '
	len1 equ $-msg1
	
	msg2 	DB 'Please enter a second digit :----- '
	len2 equ $ -msg2
	
	msg3 	DB 0xa,'The sum of both number is :----- '
	len3 equ $ -msg3
	
	msg4 	DB 0xa,'The Substraction of both number is :----- '
	len4 equ $ -msg4
	
	msg5 	DB 0xa,'The Multiplication of both number is :----- '
	len5 equ $ -msg5
	
	msg6 	DB 0xa,'The Division of both number is :----- '
	len6 equ $ -msg6

section .bss
	num1 resw 2
	num1_len equ $-num1
	
	num2 resw 2
	num2_len equ $-num2
	
	ans1 resw 2
	ans2 resw 2
	ans3 resw 2
	ans4 resw 10
	
section .text
	global _start

_start:
	
	mov eax,4
	mov ebx,1
	mov ecx,msg1
	mov edx,len1
	int 80h
	
	mov eax,3
	mov ebx,0
	mov ecx,num1
	mov edx,num1_len
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,msg2
	mov edx,len2
	int 80h
	
	mov eax,3
	mov ebx,0
	mov ecx,num2
	mov edx,num2_len
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,msg3
	mov edx,len3
	int 80h
	
	mov eax,[num1]
	sub eax,'0'
	mov ebx,[num2]
	sub ebx,'0'
	add eax,ebx
	add eax,'0'
	mov [ans1],eax
	
	mov eax,4
	mov ebx,1
	mov ecx,ans1
	mov edx,1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,msg4
	mov edx,len4
	int 80h
	
	mov eax,[num1]
	sub eax,'0'
	mov ebx,[num2]
	sub ebx,'0'
	sub eax,ebx
	add eax,'0'
	mov [ans2],eax
	
	mov eax,4
	mov ebx,1
	mov ecx,ans2
	mov edx,2
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,msg5
	mov edx,len5
	int 80h
	
	mov al,[num1]
	sub al,'0'
	mov bl,[num2]
	sub bl,'0'
	mul bl
	add al,'0'
	mov [ans3],al
	
	mov eax,4
	mov ebx,1
	mov ecx,ans3
	mov edx,2
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,msg6
	mov edx,len6
	int 80h
	
	mov ax,[num1]
	sub ax,'0'
	mov bl,[num2]
	sub bl,'0'
	xor ah,ah
	div bl
	add ax,'0'
	mov [ans4],al
	
	
	mov eax,4
	mov ebx,1
	mov ecx,ans4
	mov edx,2
	int 80h
	
	mov eax,1
	int 80h
	
	
