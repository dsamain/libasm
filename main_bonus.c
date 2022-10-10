#include "libasm.h"

int main() {
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
        printf("ft_atoi_base(%s, %s) = %d\n", n, b, ft_atoi_base(n, b));

    }
}