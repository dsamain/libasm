NAME = libasm.a

SRCS = $(addprefix srcs/, ft_strlen.s ft_strcpy.s ft_write.s ft_strdup.s ft_strcmp.s ft_read.s)
SRCS_BONUS = $(addprefix srcs/bonus/, test.s ft_atoi_base.s ft_list_push_front.s ft_list_size.s ft_list_sort.s ft_list_remove_if.s)

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
	./test

test_bonus : bonus
	$(CC) -no-pie $(CFLAGS) main_bonus.c $(NAME) -o test_bonus
	./test_bonus

clean :
	rm -Rf $(OBJS)
	rm -Rf $(OBJS_BONUS)
	rm -f test
	rm -f test_bonus

fclean: clean
	rm -f $(NAME)
	rm -f $(NAME)