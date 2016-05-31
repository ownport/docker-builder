# Docker Local repositories

[![Docker Hub](https://img.shields.io/badge/docker-ready-blue.svg)](https://registry.hub.docker.com/u/ownport/docker-builder/)
[![](https://badge.imagelayers.io/ownport/docker-builder:latest.svg)](https://imagelayers.io/?images=ownport/docker-builder:latest)

Simple and small Docker image with HTTP server and forwarding proxy.
Using as local repositories for installation scripts and artifacts during Docker images creation

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

To run docker-local-repos

```sh
$ docker run -d --name 'docker-local-repos' \
	-h docker-local-repos \
	-v $(shell pwd):/var/www \
	ownport/docker-local-repos:latest
```

to use docker-local-repos with forwarding proxy option, please specify the HTTP_PROXY environment variable

```sh
$ HTTP_PROXY=http://<docker-local-repos-host>:8118/
```

HTTPS proxy is not supported
