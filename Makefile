# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mnegro <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/02 21:51:42 by mnegro            #+#    #+#              #
#    Updated: 2024/07/09 16:22:32 by mnegro           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

### PHONY TARGET ###
.PHONY: re cache fdown down up

### SILENT TARGET ###
.SILENT:

### VARIABLES (DEFINITION) ###
NAME = inception

DIR = ./srcs/docker-compose.yml

#### TARGETS ####

### (EXPLICIT) RULES ###
all: build up

build:
	@echo "\n${YELLOW}Building images...${DEF_COLOR}"
	docker compose -f ${DIR} build
	@echo "\n${GREEN}build${DEF_COLOR} complete!"

up:
	@echo "\n${YELLOW}Composing up...${DEF_COLOR}"
	@docker compose -f ${DIR} up

down:
	@echo "\n${YELLOW}Composing down...${DEF_COLOR}"
	docker compose -f ${DIR} down
	@echo "\n${GREEN}docker compose down${DEF_COLOR} complete!"

clean:
	@echo "\n${YELLOW}Cleaning configs...${DEF_COLOR}"
	docker system prune -a
	@echo "\n${GREEN}docker system prune -a${DEF_COLOR} complete!"

fclean:
	@echo "\n${YELLOW}Total clean...${DEF_COLOR}"
	
	@echo "\n${GREEN}${DEF_COLOR} complete!"

re: clean all
	@echo "${YELLOW}Rebuilding...${DEF_COLOR}"
	@echo "\n${GREEN}re${DEF_COLOR} complete!"
	
### (BRIGHT) COLORS ###
DEF_COLOR = \033[0;39m
BLACK = \033[1;90m
RED = \033[1;91m
GREEN = \033[1;92m
YELLOW = \033[1;93m
BLUE = \033[1;94m
MAGENTA = \033[1;95m
CYAN = \033[1;96m
WHITE = \033[1;97m
