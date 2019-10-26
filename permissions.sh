#!/bin/bash

set -e

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
bold=`tput bold`

if [[ $EUID -eq 0 ]]; then
  echo -e "${red}${bold}REMEMBER to run this script as your own user, not root${reset}"
	exit 1
fi

chsh -s $(which zsh)
su - ${USER}