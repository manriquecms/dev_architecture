# Requirements:
- Ansible

# Architecture Components:
##### Fabric
1. Consul -> Service discovery solution
2. Docker -> Container solution
3. Kubernetes -> Container orchestrator (**TODO**)

##### Services
1. Jenkins -> Continuous Integration tool (**TODO** Docker app)
2. Docker registry -> Docker images storage (**TODO** Docker app)

# First steps:
- Ensure a VMs environment with vagrant, there's a Vagrantfile with an example:
```shell
 $> vagrant up --provider=virtualbox
```
- Generate the docker image with as bootstrap:
```shell
 $> make build
```
- Run the bootstrap image
```shell
 $> make run-bootstrap
```
# Inside the container:
```shell
 $> cd /dev-arch/ansible
 $> bash execute-playbook.sh playbooks/install-dev-architecture.yml
```

# References:
*ansible-consul* role created by https://github.com/savagegus/ansible-consul

*ansible-role-docker* role created by https://github.com/geerlingguy/ansible-role-docker
