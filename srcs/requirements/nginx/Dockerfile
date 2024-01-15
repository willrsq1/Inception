FROM alpine:3.18.0

RUN apk update && apk upgrade 
RUN apk add nginx
RUN apk add openssl
RUN mkdir -p /my_container/SSL
RUN openssl req -x509 -nodes -out /my_container/SSL/my_certificate.crt -keyout /my_container/SSL/my_key.key  -subj "/C=FR/ST=RH/L=Lyon/O=42/OU=42/CN=wruet-su.42.fr/UID=will"
COPY ./conf/nginx.conf etc/nginx/nginx.conf 
EXPOSE 443
CMD [ "nginx", "-g", "daemon off;"]
