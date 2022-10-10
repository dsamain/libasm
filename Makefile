NAME = libasm.a

SRCS = ft_strlen.s #ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s

OBJS = $(SRCS:.s=.o)

CC = gcc

CFLAGS = -Wall -Wextra -Werror

.s.o:
	nasm -f elf64 $< -o $@

all : $(OBJS)
	ar rcs $(NAME) $(OBJS)

test : all
	$(CC) $(CFLAGS) main.c $(NAME) -o test

