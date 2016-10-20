
# --------------------------------------------------------------
#
#	Build
#
DOCKER_LOCAL_REPOS_VERSION ?= 1.0.4

create-docker-local-repos-${DOCKER_LOCAL_REPOS_VERSION}:
	docker build -t 'ownport/docker-local-repos:${DOCKER_LOCAL_REPOS_VERSION}' \
		--no-cache \
		.

# --------------------------------------------------------------
#
#	Run
#

run-docker-local-repos:
	docker run -d --name 'docker-local-repos' \
		-h docker-local-repos \
		-v $(shell pwd):/var/www \
		ownport/docker-local-repos:${DOCKER_LOCAL_REPOS_VERSION}
