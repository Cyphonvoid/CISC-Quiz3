section .text
    global _start
    


_start:
    
    mov ecx,[num]
    mov edx,ecx
    
    label:
    
    cmp ecx,1
    je exit
    
    mov ebx,ecx
    sub ebx,1
    
    imul edx,ebx
    mov [total],edx 
    loop label
   
    
    
   
exit:
    mov eax,1
    int 0x80

segment .bss
    res resb 1


segment .data
    num dd 5       ;number to calculate factorial of
    total dd 1    ;this is where the variable stores the value
   
    
