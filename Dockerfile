FROM ubuntu:18.04

MAINTAINER LuoWei <luowei---010101@163.com>

# install necessary tools
RUN apt-get update
RUN apt-get install -y curl wget net-tools git-core shadowsocks-libev

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 8.9.4

# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

# install node and npm
RUN . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm installation
# RUN node -v
# RUN npm -v

# install forever
RUN npm i -g forever

# install shadowsocks-manager
RUN npm i -g shadowsocks-manager

# copy ssmgr config files
COPY .ssmgr /root/.ssmgr

# copy start command
COPY start.sh /root/.ssmgr/

CMD /root/.ssmgr/start.sh
