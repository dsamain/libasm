NAME = libasm.a

SRCS = $(addprefix srcs/, ft_strlen.s ft_strcpy.s ft_write.s ft_strdup.s) # ft_strcmp.s ft_read.s ft_strdup.s

OBJS = $(SRCS:.s=.o)

CC = gcc

CFLAGS = -Wall -Wextra -Werror

.s.o:
	nasm -f elf64 $< 

all : $(OBJS)
	ar rcs $(NAME) $(OBJS)

test : all
	$(CC) -no-pie $(CFLAGS) main.c $(NAME) -o test

clean :
	rm -Rf $(OBJS)