section .data
    x dd 10
    y dd 20
    z dd 30

section .bss
    result resb 1

section .text
    global _start

_start:
    push dword [x]
    push dword [y]
    push dword [z]
    
    call add_numbers

    mov eax, 1
    ;xor ebx, ebx
    int 0x80

add_numbers:
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]  ; x
    mov ebx, [ebp+12] ; y
    mov ecx, [ebp+16] ; z

    add eax, ebx
    add eax, ecx

    mov [ebp-4], eax  ; Store result in local variable

    mov eax, [ebp-4]  ; Return result in EAX
    mov [result], eax
   

    pop ebp
    ret 12  ; Clean up 3 pushed arguments
