#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
bold=`tput bold`

function install_aws_cli() {
  echo "${bold}${green}Installing AWS CLI${reset}"
  pip3 install --upgrade --user awscli
  # Add AWS path to .bashrc
  if [[ -z $(grep 'export PATH=${HOME}/.local/bin:${PATH}' ${HOME}/.bashrc) ]]; then
    echo 'export PATH=${HOME}/.local/bin:${PATH}' >> ${HOME}/.bashrc
  fi
  echo "${bold}${green}Succesfully Installed `${HOME}/.local/bin/aws --version`${reset}"
}

function install_awslogs() {
  echo "${bold}${green}Installing awslogs${reset}"
  pip3 install awslogs
}

install_aws_cli
install_awslogs