
global ft_write
extern __errno_location

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
    mov rdx, rax
    call __errno_location
    imul rdx, rdx, -1
    mov [rax], rdx
    mov rax, -1
    ret