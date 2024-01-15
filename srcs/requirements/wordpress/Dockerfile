FROM debian:bullseye

RUN apt upgrade && apt update
RUN apt-get install -y wget
RUN apt-get install -y apt-utils
RUN apt-get install -y php7.4
RUN apt-get install -y php-fpm
RUN apt-get install -y php-mysql
RUN apt-get install -y mariadb-client
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY tools/wordpress.sh /tmp
RUN chmod +x /tmp/wordpress.sh
EXPOSE 9000
CMD ["sh", "/tmp/wordpress.sh"]