# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mnegro <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/02 21:51:42 by mnegro            #+#    #+#              #
#    Updated: 2024/07/05 16:33:42 by mnegro           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

### PHONY TARGET ###
.PHONY: re cache fdown down up

### SILENT TARGET ###
.SILENT:

### VARIABLES (DEFINITION) ###
NAME = inception

#### TARGETS ####

### (EXPLICIT) RULES ###
up:
	docker compose -f srcs/docker-compose.yml up --build
	@echo "\n${GREEN}docker compose up${DEF_COLOR} executed successfully!"

down:
	docker compose -f srcs/docker-compose.yml down
	@echo "\n${GREEN}docker compose down${DEF_COLOR} executed successfully!"

fdown:
	docker compose -f srcs/docker-compose.yml down -v
	@echo "\n${GREEN}docker compose down -v${DEF_COLOR} executed successfully!"

cache:
	docker builder prune -f

re:
	docker compose -f srcs/docker-compose.yml down -v
	docker builder prune -f
	docker compose -f srcs/docker-compose.yml up --build
	@echo "\n${GREEN}re${DEF_COLOR} executed successfully!"
	

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
