#!/bin/sh
/var/www/qycloud/deploy/supervisor
supervisord -c /etc/supervisord.conf
beanstalkd
