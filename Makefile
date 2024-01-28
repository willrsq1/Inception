all: up

up:
	sudo mkdir -p /home/wruet-su/data/mariadb
	sudo mkdir -p /home/wruet-su/data/wordpress
	sudo mkdir -p /home/wruet-su/data/website
	docker-compose -f ./srcs/docker-compose.yml up -d --build
down:
	docker-compose -f ./srcs/docker-compose.yml  down
logs:
	docker logs wordpress; docker logs mariadb; docker logs nginx
fclean:
	docker stop `docker ps -qa`;docker stop `docker ps -aq`;docker rm `docker ps -aq`; \
		docker rmi -f `docker images -qa`;docker volume rm `docker volume ls -q`; \
		docker network rm `docker network ls -q`; echo "DONE";
	sudo rm -rf /home/wruet-su/data/mariadb
	sudo rm -rf /home/wruet-su/data/wordpress
	sudo rm -rf /home/wruet-su/data/website
mysql:
	docker exec -it mariadb mysql -u root -p
re: down fclean up

.PHONY: up down logs fclean mysql re