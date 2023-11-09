name = inception

all:
	@printf "Launch ${name}..... \n"
	@bash srcs/requirements/wordpress/tools/mk_dir.sh
	@cd ./srcs/ && docker-compose up -d

up:
	@printf "Build ${name}..... \n"
	@bash srcs/requirements/wordpress/tools/mk_dir.sh
	@cd ./srcs/ && docker-compose up -d --build

down:
	@printf "Stop ${name}...... \n"
	@cd ./srcs/ && docker-compose down

fclean: down
	@printf "Clean ${name}....... \n"
	@docker system prune --all --force --volumes
	@docker	network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

.PHONY : all up down fclean
