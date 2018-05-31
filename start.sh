#!/bin/bash

# start ss server
forever start -c "ss-manager -m aes-256-cfb -u --manager-address 127.0.0.1:4000" /root/.ssmgr/default.yml

# start ss-manager
forever start -c "ssmgr -c" /root/.ssmgr/default.yml

# start webgui
forever start -c "ssmgr -c" /root/.ssmgr/webgui.yml

# Extra line added in the script to run all command line arguments
exec "$@";
