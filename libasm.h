#pragma once
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>

int     ft_strlen(char *s);
char    *ft_strcpy(char *dest, const char *src);
ssize_t ft_write(int fd, const void *buf, size_t count);
char    *ft_strdup(const char *s);