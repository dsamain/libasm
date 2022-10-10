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
    {
        printf("\n_______ft_strcmp_______\n");
        char *s1, *s2;
        s1 = "aaaaaaa", s2 = "z";
        printf("ft_strcmp(%s, %s) = %d\n", s1, s2, ft_strcmp(s1, s2));
        s1 = "abcde", s2 = "abcd";
        printf("ft_strcmp(%s, %s) = %d\n", s1, s2, ft_strcmp(s1, s2));
        s1 = "abcde", s2 = "abcde";
        printf("ft_strcmp(%s, %s) = %d\n", s1, s2, ft_strcmp(s1, s2));
        s1 = "pouet", s2 = "";
        printf("ft_strcmp(%s, %s) = %d\n", s1, s2, ft_strcmp(s1, s2));
    }
    {
        printf("\n_______ft_read_______\n");
        char buf[100];
        int fd = open("libasm.h", O_RDONLY);
        int ret;

        ret = ft_read(fd, buf, 5);
        if (ret >= 0) buf[ret] = 0;
        printf("ret: %d\n", ret);
        if (ret >= 0) {
            buf[ret] = 0;
            printf("buf: [%s]\n", buf);
        }
        printf("errno: %s\n", strerror(errno));
        close(fd);

        fd = open("pouet", O_RDONLY);
        ret = ft_read(fd, buf, 5);
        printf("\nret: %d\n", ret);
        if (ret >= 0) {
            buf[ret] = 0;
            printf("buf: [%s]\n", buf);
        }
        printf("errno: %s\n", strerror(errno));
    }
}
