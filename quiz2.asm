section .text
    global _start

_start:
    ; x = (a x b) + (c x d)
    mov eax, [a]           ; Load a into eax
    mov ebx, [b]           ; Load b into ebx
    mul ebx                ; Multiply a and b, result in eax

    mov ebx, eax
    mov eax, [c]           ; Load c into ecx
    mov edx, [d]           ; Load d into edx
    mul edx               ; Multiply c and d, result in ecx

    add ebx, eax         ; Add the product of c and d to the product of a and b (in eax)

    mov eax, 1             ; Set eax to 1 (for system call)
    int 0x80              ; Terminate program (system call)

segment .bss
    result resb 1

segment .data
    a DD 5
    b DD 4
    c DD 3
    d DD 5
