#!/bin/bash

set -e

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
bold=`tput bold`

function install_mysql_workbench() {
  echo "${green}${bold}Installing MySQL Workbench${reset}"
  apt-get install -y mysql-workbench
  echo "${green}${bold}Succesfully installed `mysql-workbench --version`${reset}"
}

function install_pgadmin() {
  echo "${green}${bold}Installing PG Admin${reset}"
  apt-get install -y mysql-workbench
  echo "Seting up the repository"
  sh /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh
  echo "${green}${bold}Succesfully installed pgAdmin 4${reset}"
}

install_mysql_workbench
install_pgadmin