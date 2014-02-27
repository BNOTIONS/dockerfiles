Grafana
===

[Grafana](http://grafana.org/) is an alternative interface for
Graphite. It is based on Kibana and stores saved dashboards in
Elasticearch.


Ports
---

* `80` - nginx proxy to grafana


Building
---

* Default docker build example:

	`docker build -rm -t bnotions/grafana .`


Running
---

* Default docker run example:

    `docker run -P -e ELASTICSEARCH='http://localhost:49197' -e GRAPHITE='http://localhost:49196' -d bnotions/grafana`
