
;int ft_list_size(t_list *begin_list);

global ft_list_size

section .text

ft_list_size:
    xor rax, rax
    loop:
        cmp rdi, 0
        je return
        inc rax
        mov rdi, [rdi + 8]
        jmp loop
    return:
        ret    
