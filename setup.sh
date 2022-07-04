echo "            __ _                           _                             "
echo "           / _| |_     ___  ___ _ ____   _(_) ___ ___  ___               "
echo "          | |_| __|   / __|/ _ \\ '__\\ \\ / / |/ __/ _ \\/ __|          "
echo "          |  _| |_    \\__ \\  __/ |   \\ V /| | (_|  __/\\__ \\         "
echo "          |_|  \\__|___|___/\\___|_|    \\_/ |_|\\___\\___||___/         "
echo "                 |_____|                                                "
echo "========================================================================="
echo "                        Pojet realiser par jelarose                      "


echo "configuration de la VM..."
sudo chown user42:user42 /var/run/docker.sock
echo "demarage de minikube..."
minikube delete
minikube start --vm-driver=docker
sleep 10
eval $(minikube docker-env)
echo "configuration..."
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml > /dev/null
minikube addons enable dashboard
minikube addons enable metallb
minikube addons enable metrics-server
kubectl apply -f srcs/config/configmap.yml
sed -i -e "s/MINIKUBE_IP/$(minikube ip)/g" srcs/influxdb/srcs/telegraf.conf
echo "build de mysql..."
docker build -t jelarose/mysql srcs/mysql > /dev/null
echo "build de wordpress..."
docker build -t jelarose/wordpress srcs/wordpress > /dev/null
echo "build de phpMyAdmin..."
docker build -t jelarose/phpmyadmin srcs/phpmyadmin > /dev/null
echo "build de ingluxDB..."
docker build -t jelarose/influxdb srcs/influxdb > /dev/null
echo "build de grafana..."
docker build -t jelarose/grafana srcs/grafana > /dev/null
echo "build de ftps..."
docker build -t jelarose/ftps srcs/ftps > /dev/null
echo "build de nginx..."
docker build -t jelarose/nginx srcs/nginx > /dev/null
echo "configuration de mysql..."
kubectl apply -f srcs/mysql/srcs/mysql.yml > /dev/null
echo "configuration de wordpress..."
kubectl apply -f srcs/wordpress/srcs/wordpress.yml > /dev/null
echo "configuration de phpMyAdmin..."
kubectl apply -f srcs/phpmyadmin/srcs/phpmyadmin.yml > /dev/null
echo "configuration de ingfluxDB..."
kubectl apply -f srcs/influxdb/srcs/influxdb.yml > /dev/null
echo "configuration de grafana..."
kubectl apply -f srcs/grafana/srcs/grafana.yml > /dev/null
echo "configuration de ftps..."
kubectl apply -f srcs/ftps/srcs/ftps.yml > /dev/null
echo "configuration de nginx..."
kubectl apply -f srcs/nginx/srcs/nginx.yml > /dev/null
echo ":::::_FT_SERVICE_PRET_:::::"
echo "Rends toi sur le serveur nginx pour commencer   http://172.17.0.6  "
