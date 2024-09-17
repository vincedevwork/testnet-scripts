#!/bin/bash

# This script starts a Cardano node using a dynamic or provided path for node files.
# Usage:
#   - To use the default testnet-node path: ./testnet_run_node.sh
#   - To specify a custom path: ./testnet_run_node.sh /custom/path/to/node

# Get the directory where the script is located
SCRIPT_DIR=$(dirname "$(realpath "$0")")

# Define default paths based on the script's location or argument
DEFAULT_PATH=${1:-"$SCRIPT_DIR/../testnet-node"}

# Check if the provided path or default path exists
if [ ! -d "$DEFAULT_PATH" ]; then
  echo "Error: Directory $DEFAULT_PATH does not exist."
  exit 1
fi

#start node
cardano-node run \
  --topology $DEFAULT_PATH/topology.json \
  --database-path $DEFAULT_PATH/db \
  --socket-path $DEFAULT_PATH/db/socket \
  --host-addr 0.0.0.0 \
  --port 3001 \
  --config $DEFAULT_PATH/config.json
