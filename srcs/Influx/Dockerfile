FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add wget libc6-compat influxdb supervisor

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.18.1_linux_amd64.tar.gz
RUN tar -zxvf telegraf-1.18.1_linux_amd64.tar.gz && rm telegraf-1.18.1_linux_amd64.tar.gz 

RUN mkdir -p /etc/telegraf/
RUN mkdir -p /etc/influxdb/

RUN telegraf-1.18.1/usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

COPY /srcs/supervisord.conf /etc/supervisord.conf

EXPOSE 8086
CMD ["/usr/bin/supervisord"]