## ft_services 🌐

### This is a System Administration and Networking project on school 21 cursus
The project consists of setting up an infrastructure of different services.You will need to set up a multi-service cluster.
Each service will have to run in a dedicated container
Containers have to be build using Alpine Linux.
You will have to build yourself the images that you will use. It is forbidden to take
already build images.

You will have to set up:

- The Kubernetes web dashboard. This will help you manage your cluster.

- The Ingress Controller which manages the external access of your services. The
Ingress Controller will redirect to your Nginx container.

- A Nginx server listening on ports 80 and 443.

- A FTPS server listening on port 21.

- A WordPress website listening on port 5050, which will work with a MySQL
database. Both services have to run in separate containers. The WordPress website
will have several users and an administrator.

- Phpmyadmin, listening on port 5000 and linked with the MySQL database.

- A grafana platform, listening on port 3000, linked with an influxDB database.
Grafana will be monitoring all your containers. You must create one dashboard
per service. InfluxDB and grafana will be in two distincts containers.

- In case of a crash or stop of one of the two database containers, you will have to
make shure the data persist.

- All your containers must restart in case of a crash or stop
