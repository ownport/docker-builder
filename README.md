# Docker Builder

[![Docker Hub](https://img.shields.io/badge/docker-ready-blue.svg)](https://registry.hub.docker.com/u/ownport/docker-builder/)
[![](https://badge.imagelayers.io/ownport/docker-builder:latest.svg)](https://imagelayers.io/?images=ownport/docker-builder:latest)

## Components

- runit
- darkhttpd
- privoxy

## Settings

```sh
$ HTTP_PROXY=http://<docker-builder-host>:8118/
```

## Examples

To run docker-builder 

```sh
$ docker run -d --name 'docker-builder' \
	-h docker-builder \
	-v $(shell pwd):/var/www \
	ownport/docker-builder:latest
```
