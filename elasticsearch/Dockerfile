# DOCKER-VERSION 0.8.1

#from ubuntu:12.04
from bnotions/openjdk-7
run apt-get update

run apt-get -y install openjdk-7-jre-headless wget && apt-get clean
run cd /opt && wget -q https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.0.0.tar.gz -O - | tar xzvf -
run mv /opt/elasticsearch-1.0.0 /opt/elasticsearch && mkdir /opt/elasticsearch/data

# Prevent elasticsearch calling `ulimit`.
#run sed -i 's/MAX_OPEN_FILES=/# MAX_OPEN_FILES=/g' /etc/init.d/elasticsearch

expose 9200
expose 9300

volume ["/opt/elasticsearch/data"]

cmd /opt/elasticsearch/bin/elasticsearch
