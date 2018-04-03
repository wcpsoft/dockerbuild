FROM daocloud.io/wcpsoft/alpine:3.7
RUN apk add nodejs cairo freetype cairo-dev && \
    npm install -g cnpm --registry=https://registry.npm.taobao.org && \
    cnpm install -g gulp pm2 && \
    echo 'export NODE_ENV="development"' >> ~/.bashrc && source ~/.bashrc && \
    echo 'export NODE_ENV="development"' >> ~/.zshrc && source ~/.zshrc
EXPOSE 5000