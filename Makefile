SHELL:=/bin/bash
stack=dev1
include .env
up:
	pulumi config set ephemeral-github-runner:repo $(REPO) --config-file config.yaml
	pulumi stack select ${stack}
	pulumi up --config-file config.yaml -y

down:
	pulumi stack select ${stack}
	pulumi destroy --config-file config.yaml -y
	rm Pulumi.${stack}.yaml || true

login:
	pulumi login $(GOOGLE_CLOUD_BUCKET)