#!/opt/homebrew/bin/bash
set -euo pipefail

# List of node hostnames or IPs (without SSH user)
NODES=(
    "grandine-geth-1.fusaka-devnet-ssl-7.yolkie.xyz"
    "grandine-geth-2.fusaka-devnet-ssl-7.yolkie.xyz"
    "grandine-geth-3.fusaka-devnet-ssl-7.yolkie.xyz"
    "grandine-geth-4.fusaka-devnet-ssl-7.yolkie.xyz"
    "lighthouse-geth-1.fusaka-devnet-ssl-7.yolkie.xyz"
    "lighthouse-geth-2.fusaka-devnet-ssl-7.yolkie.xyz"
    "lighthouse-geth-3.fusaka-devnet-ssl-7.yolkie.xyz"
    "lighthouse-geth-4.fusaka-devnet-ssl-7.yolkie.xyz"
    "lighthouse-geth-5.fusaka-devnet-ssl-7.yolkie.xyz"
    "lighthouse-geth-6.fusaka-devnet-ssl-7.yolkie.xyz"
    "lighthouse-geth-7.fusaka-devnet-ssl-7.yolkie.xyz"
    "lighthouse-geth-8.fusaka-devnet-ssl-7.yolkie.xyz"
    "prysm-geth-1.fusaka-devnet-ssl-7.yolkie.xyz"
    "prysm-geth-2.fusaka-devnet-ssl-7.yolkie.xyz"
    "prysm-geth-3.fusaka-devnet-ssl-7.yolkie.xyz"
    "prysm-geth-4.fusaka-devnet-ssl-7.yolkie.xyz"
)


SSH_USER="devops"
BASE_KEYS_DIR="peerdas-node-keys"

# Define client info: local subdirectory and remote key path logic
declare -A CLIENT_KEY_LAYOUT=(
  ["lighthouse"]="nested"
  ["grandine"]="nested"
  ["prysm"]="flat"
  ["teku"]="flat"
)
# Remote destination base directory per client
declare -A REMOTE_BASE=(
  ["grandine"]="/data/grandine/testnet/network/key"
  ["lighthouse"]="/data/lighthouse/beacon/network/key"
  ["prysm"]="/data/prysm/network-keys"
  ["teku"]="/tmp/remote_key" #"/data/teku/beacon/kvstore/generated-node-key.dat"
)

# Iterate nodes
for i in "${!NODES[@]}"; do
  host="${NODES[$i]}"
  echo "🛰 Processing $host (index $i)..."

  ssh-keyscan -H "$host" >> ~/.ssh/known_hosts

  # Determine which client this node runs based on its name
  if [[ "$host" == grandine* ]]; then
    client="grandine"
  elif [[ "$host" == lighthouse* ]]; then
    client="lighthouse"
  elif [[ "$host" == prysm* ]]; then
    client="prysm"
  elif [[ "$host" == teku* ]]; then
    client="teku"
  else
    echo "Unknown client for node $host"
    continue
  fi  
  layout="${CLIENT_KEY_LAYOUT[$client]}"
  remote_dir="${REMOTE_BASE[$client]}"
  key_index=$((i + 1))
  key_path=""  
  if [ "$layout" == "nested" ]; then
    key_path="${BASE_KEYS_DIR}/${client}/node-key-file-${key_index}/key"
  else
    key_path="${BASE_KEYS_DIR}/${client}/node-key-file-${key_index}"
  fi  
  if [ ! -f "$key_path" ]; then
    echo "⚠️  Skipping $client: missing key at $key_path"
    continue
  fi  
  b64=$(base64 -w0 < "$key_path")
  echo " → Uploading $client key node-key-file-${key_index} for node-$i to $host:$remote_dir/key"
  # After building $key_path and $remote_dir
  ssh "${SSH_USER}@${host}" "docker stop beacon"
  scp "$key_path" "${SSH_USER}@${host}:/tmp/remote_key1"
  ssh "${SSH_USER}@${host}" "sudo cp /tmp/remote_key1 ${remote_dir}"
  ssh "${SSH_USER}@${host}" "docker start beacon"
  #&& sudo chown root:root ${remote_dir}/key && sudo chmod 600 ${remote_dir}/key"

  echo "✅ Done with $host"
done

echo "🎉 All nodes done."