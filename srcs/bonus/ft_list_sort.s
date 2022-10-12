
;void ft_list_sort(t_list **begin_list, int (*cmp)());

global ft_list_sort

extern ft_list_size

section .text

; rdi: **begin_list, rsi: (*cmp)()
; rcx: i, r8: j
; rdx: tmp

ft_list_sort:
    and rdx, 0
    push rdi
    push rsi
    mov rdi, [rdi]
    call ft_list_size
    mov rcx, rax
    pop rsi
    pop rdi

    mov r8, [rdi]    
    jmp loop1

loop1_inc:
    mov r8, [r8]
loop1:
    cmp r8, 0
    je return
    mov r9, [r8]
    jmp loop2
loop2_inc:
    mov r9, [r9]
loop2:
    cmp r9, 0
    je loop1_inc

    push rdi
    push rsi
    push rcx
    push r8
    push r9
    push rdx

    mov rax, rsi
    mov rdi, [r8 + 8]
    mov rsi, [r9 + 8]
    call rax ; cmp

    pop rdx
    pop r9
    pop r8
    pop rcx
    pop rsi
    pop rdi

    cmp eax, 0
    jg swap
    jmp loop2_inc

swap:
    mov r10, [r8 + 8]
    mov r11, [r9 + 8]
    mov [r8 + 8], r11
    mov [r9 + 8], r10
    jmp loop2_inc

return:
    ret