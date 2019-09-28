#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
bold=`tput bold`

function install_vs_code() {
  echo "${green}${bold}Installing VS Code${reset}"
  sudo snap install code --classic
  echo "${green}${bold}Succesfully installed `/snap/bin/code -v`${reset}"
}

function install_extensions () {
  extensions=(eamodio.gitlens Equinusocio.vsc-material-theme equinusocio.vsc-material-theme-icons ritwickdey.LiveServer esbenp.prettier-vscode ms-python.python mauve.terraform)
  for extension in "${extensions[@]}"; do
    echo ""
    echo "Installing ${extension}"
    /snap/bin/code --install-extension ${extension} --user-data-dir .
  done
  echo "${bold}${green}Succesfully installed${reset}"
  echo "${bold}${green}`/snap/bin/code --list-extensions --show-versions --user-data-dir .``"
}

install_utils