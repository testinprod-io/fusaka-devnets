#!/bin/bash

NODES_FILE="nodes.txt"
REMOTE_LOG_PATH="/tmp/beacon_last_hour.log"
REMOTE_LOG_PATH2="/tmp/execution_last_hour.log"
LOCAL_LOG_DIR="./logs"
CONTAINER_NAME="beacon"
CONTAINER_NAME2="execution"
SINCE="2025-07-23T12:00:00Z"
UNTIL="2025-07-23T13:00:00Z"
SSH_USER="devops"

mkdir -p "$LOCAL_LOG_DIR"

# Current log collection time in YYYY-MM-DDTHH-MM format (for file name)
COLLECT_TIME=$(date -u +"%Y-%m-%dT%H-%M_UTC")

while read -r NODE; do
  echo "Processing $NODE..."

  ssh-keyscan -H "$NODE" >> ~/.ssh/known_hosts

  # Get logs from the last hours and save to remote file
  echo "Collecting beacon node"
  ssh -n "$SSH_USER@$NODE" "docker logs --since ${SINCE} --until ${UNTIL} $CONTAINER_NAME > $REMOTE_LOG_PATH 2>&1" > /dev/null 2>&1
  echo "Collecting execution node"
  ssh -n "$SSH_USER@$NODE" "docker logs --since ${SINCE} --until ${UNTIL} $CONTAINER_NAME2 > $REMOTE_LOG_PATH2 2>&1" > /dev/null 2>&1

  # Download the log file to local machine, include collect time in the name
  echo "Downloading beacon log"
  scp "$SSH_USER@$NODE:$REMOTE_LOG_PATH" \
    "$LOCAL_LOG_DIR/beacon_${NODE}_${SINCE}_to_${UNTIL}.log"
  echo "Downloading execution log"
  scp "$SSH_USER@$NODE:$REMOTE_LOG_PATH2" \
    "$LOCAL_LOG_DIR/execution_${NODE}_${SINCE}_to_${UNTIL}.log"

  # Remove the log file from the remote node
  echo "Removing remote beacon log"
  ssh -n "$SSH_USER@$NODE" "rm -f $REMOTE_LOG_PATH"
  echo "Removing remote execution log"
  ssh -n "$SSH_USER@$NODE" "rm -f $REMOTE_LOG_PATH2"

done < <(cat "$NODES_FILE")