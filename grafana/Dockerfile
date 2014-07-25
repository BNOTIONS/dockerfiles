# DOCKER-VERSION 0.8.1

from    ubuntu:12.04
#run echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise universe' >> /etc/apt/sources.list
run apt-get -y update

# Install required packages
run apt-get -y install curl nginx-light
run mkdir -p /opt/grafana && cd /opt/grafana && curl -L 'http://github.com/torkelo/grafana/releases/download/v1.4.0/grafana-1.4.0.tar.gz' | tar xz

# Add system service config
add ./nginx.conf /etc/nginx/nginx.conf

# Add Grafana config and startup script
add ./config.template.js /opt/config.template.js
add ./start.sh /opt/start.sh

run chown -R www-data:www-data /opt

# Nginx
expose  80

cmd ["/bin/bash", "/opt/start.sh"]

# vim:ts=8:noet:
