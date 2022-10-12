extern _ft_write

section .text

global main

main: 
    mov rdi, 1
    mov rsi, msg 
    mov rdx, 13
    call _ft_write


section .data
    msg: db "Hello, World!", 0xa