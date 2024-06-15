#!/bin/bash

set -e

error_handler() {
  echo
  echo "Error on line ${BASH_LINENO[0]}"
  exit 1
}

trap 'error_handler' ERR


apt update
apt upgrade -y

apt install curl wget sudo git -y
