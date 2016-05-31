FROM alpine:latest

COPY ./scripts/install.sh /install/docker-local-repos.sh

RUN /install/docker-local-repos.sh install_apps && \
	/install/docker-local-repos.sh config_apps

COPY ./conf/privoxy /etc/privoxy

CMD ["/sbin/runsvdir", "-P", "/etc/service"]
