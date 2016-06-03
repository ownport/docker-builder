
# --------------------------------------------------------------
#
#	Build
#

create-docker-local-repos-latest:
	docker build -t 'ownport/docker-local-repos:latest' \
		--no-cache \
		.

create-docker-local-repos-1.0.1:
	docker build -t 'ownport/docker-local-repos:1.0.1' \
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
		ownport/docker-local-repos:latest
