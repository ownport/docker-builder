# Docker Local repositories

[![Docker Hub](https://img.shields.io/badge/docker-ready-blue.svg)](https://registry.hub.docker.com/u/ownport/docker-local-repos/)
[![](https://badge.imagelayers.io/ownport/docker-local-repos:latest.svg)](https://imagelayers.io/?images=ownport/docker-local-repos:latest)

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
{ +redirect{s@http://dl-cdn.alpinelinux.org/alpine/@http://docker-local-repos/repo/alpine/@} }
dl-cdn.alpinelinux.org/alpine/.*
```

All privoxy's rules are available in conf/privoxy/user.action

### How to add new rules to privoxy

to be described later


### DarkHTTPD

Host directory is /var/www

## Prerequisites

Check that user defined Docker network is created
```sh
$ docker network create docker.env
0bfd31093dbd68a34d0509328c5d6e3714682a3a6a0127ec293aad2a8da4b480
```


## Examples

To run docker-local-repos

```sh
$ docker run -d \
	--net 'docker.env' \
	--name 'local-repos' \
	--hostname local-repos \
	-v $(shell pwd):/var/www \
	ownport/docker-local-repos:latest
```

to use local-repos with forwarding proxy option, please specify the HTTP_PROXY environment variable

```sh
$ HTTP_PROXY=http://<docker-local-repos-host>:8118/
```

HTTPS proxy is not supported
