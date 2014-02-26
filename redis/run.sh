#!/bin/bash

if [ -f /.redis_password_set ]; then
  echo 'Redis password already set!'
else
  if [ -z "$REDIS_PASS" ]; then
    echo 'No REDIS_PASS environment variable. A password will not be set!'
  else
    echo 'Setting redis requirepass from environment variable'
    sed -ri "s/^# requirepass .*/requirepass \"$REDIS_PASS\"/" /etc/redis/redis.conf
    touch /.redis_password_set 
  fi
fi

exec /usr/bin/redis-server /etc/redis/redis.conf
