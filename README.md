# Docker Builder

[![Docker Hub](https://img.shields.io/badge/docker-ready-blue.svg)](https://registry.hub.docker.com/u/ownport/docker-builder/)
[![](https://badge.imagelayers.io/ownport/docker-builder:latest.svg)](https://imagelayers.io/?images=ownport/docker-builder:latest)

Simple and small Docker image with HTTP server and forwarding proxy. Used as static cache for installation scripts and artifacts during Docker images creation


## Components

- runit
- darkhttpd
- privoxy

## Confifuration

### privoxy

Rules

```
{ +redirect{s@http://dl-cdn.alpinelinux.org/alpine/@http://docker-builder/repo/alpine/@} }
dl-cdn.alpinelinux.org/alpine/.*
```

All privoxy's rules are available in conf/privoxy/user.action

### How to add new rules to privoxy

to be described later


### DarkHTTPD

Host directory is /var/www


## Examples

To run docker-builder 

```sh
$ docker run -d --name 'docker-builder' \
	-h docker-builder \
	-v $(shell pwd):/var/www \
	ownport/docker-builder:latest
```

to use docker-builder as forwaring proxy, please specify the HTTP_PROXY environment variable

```sh
$ HTTP_PROXY=http://<docker-builder-host>:8118/
```

HTTPS proxy is not supported


