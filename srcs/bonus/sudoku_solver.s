
global sudoku_solver

section .text
extern _write

; rdi: char[9][9]
; dl = current char
; rcx = scratch
sudoku_solver:
    mov r8, 0
init_loop:
    call set
    inc r8
    cmp r8, 81
    jne init_loop

    mov r8, -1
    mov rax, 0
    call find_next
    push r9
    call solve
    ret
solve:
    ; pop coordonate from the stack in r8
    pop r11 ; r11 store the ret addr
    pop r8
    push r11
    cmp r8, 81
    jge solved ;(== ret 1)
solve_loop: ; try [current..9]
    add byte [rdi + r8], 1
    cmp byte [rdi + r8], 10
    jge reset ; mov [rdi + r8], 0, ret

    call check;
    cmp rax, 0
    je  solve_loop

    call set

    call find_next
    mov rcx, 0

    push r8 ; push current
    push r9

    call solve

    pop r8 ; retreive current

    call set
    

    cmp rax, 42
    jne solve_loop
    ret

set: 

    push rax
    mov ax, 1
    mov cl, byte [rdi + r8]
    shl ax, cl

    call get_col
    imul r9, r9, 16
    mov cx, ax
    xor [col + r9], cx

    call get_row
    imul r9, r9, 16
    mov cx, ax
    xor [row + r9], cx

    call get_square
    imul r9, r9, 16
    mov cx, ax
    xor [square + r9], cx

    pop rax

    ret

check:
    mov ax, 1
    mov cl, byte [rdi + r8]
    shl ax, cl

    call get_col
    imul r9, r9, 16
    mov cx, ax
    and cx, [col + r9]
    cmp cx, ax
    je zero

    call get_row
    imul r9, r9, 16
    mov ecx, eax
    and ecx, [row + r9]
    cmp ecx, eax
    je zero

    call get_square
    imul r9, r9, 16
    mov ecx, eax
    and ecx, [square + r9]
    cmp ecx, eax
    je zero

    mov rax, 1
    ret

zero: 
    mov rax, 0
    ret

; r8 -> r9
get_row: ; return the row index of r8
    push rax
    push rdx
    push rcx
    push r8
    push r10

    mov rdx, 0
    mov rax, r8 
    mov r9, 9
    div r9w
    mov r9b, al 

    pop r10
    pop r8
    pop rcx
    pop rdx
    pop rax
    ret

get_col: ; return the col index of r8
    push rax
    push rdx
    push rcx
    push r8
    push r10

    call get_row
    mov r10, r9
    imul r10, r10, 9
    mov r9, r8
    sub r9, r10

    pop r10
    pop r8
    pop rcx
    pop rdx
    pop rax

    ret

get_square: ; return the square index of r8 -> very complicated because i can't get remainder of the div for some reason
    ; row - row % 3 + col / 3
    call get_row
    ; r9 = row

    push rax
    push rdx
    push rcx
    push r8
    push r10

    mov rdx, 0
    mov rax, r9 
    mov r9, 3
    div r9w
    mov r9b, al 
    imul r9, r9, 3
    push r9
    call get_col
    mov rdx, 0
    mov rax, r9 
    mov r9, 3
    div r9w
    mov r9b, al 
    pop r10
    add r9, r10

    pop r10
    pop r8
    pop rcx
    pop rdx
    pop rax

    ret

; r8 -> r9
find_next:
    mov r9, r8
find_next_loop:
    inc r9
    cmp r9, 81
    jge end
    mov cl, [rdi + r9]
    cmp cl, 0
    je end
    jmp find_next_loop

reset:
    mov byte [rdi + r8], 0
    ret
solved:
    mov rax, 42
    ret

end:
    ret

section .data
    row:    times 18 db 0 ; i * 18 + j -> j taken on row[i]
    col:    times 18 db 0
    square: times 18 db 0