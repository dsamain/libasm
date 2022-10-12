global ft_atoi_base

extern ft_strlen

section .text

; rdi: num, rsi: base
ft_atoi_base:
    mov rax, 0
    cmp rdi, 0
    je end
    cmp rsi, 0
    je end
    mov rcx, -1 ; counter
loop_char:
    inc rcx
    cmp byte [rsi + rcx], 0 ; check of end of string
    je base_len
    jmp check_char
base_len:
    mov r10, rcx ; save base length
loop_dupl:
    cmp rcx, 2 ; check if base is at least 2 chars long
    js error
    mov rcx, -1
ld1:
    inc rcx
    cmp byte [rsi + rcx], 0 ; check of end of string
    je gen
    mov r8, rcx
ld2: 
    inc r8
    cmp byte [rsi + r8], 0
    je ld1
    mov al, byte [rsi + rcx]
    cmp al, byte [rsi + r8]
    je error
    jmp ld2
gen:
    mov rax, 0 ; ret
    mov r8, 1 ; sign
    mov rcx, -1 ; i
whitespace_loop:
    inc rcx
    cmp byte [rdi + rcx], 0
    je return
    cmp byte [rdi + rcx], ' '
    je whitespace_loop
    mov dh, byte [rdi + rcx]
    call is_whitespace
    cmp dl, 1
    je whitespace_loop
    jmp sign_loop
sign_loop_inc:
    inc rcx
sign_loop:
    cmp byte [rdi + rcx], 0
    je return
    cmp byte [rdi + rcx], '+'
    je sign_loop_inc
    cmp byte [rdi + rcx], '-'
    je eq_minus
    jmp num_loop
eq_minus: 
    imul r8, r8, -1
    jmp sign_loop_inc
num_loop_inc:
    inc rcx
num_loop:
    cmp byte [rdi + rcx], 0
    je return
    mov r9, -1 ; j
base_idx:
    inc r9
    cmp byte [rsi + r9], 0
    je return
    mov dl, byte [rsi + r9]
    cmp byte [rdi + rcx], dl
    je update_num
    jmp base_idx
update_num:
    imul rax, r10
    add rax, r9
    jmp num_loop_inc
return:
    imul rax, r8
    ret
check_char: ; check if char is invalid
    cmp byte [rsi + rcx], '+'
    je error
    cmp byte [rsi + rcx], '-'
    je error
    mov dh, byte [rsi + rcx]
    call is_whitespace
    cmp dl, 1
    je error
    jmp loop_char
error:
    mov rax, 0
    ret
is_whitespace:
    mov dl, 1
    cmp dh, ' '
    je end
    sub dh, 9
    cmp dh, 0
    js end
    cmp dh, 4
    jle end 
    mov dl, 0
    ret
end:
    ret