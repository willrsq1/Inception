FROM debian:bullseye

#expose the port

EXPOSE 9000

#copy the scripts to the container

COPY tools/setup_wordpress.sh /tmp/setup_wordpress.sh
COPY tools/wordpress_install.sh /tmp/wordpress_install.sh
COPY tools/launching.sh /tmp/launching.sh

#make the scripts executable

RUN chmod +x /tmp/setup_wordpress.sh
RUN chmod +x /tmp/wordpress_install.sh
RUN chmod +x /tmp/launching.sh

#install packages

RUN apt upgrade && apt update #update packages
RUN apt-get install -y wget ; apt-get install -y apt-utils #install basic packages
RUN apt-get install -y php7.4 ; apt-get install -y php-fpm ; apt-get install -y php-mysql #install php
RUN apt-get install -y mariadb-client #install mysql client

#give a preconfigured php file

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

#launch the scripts and Php-fpm

ENTRYPOINT ["/tmp/launching.sh"]