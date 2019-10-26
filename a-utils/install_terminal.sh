#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
bold=`tput bold`

export CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $CURRENT_DIR

function install_terminator() {
  echo "${green}${bold}Installing terminator${reset}"
  apt-get install -y terminator
  echo "${green}${bold}Succesfully installed `/usr/bin/terminator -v`${reset}"
}

function install_zsh() {
  echo "${green}${bold}Installing zsh${reset}"
  apt install -y zsh
  # Prevents zsh terminals to share a common history when pressing the up and down buttons
  setopt no_share_history
  echo "${green}${bold}Succesfully installed `zsh --version`${reset}"
}

function install_powerline_fonts() {
  echo "${green}${bold}Installing powerline fonts${reset}"
  apt-get -y install powerline fonts-powerline
  echo "${green}${bold}Succesfully installed powerline fonts${reset}"
}

function install_spaceship() {
  echo "${green}${bold}Installing spaceship prompt${reset}"
  if [[ ! -d ${HOME}/.oh-my-zsh ]]; then 
    git clone https://github.com/robbyrussell/oh-my-zsh.git ${HOME}/.oh-my-zsh
  fi
  if [[ ! -d ${HOME}/.oh-my-zsh/custom/themes/spaceship-prompt ]]; then
    git clone https://github.com/denysdovhan/spaceship-prompt.git "${HOME}/.oh-my-zsh/custom/themes/spaceship-prompt"
  fi
  ln -s "${HOME}/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "${HOME}/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
  ln -s "${HOME}/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "${HOME}/.oh-my-zsh/themes/spaceship.zsh-theme"
  cp ${CURRENT_DIR}/.zshrc ${HOME}/.zshrc
  echo "${green}${bold}Succesfully installed spaceship prompt${reset}"
}

install_terminator
echo ""
install_zsh
echo ""
install_powerline_fonts
echo ""
install_spaceship
