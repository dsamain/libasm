
global ft_strcpy

section .text

; params : rdi = dest, rsi = src
ft_strcpy:
    mov r8, -1
    loop:
        inc r8
        mov al, [rsi + r8]
        mov [rdi + r8], al
        cmp byte al, 0
        jne loop
        mov rax, rdi
        ret