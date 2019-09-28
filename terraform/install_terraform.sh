#!/bin/bash

function install_terraform() {
  RED='\033[0;31m'
  NC='\033[0m' # No Color
  GREEN='\033[0;32m'
  # Check if there is already a terraform file
  [[ -f ${HOME}/bin/terraform ]] && echo -e "${RED}`${HOME}/bin/terraform version` is already installed at ${HOME}/bin/terraform${NC}" && return 0
  echo -e "Installing terraform"
  # Get the latest terraform 
  LATEST_URL=$(curl -sL https://releases.hashicorp.com/terraform/index.json | jq -r '.versions[].builds[].url' | sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n | egrep -v 'rc|beta' | egrep 'linux.*amd64' |tail -1)
  curl $LATEST_URL > /tmp/terraform.zip
  mkdir -p ${HOME}/bin
  cd ${HOME}/bin
  unzip /tmp/terraform.zip
  rm /tmp/terraform.zip
  # Add terraform path to .bashrc
  if [[ -z $(grep 'export PATH=${HOME}/bin:${PATH}' ~/.bashrc) ]]; then
    echo 'export PATH=${HOME}/bin:${PATH}' >> ~/.bashrc
  fi

  echo -e "${GREEN}Installed: `${HOME}/bin/terraform version`${NC}"
}

install_terraform
