# DOCKER-VERSION 0.8.1

from    ubuntu:12.04
run echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise universe' >> /etc/apt/sources.list
run apt-get -y update

# Install required packages
run apt-get -y install python-ldap python-cairo python-django python-twisted python-django-tagging python-simplejson python-memcache python-pysqlite2 python-support python-pip gunicorn supervisor nginx-light
run pip install whisper
run pip install --install-option="--prefix=/opt/graphite" --install-option="--install-lib=/opt/graphite/lib" carbon
run pip install --install-option="--prefix=/opt/graphite" --install-option="--install-lib=/opt/graphite/app" graphite-web

# Add system service config
add ./nginx.conf /etc/nginx/nginx.conf
add ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Add graphite config
add ./initial_data.json /opt/graphite/app/graphite/initial_data.json
add ./local_settings.py /opt/graphite/app/graphite/local_settings.py
add ./carbon.conf /opt/graphite/conf/carbon.conf
add ./storage-schemas.conf /opt/graphite/conf/storage-schemas.conf
run mkdir -p /opt/graphite/storage/whisper
run touch /opt/graphite/storage/graphite.db /opt/graphite/storage/index
run chown -R www-data /opt/graphite/storage
run chmod 0775 /opt/graphite/storage /opt/graphite/storage/whisper
run chmod 0664 /opt/graphite/storage/graphite.db
run cd /opt/graphite/app/graphite && python manage.py syncdb --noinput

# Nginx
expose  80
# Carbon line receiver port
expose  2003
# Carbon pickle receiver port
expose  2004
# Carbon cache query port
expose  7002

cmd ["/usr/bin/supervisord"]

# vim:ts=8:noet:
