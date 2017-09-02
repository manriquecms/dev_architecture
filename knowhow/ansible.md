Instalar ansible
http://docs.ansible.com/ansible/latest/intro_installation.html#installation
Ubuntu:
$ sudo apt-get install software-properties-common
$ sudo apt-add-repository ppa:ansible/ansible
$ sudo apt-get update
$ sudo apt-get install ansible

Install role requirements
ansible-galaxy install --role-file=requirements.yml --roles-path=roles --force

Configuracion ansible:
/etc/ansible/ansible.cfg
    [defaults]
    roles_path = /stratio/ansible/roles
    host_key_checking = False
    lookup_plugins = /stratio/ansible/plugins
    display_skipped_hosts = False
    gathering = smart
    fact_caching = jsonfile
    fact_caching_connection = /tmp/facts_cache
    fact_caching_timeout = 7200
    [ssh_connection]
    pipelining = True
    ssh_args = -o ControlMaster=no -o ControlPersist=60s


Fichero hosts:
/stratio/ansible/hosts
    [all:vars]
    hostgroup=""
    json_ssh_user="operador"
    json_securize_cluster=true
    
    [master]
    master-1 ansible_host=10.200.1.91 ansible_user=operador ansible_port=22
    
    [gosec]
    gosec3 ansible_host=10.200.1.97 ansible_user=operador ansible_port=22
    gosec1 ansible_host=10.200.1.95 ansible_user=operador ansible_port=22
    gosec2 ansible_host=10.200.1.96 ansible_user=operador ansible_port=22
    
    [agent]
    agent-3 ansible_host=10.200.1.94 ansible_user=operador ansible_port=22
    agent-2 ansible_host=10.200.1.93 ansible_user=operador ansible_port=22
    agent-1 ansible_host=10.200.1.92 ansible_user=operador ansible_port=22

Ficheros host_vars:
/stratio/ansible/host_vars/master-1
    hostgroup: 'master'
    consul_is_server: true
    
    
    consul_services:
      - service:
          name: "gosec-sso"
          tags:
            - "gosec-sso"
          address: "{{ ansible_default_ipv4['address'] }}"
          port: 9005
          checks:
            - name: "Gosec SSO health check"
              http: "https://{{ consul_node_name }}.node.{{ consul_domain }}:9005/{{ json_sso_vpath }}/login"
              interval: "10s"
              timeout: "1s"
    role_node: "master"
