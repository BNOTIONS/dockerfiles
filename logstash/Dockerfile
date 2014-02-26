# DOCKER-VERSION 0.8.1

from bnotions/openjdk-7

run apt-get update
run apt-get install -y wget
run mkdir /opt/logstash && wget -q https://download.elasticsearch.org/logstash/logstash/logstash-1.3.3-flatjar.jar -O /opt/logstash/logstash.jar

add run.sh /run.sh
run chmod +x /run.sh

expose 514
expose 9200
expose 9292
expose 9514

volume ["/opt/logstash/ssl","/opt/logstash/data"]

cmd /run.sh
