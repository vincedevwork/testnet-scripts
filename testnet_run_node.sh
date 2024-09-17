#!/bin/bash
#
#default path to net
DEFAULT_PATH=${1:-"$HOME/cardano/testnet"}

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
