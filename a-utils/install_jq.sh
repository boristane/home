#!/bin/bash

function install_jq() {
  echo "Installing jq"
  snap install jq
  echo "jq `jq --version` i=succesfully installed"
}

install_jq