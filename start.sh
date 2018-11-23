#!/bin/bash

# start ss server
forever start -c "ss-manager -m aes-256-cfb -u --manager-address 127.0.0.1:4000" ~/.ssmgr/default.yml

# start ss-manager
forever start -c "ssmgr -c" ~/.ssmgr/default.yml

# start webgui
forever start -c "ssmgr -c" ~/.ssmgr/webgui.yml

# Extra line added in the script to run all command line arguments
exec "$@";
