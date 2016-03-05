# --------------------------------------------------------------
#
#	Environment
#

DOCKER_BUILDER_HOST := $(shell docker inspect \
	-f "{{ json .NetworkSettings.Networks.bridge.IPAddress }}" \
	docker-builder | sed "s/\"//g")
HTTP_PROXY := $(if ${DOCKER_BUILDER_HOST},"http://${DOCKER_BUILDER_HOST}:8118","")

# --------------------------------------------------------------
#
#	Build
#

create-docker-builder:
	docker build -t 'ownport/docker-builder:latest' \
		--no-cache \
		--build-arg DOCKER_BUILDER_HOST=${DOCKER_BUILDER_HOST} \
		--build-arg HTTP_PROXY=${HTTP_PROXY} \
		.

# --------------------------------------------------------------
#
#	Run
#

run-docker-builder:
	docker run -d --name 'docker-builder' \
		-h docker-builder \
		-v $(shell pwd):/var/www \
		ownport/docker-builder:latest

