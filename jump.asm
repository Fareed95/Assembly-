section .data 
    hello db 'Hello World',10
    nonexecuting db 'it will not execute', 10
    executing db 'It will execute',10


section .bss
    ; Uninitialized data

section .text
    global _start

_start:
    mov rax, 1
    mov rdi,1
    mov rsi,hello
    mov rdx,12
    syscall

    jmp  exit

    mov rax, 1
    mov rdi,1
    mov rsi,nonexecuting
    mov rdx,20
    syscall

    exit:
    mov rax, 1
    mov rdi,1
    mov rsi,executing
    mov rdx,15
    syscall

    ; exit
    mov eax, 60
    xor ebx, ebx
    syscall