#!/bin/bash

set -e

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
bold=`tput bold`

function install_docker_compose() {
  echo -e "${green}${bold}Installing Docker Compose${reset}"
  version=1.24.0
  curl -L https://github.com/docker/compose/releases/download/${version}/docker-compose-`uname -s`-`uname -m` -o /usr/bin/docker-compose
  chmod +x /usr/bin/docker-compose
  echo -e "${green}${bold}Succesfully installed `/usr/bin/docker-compose -v`${reset}"
}

install_docker_compose