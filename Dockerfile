FROM alpine:3.4

COPY ./conf/privoxy /etc/privoxy-local-repos/
COPY ./scripts/privoxy.run /etc/service/privoxy/run
COPY ./scripts/install.sh /install/docker-local-repos.sh

RUN /install/docker-local-repos.sh install_apps && \
	/install/docker-local-repos.sh config_apps

CMD ["/sbin/runsvdir", "-P", "/etc/service"]
