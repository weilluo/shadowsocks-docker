# Shadowsocks Setup

## Refrences

[shadowsocks-manager](https://github.com/shadowsocks/shadowsocks-manager)

## Usage

1. build, `docker build ./ -t ssmgr:latest`

2. run docker, `docker run -p 80:3000 -itd ssmgr:latest /bin/bash`

3. visit http://your-server-ip, to manage
