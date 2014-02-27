all: build run

build: openjdk
	docker build -t bnotions/kibana /vagrant/kibana
	docker build -t bnotions/elasticsearch /vagrant/elasticsearch
	docker build -t bnotions/logstash /vagrant/logstash

openjdk:
	docker build -t bnotions/openjdk-7 /vagrant/openjdk-7

run:
	docker run -d -name elasticsearch -p 9200:9200 -v /tmp/elasticsearch:/opt/elasticsearch/data bnotions/elasticsearch
	docker run -d -name logstash -p 514:514 -p 9292:9292 -p 9514:9514 -e CONFIG='https://gist.githubusercontent.com/jwmarshall/9236660/raw/logstash.conf' -v /vagrant/test/logstash/ssl:/opt/logstash/ssl -link elasticsearch:es bnotions/logstash
	docker run -d -name kibana -p 80:80 -d bnotions/kibana
