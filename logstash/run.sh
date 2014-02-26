#!/bin/bash
CONFIG_URL=${CONFIG:-}
EMBEDDED="false"
LOGSTASH_CONFIG_FILE="/opt/logstash/logstash.conf"

if [ -z "$ES_PORT_9200_TCP_ADDR" ]; then
  EMBEDDED="true"
fi

if [ "$CONFIG_URL" != "" ]; then
  wget $CONFIG_URL -O $LOGSTASH_CONFIG_FILE --no-check-certificate
  if [ "$EMBEDDED" = "false" ]; then
    sed -e "s/ES_HOST/$ES_PORT_9200_TCP_ADDR/g" \
        -e "s/ES_PORT/$ES_PORT_9200_TCP_PORT/g" \
        -i $LOGSTASH_CONFIG_FILE
  fi
else
  cat << EOF > $LOGSTASH_CONFIG_FILE
input {
  syslog {
    type => syslog
    port => 514
  }
}
output {
  stdout {
    debug => true
    debug_format => "json"
  }
EOF
  if [ "$EMBEDDED" = "true" ]; then
    cat << EOF >> $LOGSTASH_CONFIG_FILE
  elasticsearch {
    embedded => $EMBEDDED
  }
}
EOF
  else
    cat << EOF >> $LOGSTASH_CONFIG_FILE
  elasticsearch_http {
    host => "$ES_PORT_9200_TCP_ADDR"
    port => $ES_PORT_9200_TCP_PORT
  }
}
EOF
  fi
fi

exec java -jar /opt/logstash/logstash.jar agent -f $LOGSTASH_CONFIG_FILE -- web
