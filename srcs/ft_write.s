
global ft_write

section .text

; to get the list of syscall run "tmp=$(locate unistd_64.h) ; cat $tmp"

; rdi: fd, rsi: buf, rdx: count

ft_write:
    mov eax, 1 ; syscall for write
    syscall
    cmp rax, 0
    js error
    ret

error:
    mov rax, -1
    ret