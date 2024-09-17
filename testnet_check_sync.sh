#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR=$(dirname "$(realpath "$0")")

# Define default socket path based on the script's location or argument
SOCKET_PATH=${1:-"$SCRIPT_DIR/../testnet-node/db/socket"}

# Check if the socket file exists
if [ ! -e "$SOCKET_PATH" ]; then
  echo "Error: SOCKET_PATH $SOCKET_PATH does not exist."
  exit 1
fi

# Check sync status of the Cardano node
cardano-cli query tip \
  --testnet-magic 2 \
  --socket-path $SOCKET_PATH
