#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
bold=`tput bold`

function install_vs_code() {
  echo "${green}${bold}Installing VS Code${reset}"
  snap install code --classic
  echo "${green}${bold}Succesfully installed VS Code `/snap/bin/code -v --user-data-dir .`${reset}"
}

function install_extensions () {
  extensions=(eamodio.gitlens Equinusocio.vsc-material-theme equinusocio.vsc-material-theme-icons ritwickdey.LiveServer esbenp.prettier-vscode ms-python.python mauve.terraform)
  for extension in "${extensions[@]}"; do
    echo ""
    echo "Installing ${extension}"
    /snap/bin/code --install-extension ${extension} --user-data-dir .
  done
  echo "${bold}${green}Succesfully installed${reset}"
  echo "${bold}${green}`/snap/bin/code --list-extensions --show-versions --user-data-dir .`${reset}"
  rm -rf logs || true
  rm -rf User || true
  rm machineid || true
}

install_vs_code
install_extensions