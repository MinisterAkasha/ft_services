FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add wget libc6-compat

RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.4.linux-amd64.tar.gz
RUN tar -zxvf grafana-enterprise-7.5.4.linux-amd64.tar.gz
RUN rm grafana-enterprise-7.5.4.linux-amd64.tar.gz
COPY srcs/start.sh /

COPY srcs/Dashboards/datasource.yaml /grafana-7.5.4/conf/provisioning/datasources/
COPY srcs/Dashboards/providers.yaml /grafana-7.5.4/conf/provisioning/dashboards/
COPY srcs/Dashboards/services.json /grafana-7.5.4/conf/provisioning/dashboards/
COPY srcs/Dashboards/FTPS.json /grafana-7.5.4/conf/provisioning/dashboards/
COPY srcs/Dashboards/grafana.json /grafana-7.5.4/conf/provisioning/dashboards/
COPY srcs/Dashboards/influx.json /grafana-7.5.4/conf/provisioning/dashboards/
COPY srcs/Dashboards/mysql.json /grafana-7.5.4/conf/provisioning/dashboards/
COPY srcs/Dashboards/nginx.json /grafana-7.5.4/conf/provisioning/dashboards/
COPY srcs/Dashboards/phpMyAdmin.json /grafana-7.5.4/conf/provisioning/dashboards/
COPY srcs/Dashboards/wp.json /grafana-7.5.4/conf/provisioning/dashboards/

EXPOSE 3000

CMD ["sh", "start.sh"]