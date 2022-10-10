#include "libasm.h"

int main() {
    {
        printf("_______ft_strlen_______\n");
        char *str = "Hello World!";
        printf("ft_strlen(%s) = %d\n", str,  ft_strlen(str));
        printf("ft_strlen(\"\") = %d\n", ft_strlen(""));
    }
    {
        printf("\n_______ft_strcpy_______\n");
        char *src = "Hello everyone";
        char dest[ft_strlen(src) + 1];
        ft_strcpy(dest, src);
        printf("src: %s\n", src);
        printf("dest: %s\n", dest);
    }
    {
        printf("\n_______ft_write_______\n");
        char *str = "Hello World!\n";
        printf("%ld\n", ft_write(1, str, ft_strlen(str)));
        printf("errno: %d\n", errno);
    }
    {
        printf("\n_______ft_strdup_______\n");
        char *str = "Hello World!\n";
        char *dup = ft_strdup(str);
        printf("dup: %s\n", dup);
        printf("errno: %d\n", errno);
    }
}
