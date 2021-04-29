#!/bin/bash

minikube start --vm-driver=virtualbox
minikube addons enable metallb
eval $(minikube docker-env)
kubectl apply -f srcs/config_map.yaml


docker build -t nginx_image ./srcs/nginx/
docker build -t wp_image ./srcs/wp/
docker build -t mysql_image ./srcs/mysql/
docker build -t php_my_admin_image srcs/phpMyAdmin
docker build -t grafana_image srcs/Grafana
docker build -t influx_image srcs/Influx
docker build -t ftps_image srcs/FTPS

kubectl apply -f ./srcs/nginx/srcs/nginx.yaml
kubectl apply -f ./srcs/wp/srcs/wp.yaml
kubectl apply -f ./srcs/mysql/srcs/mysql.yaml
kubectl apply -f ./srcs/phpMyAdmin/srcs/phpMyAdmin.yaml
kubectl apply -f ./srcs/Grafana/srcs/Grafana.yaml
kubectl apply -f ./srcs/Influx/srcs/Influx.yaml
kubectl apply -f ./srcs/FTPS/srcs/FTPS.yaml
