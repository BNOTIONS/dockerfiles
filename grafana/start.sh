set -e

if [ "x${ELASTICSEARCH}" == x ]; then
    echo "ELASTICSEARCH unset" >&2
    exit 1
fi
if [ "x${GRAPHITE}" == x ]; then
    echo "GRAPHITE unset" >&2
    exit 1
fi

perl -p -i -e 's/\$\{([^}]+)\}/defined $ENV{$1} ? $ENV{$1} : $&/eg' < /opt/config.template.js > /opt/grafana/config.js

exec /usr/sbin/nginx
