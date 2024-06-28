# Kubernetes Security Essentials

The _Kubernetes Security Essentials_ course aims to provide you an overview about security best practices for container-based applications and Kubernetes platforms. This course is delivered by [EDU.labs (Computer Gross)](https://www.educationlabs.it/).

## Prerequisites

1. A Debian-based Linux distro (e.g. Ubuntu 22.04, Debain 12)

2. [Install Docker](https://docs.docker.com/engine/install/debian/#install-using-the-convenience-script) and make sure you perform the [post-installation steps](https://docs.docker.com/engine/install/linux-postinstall/)

3. [Install kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installing-from-release-binaries) for running local Kubernetes clusters using Docker container _nodes_.

4. [Install kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/) to interact with Kubernetes API server.

5. [Install cilium CLI](https://docs.cilium.io/en/stable/gettingstarted/k8s-install-default/#install-the-cilium-cli) to deploy Cilium network plugin within the Kubernetes cluster.

Instead of installing all the tools manually, you can run the following script:

```sh
curl https://raw.githubusercontent.com/francescobarbarulo/kubernetes-security-essentials/main/lab/bootstrap.sh | sudo sh
```

## Getting Started

1. Create a single node control plane, 2-worker nodes Kubernetes cluster without the default CNI plugin using kind.

   ```sh
   curl -sLO https://raw.githubusercontent.com/francescobarbarulo/kubernetes-security-essentials/main/lab/kind-config.yml
   kind create cluster --config=kind-config.yml
   ```

2. Deploy the Cilium network plugin.

   ```sh
   cilium install --version 1.15.5
   ```

3. Verify all the nodes are in `Ready` state.

   ```sh
   kubectl get nodes
   ```

   The output is similar to this:

   ```plaintext
   NAME                STATUS   ROLES           AGE     VERSION
   lab-control-plane   Ready    control-plane   5m21s   v1.29.4
   lab-worker          Ready    <none>          4m58s   v1.29.4
   lab-worker2         Ready    <none>          4m56s   v1.29.4
   ```
