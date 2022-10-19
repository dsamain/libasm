
;void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));


global ft_list_remove_if

section .text

; rdi: **begin_list, rsi: *data_ref, rdx: cmp, rcx: free
ft_list_remove_if:
    cmp dword [rdi], 0 
    je end
    mov r8, 0
    mov r9, [rdi]
    jmp loop
loop:
    call compare  
    mov r9, [r9 + 8]
    cmp r9, 0
    jne loop
    ret

compare:
    push rdi
    push rsi
    push rdx
    push rcx
    push r8
    push r9

    mov rax, rdx
    mov rdi, [r9]
    call rax

    pop r9
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi

    cmp rax, 0
    je  remove
    mov r8, r9
    ret

remove: 
    call free_fct
    cmp r8, 0
    je remove_begin
    mov r10, [r9 + 8]
    mov [r8 + 8], r10
    mov r8, r9
    ret

remove_begin:
    mov r10, [r9 + 8] ; r10: next
    mov [rdi], r10
    mov r8, 0
    ret

free_fct:
    push rdi
    push rsi
    push rdx
    push rcx
    push r8
    push r9

    mov rax, rcx
    mov rdi, [r9]
    call rax

    pop r9
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    ret

end:
    ret