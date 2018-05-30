# Shadowsocks Setup

## Refrences

[shadowsocks-manager](https://github.com/shadowsocks/shadowsocks-manager)

## Usage

1. build, `docker build ./`

2. create a network, `docker network create --subnet=172.18.0.0/16 ssmgr`

3. start shadowsocks

```bash
docker run --net ssmgr --ip 172.18.0.22 -it ssmgr:latest \
    sh -c "ss-manager -m aes-256-cfb -u --manager-address 172.18.0.22:4000"
```

4. start shadowsocks-manage

```bash
docker run --net ssmgr --ip 172.18.0.23 -it ssmgr:latest \
    sh -c "ssmgr"
```

5. start shadowsocks-manage webgui

```bash
docker run --net ssmgr --ip 172.18.0.24 -it ssmgr:latest \
    sh -c "ssmgr -c /root/.ssmgr/webgui.yml" 80:3000
```

6. visit http://your-server-ip, to manage
