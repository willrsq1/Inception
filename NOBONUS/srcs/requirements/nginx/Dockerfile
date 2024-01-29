FROM debian:bullseye

# Expose the port

EXPOSE 443

# Install packages

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nginx
RUN apt-get install -y openssl

# Give a preconfigured configuration file

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Create a repository to contain the SSL certificate and the key

RUN mkdir /container_ssl

# Generate the SSL certificate and the key

RUN openssl req -x509 -nodes -out /container_ssl/my_certificate.crt \
    -keyout /container_ssl/my_key.key  \
    -subj "/C=FR/ST=ARA/L=Lyon/O=42/OU=42/CN=wruet-su.42.fr/UID=will"

# Launch Nginx

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
