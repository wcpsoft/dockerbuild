FROM daocloud.io/wcpsoft/alpine:3.7
MAINTAINER admin@wcpsoft.cn
RUN mkdir -p /usr/local/jvm
WORKDIR /usr/local/jvm
ADD soft/jdk-7u80-linux-x64.tar.gz /usr/local/jvm
RUN mv jdk1.7.0_80 jdk-7u80
ENV JAVA_HOME /usr/local/jvm/jdk-7u80
ENV JRE_HOME $JAVA_HOME/jre
ENV JAVA_BIN $JAVA_HOME/bin
ENV JAVA_LIB $JAVA_HOME/lib
ENV CLASSPATH .:$JAVA_LIB/tools.jar:$JAVA_LIB/dt.jar:$CLASSPATH
ENV PATH $JAVA_BIN:$PATH
