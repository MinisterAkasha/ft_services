FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add mysql mysql-client openrc

COPY ./srcs/mysql.sh /
COPY ./srcs/wordpress.sql /mnt

EXPOSE 3306
CMD ["sh", "mysql.sh"]

