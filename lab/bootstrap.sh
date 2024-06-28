#!/bin/sh

# Install Docker with the convenience script
# https://docs.docker.com/engine/install/debian/#install-using-the-convenience-script
curl -s https://get.docker.com | sudo sh

(
        set -x
        docker completion bash | sudo tee /etc/bash_completion.d/docker > /dev/null
        # Add user to docker group
        sudo usermod -aG docker $USER

        # Install kind
        KIND_VERSION=v0.23.0
        curl -sLo ./kind https://kind.sigs.k8s.io/dl/${KIND_VERSION}/kind-linux-amd64
        chmod +x ./kind
        sudo mv ./kind /usr/local/bin/kind
        kind completion bash | sudo tee /etc/bash_completion.d/kind > /dev/null

        # Install kubectl
        KUBECTL_VERSION=v1.29.4 # https://dl.k8s.io/release/stable.txt
        curl -sLO https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl
        chmod +x ./kubectl
        sudo mv ./kubectl /usr/local/bin/kubectl
        kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null

        # Install cilium CLI
        CILIUM_CLI_VERSION=v0.16.11 # https://raw.githubusercontent.com/cilium/cilium-cli/main/stable.txt
        curl -sL --fail --remote-name-all https://github.com/cilium/cilium-cli/releases/download/${CILIUM_CLI_VERSION}/cilium-linux-amd64.tar.gz
        sudo tar xzvfC cilium-linux-amd64.tar.gz /usr/local/bin > /dev/null
        rm cilium-linux-amd64.tar.gz
        cilium completion bash | sudo tee /etc/bash_completion.d/cilium > /dev/null
)

echo
echo "======================================================================"
echo
echo "Log out and log back in so that your group membership is re-evaluated."
echo
echo "======================================================================"
echo