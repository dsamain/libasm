global ft_strlen

section .text

; address of string is stored in rdi

ft_strlen:
    mov rax, 0
    loop:
        cmp byte [rdi + rax], 0
        je end ; je -> jump if equal
        inc rax
        jmp loop
    end:
        ret
        
    