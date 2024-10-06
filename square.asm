section .data
    ; Initialized data

section .bss
    ; Uninitialized data

section .text
    global _start

_start:
    mov ax, 2 
    add ax, 2 
    mov bx, 3 
    add bx, 3 
    add bx, 3 
    add ax, bx 

    ; exit
    mov eax, 60
    xor ebx, ebx
    syscall

    