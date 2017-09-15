Install better by the web url, not by apt

wget https://releases.hashicorp.com/vagrant/1.9.8/vagrant_1.9.8_x86_64.deb
dpkg -i vagrant_1.9.8_x86_64.deb


Usar LXC como provider
  - vagrant plugin install vagrant-lxc
  - apt-get install lxc

Centos7 box Virtualbox 
  - vagrant box add geerlingguy/centos7 --insecure -c 

Centos7 box LXC
  - vagrant box add frensjan/centos-7-64-lxc --insecure -c 


