# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: khuynh <khuynh@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/13 15:12:48 by khuynh            #+#    #+#              #
#    Updated: 2022/05/15 12:33:11 by khuynh           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

DPRINTF = \
		ft_printf.c		\
		ft_printfhex.c   \
		ft_printfnb.c    \
		ft_printfphex.c  

OBJS = ${DPRINTF:.c=.o}
CFLAGS = -Wall -Werror -Wextra


# COLORS
RESET=        \033[0m
DARK=        \033[1;32m
RED=        \033[31m
GREEN=        \033[32m
YELLOW=        \033[33m
BLUE=        \033[34m
MAGENTA=    \033[35m
CYAN=        \033[36m
WHITE=        \033[37m
BOLDBLACK=    \033[1m\033[30m
BOLDRED=    \033[1m\033[31m
BOLDWHITE=    \033[1m\033[37m
BOLDGREEN=    \033[1m\033[32m

all: ${NAME}

.c.o:

	@gcc ${CFLAGS} -c $< -o ${<:.c=.o}

${NAME} : ${OBJS}
	@make -C libft
	@cp libft/libft.a .
	@mv libft.a ${NAME}
	@echo "${GREEN}LIBFT COMPILED ${RESET}"	
	@echo "$(MAGENTA)compiling printf... $(RESET)"
	@ar rcs ${NAME} ${OBJS}
	@echo "${GREEN}FT_PRINTF COMPILED ${RESET}"

clean:
	@rm -f ${OBJS}
	@make clean -C libft
	@echo "${BOLDGREEN}ALL CLEAN ! ${RESET}"

fclean:	clean
	@rm -f ${NAME}
	@rm -f libft/libft.a

re:	fclean all

.PHONY: all clean fclean re