#!/bin/bash

set -e

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
bold=`tput bold`

function install_go() {
  echo "${green}${bold}Installing Go${reset}"
  snap install go --classic
  echo "${green}${bold}Succesfully installed `go version`${reset}"
}

install_go