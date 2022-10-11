
;void ft_list_sort(t_list **begin_list, int (*cmp)());

global ft_list_sort

section .text

; rdi: **begin_list, rsi: (*cmp)()

ft_list_sort:
