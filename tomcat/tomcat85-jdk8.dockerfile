FROM daocloud.io/wcpsoft/java:8u162
MAINTAINER admin@wcpsoft.cn
ADD soft/jstatd.all.policy /usr/local/jvm/jdk-8u162/bin
RUN mkdir -p /usr/local/tomcat
WORKDIR /usr/local/tomcat
ADD soft/apache-tomcat-8.5.29 /usr/local/tomcat
EXPOSE 8080
CMD ["bin/catalina.sh", "run"]
