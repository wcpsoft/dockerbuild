FROM alpine:3.7
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk update && \
    apk upgrade && \
    apk add git vim autoconf dpkg-dev dpkg file g++ \
        gcc libc-dev make pkgconf re2c curl tar xz openssl