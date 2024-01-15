FROM debian:bullseye
RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y
COPY conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chown mysql:mysql etc/mysql
COPY tools/mariadb.sh /mariadb.sh
EXPOSE 3306
RUN chmod +x /mariadb.sh
ENTRYPOINT [ "/mariadb.sh" ]
