# Cluster example of one node
1. Install minikube -> https://kubernetes.io/docs/tasks/tools/install-minikube/
2. minikube start

# Kubectl commands
1. kubectl cluster-info
2. kubectl get nodes
3. kubectl version
4. kubectl run



# Centos Instalation
Following this guide https://kubernetes.io/docs/getting-started-guides/centos/centos_manual_config/
1. Create a */etc/yum.repos.d/virt7-docker-common-release.repo* on each host
```shell
$> cat > /etc/yum.repos.d/virt7-docker-common-release.repo << EOF
[virt7-docker-common-release]
name=virt7-docker-common-release
baseurl=http://cbs.centos.org/repos/virt7-docker-common-release/x86_64/os/
gpgcheck=0
EOF
```

2. Install kubernetes
```shell
$> yum -y install --enablerepo=virt7-docker-common-release kubernetes etcd flannel
```
