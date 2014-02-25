# DOCKER-VERISON 0.8.1

from ubuntu:12.04
run apt-get update
run apt-get -y install wget nginx-light

run echo 'daemon off;' >> /etc/nginx/nginx.conf

run cd /tmp && wget http://download.elasticsearch.org/kibana/kibana/kibana-3.0.0milestone5.tar.gz -O - | tar xzvf -
run cp -R /tmp/kibana-3.0.0milestone5/* /usr/share/nginx/www

expose 80

cmd /usr/sbin/nginx
