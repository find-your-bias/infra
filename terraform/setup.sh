#!/bin/bash

# === Install GitHub Runner ===

# Install dependencies
sudo apt-get update -y
sudo apt-get install -y curl tar jq

# Create runner dir
sudo mkdir -p /home/ubuntu/actions-runner && cd /home/ubuntu/actions-runner

curl -o actions-runner.tar.gz -L https://github.com/actions/runner/releases/download/v2.328.0/actions-runner-linux-x64-2.328.0.tar.gz
tar xzf ./actions-runner.tar.gz
rm actions-runner.tar.gz


# Configure runner
./config.sh --unattended \
  --url https://github.com/find-your-bias \
  --token ${runner_token} \
  --name ${hostname} \
  --work _work

# Install service
sudo ./svc.sh install
sudo ./svc.sh start
