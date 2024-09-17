#!/bin/bash

#default socket path
SOCKET_PATH=${1:-"$HOME/cardano/testnet/db/socket"}

# Check if the provided path or default path exists
if [ ! -d "$DEFAULT_PATH" ]; then
  echo "Error: Directory $DEFAULT_PATH does not exist."
  exit 1
fi

#check sync status of cardano node
cardano-cli query tip \
  --testnet-magic 2 \
  --socket-path $SOCKET_PATH
