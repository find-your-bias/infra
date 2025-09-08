#!/bin/bash

# === Install GitHub Runner ===
ORG_NAME="find-your-bias"   # Change to your GitHub org
RUNNER_NAME=$(hostname)
RUNNER_DIR="/home/ubuntu/actions-runner"
REG_TOKEN="${runner_token}"   # <-- Directly injected by Terraform

# Install dependencies
sudo apt-get update -y
sudo apt-get install -y curl tar jq

# Create runner dir
sudo mkdir -p $RUNNER_DIR && cd $RUNNER_DIR

curl -o actions-runner.tar.gz -L https://github.com/actions/runner/releases/download/v2.328.0/actions-runner-linux-x64-2.328.0.tar.gz
tar xzf ./actions-runner.tar.gz
rm actions-runner.tar.gz


# Configure runner
./config.sh --unattended \
  --url https://github.com/${ORG_NAME} \
  --token ${REG_TOKEN} \
  --name ${RUNNER_NAME} \
  --labels ${LABELS} \
  --work _work

# Install service
sudo ./svc.sh install
sudo ./svc.sh start
