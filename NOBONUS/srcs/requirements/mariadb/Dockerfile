FROM debian:bullseye

#expose the port

EXPOSE 3306

#copy the script to the container

COPY tools/setup_database.sh /tmp/setup_database.sh

#make the script executable

RUN chmod +x /tmp/setup_database.sh

#install packages

RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y

#give a preconfigured configuration file

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#launch the script

ENTRYPOINT [ "/tmp/setup_database.sh" ]
