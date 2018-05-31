# Shadowsocks Setup

## Refrences

[shadowsocks-manager](https://github.com/shadowsocks/shadowsocks-manager)

## Usage

1. build, `docker build ./`

2. create a network, `docker network create --subnet=172.18.0.0/16 ssmgr`

3. start service, `/root/.ssmgr/start.sh`

4. visit http://your-server-ip, to manage
