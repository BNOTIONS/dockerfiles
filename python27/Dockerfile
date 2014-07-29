# DOCKER-VERSION 1.0.0
# DOCKER-BUILD: docker build -t bnotions/python27
# DOCKER-TEST docker run -i -t bnotions/python27:latest /bin/bash

FROM ubuntu:12.04

RUN apt-get update
RUN apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install python2.7 python2.7-dev python-setuptools python-pip python-software-properties libssl-dev zlib1g-dev build-essential
RUN apt-get clean

ADD files/pip.conf /.pip/pip.conf
