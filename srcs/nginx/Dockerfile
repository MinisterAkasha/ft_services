FROM alpine:3.12

RUN apk update && apk upgrade

RUN apk add nginx openssl

RUN mkdir /run/nginx/
COPY /srcs/index.html /var/www/html/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/services.key -out /etc/ssl/certs/services.crt -subj "/C=RU/ST=Russia/L=Kazan/O=21/OU=21School/CN=akasha"

COPY /srcs/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443
CMD nginx -g 'daemon off;'

