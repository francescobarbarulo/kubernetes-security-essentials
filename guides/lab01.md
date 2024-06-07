# Lab 01

In this lab you are going to use [kube-bench](https://github.com/aquasecurity/kube-bench/) to check whether Kubernetes is deployed according to security best practices as defined in the CIS Kubernetes Benchmark.

## Install kube-bench

There are two ways to run kube-bench: form inside a pod or directly on the host. You will run the CIS benchmark on the control plane node using the second choice

1. Open a `bash` session in the control plane

   ```sh
   docker exec -it lab-control-plane bash
   ```

2. Download and install the `kube-bench` release `deb` package.

   ```
   curl -sLO https://github.com/aquasecurity/kube-bench/releases/download/v0.7.3/kube-bench_0.7.3_linux_amd64.deb
   apt-get install ./kube-bench_0.7.3_linux_amd64.deb
   ```

## Run a CIS benchmark with kube-bench

1. Run the CIS benchmark.

   ```sh
   kube-bench run
   ```
