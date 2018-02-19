FROM centos:7

RUN yum install -y epel-release
RUN yum install -y ansible \
	wget \
	net-tools \
	vim \
	openssh-clients \
	bind \
	bind-utils \

	
CMD ["/bin/bash"]
