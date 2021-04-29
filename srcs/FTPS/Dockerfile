FROM alpine:3.12

RUN apk update && apk upgrade 
RUN apk add vsftpd openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ftps.key -out /etc/ssl/certs/ftps.crt -subj "/C=RU/ST=Russia/L=Kazan/O=21/OU=21School/CN=akasha"

COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN sed -i 's,\r,,;s, *$,,' /etc/vsftpd/vsftpd.conf
RUN mkdir -p /var/empty

RUN { echo "userpass"; echo "userpass"; } | adduser user

EXPOSE 21 22000

RUN chmod +x /etc/vsftpd/vsftpd.conf

COPY ./srcs/start.sh /

CMD ["sh", "start.sh"]
