#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
bold=`tput bold`

function install_utils () {
  utils=(curl apt-transport-https ca-certificates software-properties-common git python3-pip)
  for util in "${utils[@]}"; do
    echo ""
    echo "${bold}${green}Installing ${util}${reset}"
    apt-get install -y ${util}
    echo "${bold}${green}Succesfully installed ${util}${reset}"
  done
}

install_utils