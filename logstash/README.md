Logstash
===

Open source log management

Ports
---

* `514` - syslog input
* `9200` - elasticsearch http
* `9292` - logstash webui
* `9514` - lumberjack input

Volumes
---

* `/opt/logstash/ssl` - location of lumberjack certificates (lumberjack.crt & lumberjack.key)
* `/opt/logstash/data` - location of elasticsearch data files when using embedded elasticsearch

Build
---

* `docker build -rm -t bnotions/logstash .`

Run
---

* Default docker run example:
	`docker run -d bnotions/logstash`

* Publish all ports from container (docker will handle port mapping)
	`docker run -P -d bnotions/logstash`

* Mount host volume to store embedded elasticsearch data files
	`docker run -P -d -v /opt/elasticsearch/data:/opt/logstash/data bnotions/logstash`

* Custom logstash config with host volume containing lumberjack certificates
	`docker run -P -d -e CONFIG="https://gist.githubusercontent.com/jwmarshall/9236660/raw/8ffa943f7f95ded12195fcecd157e074c5be06af/logstash.conf" -v /etc/ssl/lumberjack:/opt/logstash/ssl bnotions/logstash`

* Link to a seperate docker container running elasticsearch (assuming the name of the container is 'elasticsearch', alias must be 'es')
	`docker run -P -d -e CONFIG="https://gist.githubusercontent.com/jwmarshall/9236660/raw/8ffa943f7f95ded12195fcecd157e074c5be06af/logstash.conf" -v /etc/ssl/lumberjack:/opt/logstash/ssl -link elasticsearch:es bnotions/logstash`
