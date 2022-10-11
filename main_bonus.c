#include "libasm.h"

//t_list *ft_create_elem(void *data) {
    //t_list *new;

    //new = malloc(sizeof(t_list));
    //if (!new)
        //return (NULL);
    
    //new->data = data;
    //new->next = NULL;
    //return (new);
//}

void    ft_list_push_front(t_list **begin_list, void *data);

int main() {
    test("bonjour a tous", printf);
    {
        printf("\n_______ft_list_push_front_______\n");
        t_list *list = NULL;
        printf("list = %p\n", &list);
        int tmp = 42;
        ft_list_push_front(&list, (void*)&"1");
        ft_list_push_front(&list, (void*)&"2");
        ft_list_push_front(&list, (void*)&"3");
        printf("*list = %d\n", *((int *)list->data));
        //ft_list_push_front(&list, "2");
        //ft_list_push_front(&list, "1");
        t_list *cur = list;
        while (cur) {
            printf("%p: next: %p data: %s\n", cur, cur->next, (char *)(cur->data));
            cur = cur->next;
        }
    }

    {
        printf("\n_______ft_list_size_______\n");
        t_list *list = NULL;

        int tmp = 42;
        ft_list_push_front(&list, (void*)&"1");
        printf("list size: %d\n", ft_list_size(list));
        ft_list_push_front(&list, (void*)&"2");
        printf("list size: %d\n", ft_list_size(list));
        ft_list_push_front(&list, (void*)&"3");
        printf("list size: %d\n", ft_list_size(list));

    }

    {
        printf("\n_______ft_atoi_base_______\n");
        char *n = "    +---42 ", *b = "0123456789";
        printf("ft_atoi_base(%s, %s) = %d\n", n, b, ft_atoi_base(n, b));
        n = "01111111111111111111111111111111", b = "01";
        printf("ft_atoi_base(%s, %s) = %d\n", n, b, ft_atoi_base(n, b));
        n = "-2147483648", b = "0123456789";
        printf("ft_atoi_base(%s, %s) = %d\n", n, b, ft_atoi_base(n, b));
        n = "", b = "";
        printf("ft_atoi_base(%s, %s) = %d\n", n, b, ft_atoi_base(n, b));
        n = "01010", b = "101";
        printf("ft_atoi_base(%s, %s) = %d\n", n, b, ft_atoi_base(n, b));
        n = "01010", b = "+01";
        printf("ft_atoi_base(%s, %s) = %d\n", n, b, ft_atoi_base(n, b));
        n = "01010", b = "01-";

    }
}