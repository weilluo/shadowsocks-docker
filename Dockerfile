FROM ubuntu:18.04

MAINTAINER LuoWei <luowei---010101@163.com>

# install necessary tools
RUN apt-get update
RUN apt-get install -y curl wget iputils-ping net-tools git-core shadowsocks-libev redis-server

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 10.19.0

# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# install node and npm
RUN . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm installation
RUN node -v
RUN npm -v

# install forever
RUN npm i -g forever

# install shadowsocks-manager
# You may need to use the --unsafe-perm flag if you receive an permission error
RUN npm i -g shadowsocks-manager --unsafe-perm

# copy redis-config file
COPY redis.config.rewrite /etc/redis/redis.config

# 重启redis
RUN systemctl restart redis.service

# copy ssmgr config files
COPY .ssmgr /root/.ssmgr

# copy start command
COPY start.sh /root/.ssmgr/

EXPOSE 3000:3000 4001:4001 50000-60000:50000-60000

ENTRYPOINT ["/root/.ssmgr/start.sh"]
