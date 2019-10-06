#!/bin/bash

set -e

function install_node() {
  echo "Installing node"
  curl -sL https://deb.nodesource.com/setup_10.x > /tmp/nodesource_setup.sh
  chmod +x /tmp/nodesource_setup.sh
  /tmp/nodesource_setup.sh
  apt install -y nodejs
  echo "Succesfully installed Node `/usr/bin/node -v`"
}

install_node