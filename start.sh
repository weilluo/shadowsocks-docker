#!/bin/bash

# start ss server
forever start -c "ss-manager" /root/.ssmgr/default.yml "-m aes-256-cfb -u --manager-address 127.0.0.1:4000"

# start ss-manager
forever start -c "ssmgr -c" /root/.ssmgr/default.yml

# start webgui
forever start -c "ssmgr -c" /root/.ssmgr/webgui.yml
