# DOCKER-VERSION 0.8.1

from    ubuntu:12.04
run echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise universe' >> /etc/apt/sources.list
run apt-get -y update

# Install required packages
run apt-get -y install python-ldap python-cairo python-django python-twisted python-django-tagging python-simplejson python-memcache python-pysqlite2 python-support python-pip gunicorn supervisor nginx-light
run pip install whisper
run pip install --install-option="--prefix=/opt/graphite" --install-option="--install-lib=/opt/graphite/lib" carbon
run pip install --install-option="--prefix=/opt/graphite" --install-option="--install-lib=/opt/graphite/webapp" graphite-web

# Add system service config
add ./nginx.conf /etc/nginx/nginx.conf
add ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Add graphite config
add ./initial_data.json /opt/graphite/webapp/graphite/initial_data.json
add ./local_settings.py /opt/graphite/webapp/graphite/local_settings.py
add ./carbon.conf /opt/graphite/conf/carbon.conf
add ./storage-schemas.conf /opt/graphite/conf/storage-schemas.conf

add ./run.sh /run.sh
run chmod +x /run.sh

# Nginx
expose  80
# Carbon line receiver port
expose  2003
# Carbon pickle receiver port
expose  2004
# Carbon cache query port
expose  7002

volume ["/opt/graphite/storage"]

cmd ["/run.sh"]

# vim:ts=8:noet:
