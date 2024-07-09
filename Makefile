# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mnegro <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/02 21:51:42 by mnegro            #+#    #+#              #
#    Updated: 2024/07/10 00:55:44 by mnegro           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

### PHONY TARGET ###
.PHONY: eval-prep re fclean clean down up build all

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
	@echo "\n${YELLOW}Cleaning volumes...${DEF_COLOR}"
	docker compose -f ${DIR} down -v
	docker builder prune -af
	rm -rf /Users/marzianegro/Desktop/data/wp_data/*
	rm -rf /Users/marzianegro/Desktop/data/db_data/*
# rm -rf /home/mnegro/data/wp_data/*
# rm -rf /home/mnegro/data/db_data/*
	@echo "\n${GREEN}docker volume prune${DEF_COLOR} complete!"

fclean: clean
	@echo "\n${YELLOW}Cleaning configs...${DEF_COLOR}"
	docker system prune -a
	@echo "\n${GREEN}docker system prune -a${DEF_COLOR} complete!"

re: clean all
	@echo "${YELLOW}Rebuilding...${DEF_COLOR}"
	@echo "\n${GREEN}re${DEF_COLOR} complete!"

eval-prep:
	@echo "${YELLOW}Prepping for evaluation...${DEF_COLOR}"
	docker stop $$(docker ps -qa); \
	docker rm $$(docker ps -qa); \
	docker rmi -f $$(docker images -qa); \
	docker volume rm $$(docker volume ls -q); \
	docker network rm $$(docker network ls -q) 2>/dev/null
	@echo "\n${GREEN}eval-prep${DEF_COLOR} complete!"

	
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
