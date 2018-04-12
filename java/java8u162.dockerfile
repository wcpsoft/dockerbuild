FROM daocloud.io/wcpsoft/alpine:3.7
MAINTAINER admin@wcpsoft.cn
RUN mkdir -p /usr/local/jvm
WORKDIR /usr/local/jvm
ADD soft/jdk-8u162-linux-x64.tar.gz /usr/local/jvm
COPY soft/glibc-2.27-r0.apk  /usr/local/jvm/glibc-2.27-r0.apk
COPY soft/glibc-dev-2.27-r0.apk /usr/local/jvm/glibc-dev-2.27-r0.apk
COPY soft/glibc-bin-2.27-r0.apk /usr/local/jvm/glibc-bin-2.27-r0.apk
COPY soft/glibc-i18n-2.27-r0.apk /usr/local/jvm/glibc-i18n-2.27-r0.apk
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub \
        https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub && \
    apk add /usr/local/jvm/glibc-2.27-r0.apk && \
    apk add /usr/local/jvm/glibc-dev-2.27-r0.apk && \
    mv jdk1.8.0_162 jdk-8u162
ENV JAVA_HOME /usr/local/jvm/jdk-8u162
ENV JRE_HOME $JAVA_HOME/jre
ENV JAVA_BIN $JAVA_HOME/bin
ENV JAVA_LIB $JAVA_HOME/lib
ENV CLASSPATH .:$JAVA_LIB/tools.jar:$JAVA_LIB/dt.jar:$CLASSPATH
ENV PATH $JAVA_BIN:$PATH
