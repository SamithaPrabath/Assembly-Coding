section	.text
   global _start         
	
_start:                  
   ;create the file
   mov  eax, 8
   mov  ebx, file_name
   mov  ecx, 0777        ;read, write and execute by all
   int  0x80             
	
   mov [fd_out], eax
    
   ; write into the file
   mov	edx,len          ;number of bytes
   mov	ecx, msg         ;message to write
   mov	ebx, [fd_out]    ;file descriptor 
   mov	eax,4            ;system call number (sys_write)
   int	0x80             ;call kernel
	
   ; close the file
   mov eax, 6
   mov ebx, [fd_out]
    
   ; write the message indicating end of file write
   mov eax, 4
   mov ebx, 1
   mov ecx, msg_done
   mov edx, len_done
   int  0x80
    
   
       
   mov	eax,1             ;system call number (sys_exit)
   int	0x80              ;call kernel

section	.data
file_name db 'testwrite.txt'
msg db 'print message 1'
len equ  $-msg

msg_done db 'Written to file', 0xa
len_done equ $-msg_done

section .bss
fd_out resb 1
fd_in  resb 1
info resb  26
