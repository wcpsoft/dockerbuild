FROM daocloud.io/wcpsoft/java:7u80
MAINTAINER admin@wcpsoft.cn
ADD soft/jstatd.all.policy /usr/local/jvm/jdk-7u80/bin
RUN mkdir -p /usr/local/tomcat
WORKDIR /usr/local/tomcat
ADD soft/apache-tomcat-7.0.84 /usr/local/tomcat
EXPOSE 8080
CMD ["bin/catalina.sh", "run"]
