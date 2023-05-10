# The name of the executable
NAME = push_swap
# Path to the directory where the executable will be stored
BINS_PATH = ./bin/
NAME = ${BINS_PATH}push_swap

# compilation and settings
CC = cc
CFLAGS = -Wall -Wextra -Werror -g3
# Linker flags : 'libft' library
LFLAGS = -lft
# Command to remove files/directories
REMOVE = rm -rf
# Command to create directories
MKDIR = mkdir -p
# path variables
SRCS_PATH =  ./srcs/
OBJS_PATH = ./objs/
LIBS_PATH = ./libs/
BINS_PATH = ./bin/
HEADER_PATH = ./include/
# Path to libraries
LIBFT_PATH = $(LIBS_PATH)libft/
# Sources files
SRCS_FILES = error_message.c \

# Object files
OBJS_FILES = $(patsubst %.c, $(OBJS_PATH)%.o, $(SRCS_FILES))
OBJS_FILES_BONUS = $(patsubst %.c, $(OBJS_PATH)%.o, $(BONUS_FILES))
OBJECTS = $(addprefix $(OBJS_PATH), $(OBJS_FILES))

# Compiler flags to include library headers
INCLUDES = -I $(LIBFT_PATH)
# Compiler flags to link to libraries
PATH_LIBS = -L$(LIBFT_PATH)

# Color codes for terminal output
DEF_COLOR = \033[0;39m
GRAY = \033[0;90m
RED = \033[0;91m
GREEN = \033[0;92m
YELLOW = \033[0;93m
BLUE = \033[0;94m
MAGENTA = \033[0;95m
CYAN = \033[0;96m
WHITE = \033[0;97m

# The default target calling for the executable
all : $(NAME)

$(NAME) : $(OBJS_FILES)
	@$(MKDIR) $(BINS_PATH)
	@make -C $(LIBFT_PATH) --no-print-directory
	@$(CC) $(CFLAGS) $(OBJS_FILES) -o $(NAME) $(SRCS_PATH)push_swap.c $(PATH_LIBS) $(LFLAGS)
	@echo "$(GREEN) ______   __  __     ______     __  __        ______     __     __     ______     ______  "
	@echo "$(GREEN)/\  == \ /\ \/\ \   /\  ___\   /\ \_\ \      /\  ___\   /\ \  _ \ \   /\  __ \   /\  == \ "
	@echo "$(GREEN)\ \  _ / \ \ \_\ \  \ \___  \  \ \  __ \     \ \___  \  \ \ \/ \.\ \  \ \  __ \  \ \  _ / "
	@echo "$(GREEN) \ \_\    \ \_____\  \/\_____\  \ \_\ \_\     \/\_____\  \ \__/\  \_\  \ \_\ \_\  \ \_\   "
	@echo "$(GREEN)  \/_/     \/_____/   \/_____/   \/_/\/_/      \/_____/   \/_/   \/_/   \/_/\/_/   \/_/   "
	@echo "$(GREEN)◞( ､ᐛ)､＿/ The Makefile of [PUSH_SWAP] has been compiled!$(DEF_COLOR)"

# Compiles C source files into object files
$(OBJS_PATH)%.o : $(SRCS_PATH)%.c
	$(MKDIR) $(OBJS_PATH)
	$(CC) $(CFLAGS) -I $(HEADER_PATH) -c $< -o $@

clean :
	@$(REMOVE) $(OBJS_PATH)
	@make clean -C $(LIBFT_PATH) --no-print-directory
	@echo "$(BLUE)[PUSH_SWAP] Object files cleaned!$(DEF_COLOR)"

fclean : clean
	@$(REMOVE) $(NAME) $(BINS_PATH) $(OBJS_PATH)
	@make fclean -C $(LIBFT_PATH) --no-print-directory
	@echo "$(BLUE)[PUSH_SWAP] Executable files and directories cleaned!$(DEF_COLOR)"

re : fclean all

.PHONY : all clean fclean re make_directory libft