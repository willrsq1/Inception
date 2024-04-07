all: up

up:
	mkdir -p $(HOME)/data/mariadb
	mkdir -p $(HOME)/data/wordpress
	mkdir -p $(HOME)/data/website
	docker-compose -f ./srcs/docker-compose.yml up -d --build
down:
	docker-compose -f ./srcs/docker-compose.yml  down
logs:
	docker logs wordpress; docker logs mariadb; docker logs nginx
fclean:
	docker stop `docker ps -qa`; docker rm `docker ps -aq`; \
		docker rmi -f `docker images -qa`;docker volume rm `docker volume ls -q`; \
		docker network rm `docker network ls -q`; echo "DONE";
	rm -rf $(HOME)/wruet-su/data/mariadb
	rm -rf $(HOME)/wruet-su/data/wordpress
	rm -rf $(HOME)/wruet-su/data/website
mysql:
	docker exec -it mariadb mysql -u root -p
re: down fclean up

.PHONY: up down logs fclean mysql re
