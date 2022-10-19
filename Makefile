all :
	mkdir -p /home/${USER}/data/wordpress /home/${USER}/data/mariadb
	docker compose -f srcs/docker-compose.yml up --build

down :
		docker compose -f srcs/docker-compose.yml down

clean :	down
		docker system prune -af

fclean : clean
	docker volume rm $$(docker volume ls -q)
	sudo rm -rf /home/${USER}/data

re : fclean all

ls :
	docker image ls -a
	@echo "------------------\n"
	docker container ls
	@echo "------------------\n"
	docker volume ls -q

.PHONY:	all down clean fclean re
