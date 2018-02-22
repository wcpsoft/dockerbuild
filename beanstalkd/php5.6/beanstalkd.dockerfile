FROM daocloud.io/wcpsoft/php:5.6customcli
RUN apk add beanstalkd supervisor sudo && \
    sed -e 's/ADDR="127.0.0.1"/ADDR="0.0.0.0"/' -i /etc/conf.d/beanstalkd && \
    echo "BEANSTALKD_EXTRA=”-z 524280”" >> /etc/conf.d/beanstalkd  && \
    echo "START=yes"  >> /etc/conf.d/beanstalkd && \
    sed -e 's/\/etc\/supervisor.d\/\*.ini/\/etc\/supervisor\/conf.d\/\*.conf/' -i /etc/supervisord.conf && \
    mkdir -p /etc/supervisor/conf.d
WORKDIR /etc/
ADD exec.sh exec.sh
RUN chmod -R 777 exec.sh
VOLUME ["/data"]
EXPOSE 11300
CMD ["sh", "exec.sh"]