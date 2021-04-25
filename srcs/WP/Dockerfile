FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add wget nginx php7 supervisor php7-fpm php7-session php7-iconv php7-json php7-gd \
				php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
				php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN mkdir /run/nginx/

COPY /srcs/supervisord.conf /etc/supervisord.conf
COPY /srcs/default.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/
RUN wget https://wordpress.org/wordpress-5.7.1.tar.gz
RUN tar -xvzf wordpress-5.7.1.tar.gz && rm -r wordpress-5.7.1.tar.gz
COPY /srcs/wp-config.php ./wordpress
WORKDIR /

EXPOSE 5050

CMD ["/usr/bin/supervisord"]
