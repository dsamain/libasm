
global ft_read

section .text

; to get the list of syscall run "tmp=$(locate unistd_64.h) ; cat $tmp"

; rdi: fd, rsi: buf, rdx: count

ft_read:
    mov rax, 0
    mov eax, 0 ; syscall for read
    syscall
    cmp rax, 0
    js error
    ret


error:
    mov rax, -1
    ret
