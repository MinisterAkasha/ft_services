FROM alpine:3.12

RUN apk update && apk upgrade 
RUN apk add vsftpd openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/services.key -out /etc/ssl/certs/services.crt -subj "/C=RU/ST=Russia/L=Kazan/O=21/OU=21School/CN=akasha"

COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN adduser user ; echo "user: 123"
# RUN echo "user" >> /etc/vsftpd/vsftpd.userlist

EXPOSE 21
CMD ["vsftpd"]