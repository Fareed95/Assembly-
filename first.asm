section .text
    global _start      ; Entry point for the linker

_start:
    ; Perform some simple operations
    mov ax, 8         ; Load 8 into AX register (lower 16 bits of RAX)
    mov bx, 1         ; Load 1 into BX register (lower 16 bits of RBX)
    add ax, bx        ; AX = AX + BX (8 + 1 = 9)
    
    ; Exit the program
    mov eax, 60       ; Syscall number for exit (for x86_64)
    xor ebx, ebx      ; Return code 0
    syscall            ; Invoke the syscall
