# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nihal <nihal@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/12 03:12:27 by nihal             #+#    #+#              #
#    Updated: 2023/10/12 05:22:30 by nihal            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


all : up

up :  
	docker compose -f ./srcs/docker-compose.yml up --build -d
down :
	docker compose -f ./srcs/docker-compose.yml down
stop :
	docker compose -f ./srcs/docker-compose.yml stop
start :
	docker compose -f ./srcs/docker-compose.yml start
status :
	docker ps
clean :
	docker compose -f ./srcs/docker-compose.yml down -v
	sudo rm -rf /home/nbarakat/data/mariadb/* /home/nbarakat/data/wordpress/*
	docker rmi -f  nginx mariadb wordpress
	
re : clean all
	
	