all: package

change-version:
        bin/change-version.sh $(version)

install-components:
		bin/install-components.sh

package:
        bin/package.sh

deploy:
        bin/deploy.sh
