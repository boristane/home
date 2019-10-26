#!/bin/bash

set -e

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
bold=`tput bold`

function install_vim() {
  echo "${green}${bold}Installing vim${reset}"
  apt-get install -y vim
  if [[ -z $(grep 'export VISUAL=vim'  ${HOME}/.bashrc) ]]; then
    echo 'export VISUAL=vim' >> ${HOME}/.bashrc
  fi
  if [[ -z $(grep 'export EDITOR=$VISUAL'  ${HOME}/.bashrc) ]]; then
    echo 'export EDITOR=$VISUAL' >> ${HOME}/.bashrc
  fi
  echo "${green}${bold}Succesfully installed vim${reset}"
}

install_vim