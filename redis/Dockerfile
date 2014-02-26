# DOCKER-VERSION 0.8.1

from ubuntu:12.04

run apt-get update
run apt-get install -y software-properties-common python-software-properties
run add-apt-repository -y ppa:chris-lea/redis-server
run apt-get update
run apt-get install -y redis-server

run sed -ri 's/^daemonize yes/# daemonize yes/' /etc/redis/redis.conf
run sed -ri 's/^logfile (.*)/# logfile \1/' /etc/redis/redis.conf
run echo 'vm.overcommit_memory = 1' >> /etc/sysctl.conf
run sysctl vm.overcommit_memory=1

add run.sh /run.sh
run chmod 755 /run.sh

expose 6379

cmd /run.sh
