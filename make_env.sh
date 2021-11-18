#!/bin/bash
set -eu

cat << EOT > .env
USER_ID=`id -u`
GROUP_ID=`id -g`
EOT
