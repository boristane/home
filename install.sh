#!/bin/bash

set -e

RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'

if [[ $EUID -ne 0 ]]; then
	echo -e "${RED}REMEMBER to run this script as root with sudo${NC}"
	exit 1
fi

export ROOTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $ROOTDIR
echo -e "${GREEN} Updating the package repository${NC}"
apt-get update

for directory in ./*/ ; do
  cd ${directory}
  for file in * ; do
    echo ""
    echo -e "##### excecuting: ${file} #####"
    "./${file}"
  done
  cd $ROOTDIR
done

source ~/.bashrc
su - ${USER}

echo -e "${GREEN}ALL DONE"