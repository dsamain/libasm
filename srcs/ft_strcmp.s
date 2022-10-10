
global ft_strcmp

section .text

; rdi: s1, rsi: s2
ft_strcmp:
    mov rcx, 0
    loop:
        cmp byte [rdi + rcx], 0
        je end
        cmp byte [rsi + rcx], 0
        je end
        mov al, byte [rdi + rcx]
        cmp al, [rsi + rcx]
        jne end
        inc rcx
        jmp loop
    end: 
        movzx rax, byte [rdi + rcx]
        movzx rdi, byte [rsi + rcx]
        sub rax, rdi
        ret