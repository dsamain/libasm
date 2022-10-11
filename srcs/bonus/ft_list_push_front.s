
global ft_list_push_front

extern malloc

section .text

;typedef struct s_list
;{
    ;struct s_list *next;
    ;void *data;
;} t_list;

; rdi: **begin_list, rsi: *data
ft_list_push_front:
    push rdi
    push rsi
    mov rdi, 16
    call malloc
    cmp rax, 0
    je error
    pop rsi
    pop rdi
    mov rcx, [rdi]
    mov [rax], rcx
    mov [rax + 8], rsi
    mov [rdi], rax

error:
    ret