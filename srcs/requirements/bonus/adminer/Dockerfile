FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y adminer

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/usr/share/adminer/"]

#http://localhost:8081/adminer.php
# MYSQL / mariadb (MYSQL_HOSTNQME) / my_user (MYSQL_USER) / will1234 (MYSQL_PASSWORD) / wordpress (MYSQL_DATABASE)