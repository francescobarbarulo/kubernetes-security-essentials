#!/bin/sh

# Install Docker
curl https://get.docker.com | sh
docker completion bash | sudo tee /etc/bash_completion.d/cilium
# Add user to docker group
usermod -aG docker $USER

# Install kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.23.0/kind-linux-amd64
chmod +x ./kind
mv ./kind /usr/local/bin/kind
kind completion bash | sudo tee /etc/bash_completion.d/kind

# Install kubectl
KUBECTL_VERSION=v1.29.4 # https://dl.k8s.io/release/stable.txt
curl -LO https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl
mv ./kubectl /usr/local/bin/kubectl
kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl

# Install cilium CLI
CILIUM_CLI_VERSION=v0.16.11 # https://raw.githubusercontent.com/cilium/cilium-cli/main/stable.txt
curl -L --fail --remote-name-all https://github.com/cilium/cilium-cli/releases/download/${CILIUM_CLI_VERSION}/cilium-linux-amd64.tar.gz
tar xzvfC cilium-linux-amd64.tar.gz /usr/local/bin
rm cilium-linux-amd64.tar.gz
cilium completion bash | sudo tee /etc/bash_completion.d/cilium

echo "======================================================================"
echo
echo "Log out and log back in so that your group membership is re-evaluated."
echo 
echo "======================================================================"