#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
bold=`tput bold`

function install_docker() {
  echo -e "${green}${bold}Installing Docker${reset}"
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
  apt-cache policy docker-ce
  apt install docker-ce
  usermod -aG docker ${USER}  
  echo -e "${green}${bold}Succesfully installed `/usr/bin/docker -v`${reset}"
}
echo ${USER}
install_docker