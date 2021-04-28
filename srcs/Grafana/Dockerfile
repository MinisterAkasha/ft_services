FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add wget libc6-compat

RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.4.linux-amd64.tar.gz
RUN tar -zxvf grafana-enterprise-7.5.4.linux-amd64.tar.gz
RUN rm grafana-enterprise-7.5.4.linux-amd64.tar.gz
COPY srcs/start.sh /

COPY srcs/datasource.yaml /grafana-7.5.4/conf/provisioning/datasources/
COPY srcs/providers.yaml /grafana-7.5.4/conf/provisioning/dashboards/
COPY srcs/services.json /grafana-7.5.4/conf/provisioning/dashboards/
# COPY srcs/cluster.json /grafana-7.5.4/conf/provisioning/dashboards/

EXPOSE 3000

CMD ["sh", "start.sh"]