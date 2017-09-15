all: build

install-components:
	bin/install-components.sh

build:
	bin/build.sh

run-bootstrap:
	bin/run-bootstrap.sh

run-master:
	bin/run-master.sh
        
run-agent:
	bin/run-agent.sh
