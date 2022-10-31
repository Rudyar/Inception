all :
	mkdir -p /home/${USER}/data/wordpress /home/${USER}/data/mariadb
	docker compose -f srcs/docker-compose.yml up --build

up :
		docker compose -f srcs/docker-compose.yml up

down :
		docker compose -f srcs/docker-compose.yml down

clean :	down
		docker system prune -af --volumes
		docker volume rm $$(docker volume ls -q)

fclean : clean
		sudo rm -rf /home/${USER}/data

re : fclean all

ls :
	docker image ls -a
	@echo "------------------\n"
	docker container ls
	@echo "------------------\n"
	docker volume ls -q
	@echo "------------------\n"
	docker network ls

.PHONY:	all down clean fclean re
