FROM daocloud.io/wcpsoft/alpine:3.7
RUN apk add nodejs && \
    npm install -g cnpm --registry=https://registry.npm.taobao.org && \
    cnpm install -g gulp