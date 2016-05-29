
# --------------------------------------------------------------
#
#	Build
#

create-docker-builder:
	docker build -t 'ownport/docker-builder:latest' \
		--no-cache \
		.

create-docker-builder-1.0.0:
	docker build -t 'ownport/docker-builder:1.0.0' \
		--no-cache \
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
