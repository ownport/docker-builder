FROM alpine:latest

COPY ./scripts/install.sh /install/docker-builder.sh

RUN /install/docker-builder.sh install_apps && \
	/install/docker-builder.sh config_apps

COPY ./conf/privoxy /etc/privoxy

CMD ["/sbin/runsvdir", "-P", "/etc/service"]


