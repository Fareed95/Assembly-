section .data
    hello db 'Hello, World!', 0     ; null-terminated string
    fareed db 'fareed hu mai', 0    ; null-terminated string

section .text
    global _start                   ; Entry point for the program

_start:
    ; Write the first string (Hello, World!) to stdout
    mov rax, 1                      ; syscall number for sys_write
    mov rdi, 1                      ; file descriptor 1 is stdout
    mov rsi, hello                  ; pointer to the first string (Hello, World!)
    mov rdx, 13                     ; number of bytes to write (length of "Hello, World!")
    syscall                         ; call the kernel

    ; Write the second string (fareed hu mai) to stdout
    mov rax, 1                      ; syscall number for sys_write
    mov rdi, 1                      ; file descriptor 1 is stdout
    mov rsi, fareed                 ; pointer to the second string (fareed hu mai)
    mov rdx, 13                     ; number of bytes to write (length of "fareed hu mai")
    syscall                         ; call the kernel

    ; Exit the program
    mov rax, 60                     ; syscall number for sys_exit
    xor rdi, rdi                    ; exit code 0
    syscall                         ; call the kernel
