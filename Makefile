NAME = libasm.a

SRCS = $(addprefix srcs/, ft_strlen.s ft_strcpy.s ft_write.s ft_strdup.s ft_strcmp.s ft_read.s)
SRCS_BONUS = $(addprefix srcs/bonus/, ft_atoi_base.s)

OBJS = $(SRCS:.s=.o)
OBJS_BONUS = $(SRCS_BONUS:.s=.o)

CC = gcc

CFLAGS = -Wall -Wextra -Werror

.s.o:
	nasm -f elf64 $< 

all : $(OBJS)
	ar rcs $(NAME) $(OBJS)

bonus: all $(OBJS_BONUS)
	ar rcs $(NAME) $(OBJS_BONUS) $(OBJS)

test : all
	$(CC) -no-pie $(CFLAGS) main.c $(NAME) -o test

testb : bonus
	$(CC) -no-pie $(CFLAGS) main_bonus.c $(NAME) -o testb
	./testb

clean :
	rm -Rf $(OBJS)