FROM alpine:latest

ARG DOCKER_BUILDER_HOST

COPY ./scripts/runit.sh /install/
COPY ./scripts/darkhttpd.sh /install/
COPY ./scripts/privoxy.sh /install/

RUN /install/runit.sh && \
	RUNIT_SUPPORT=YES /install/darkhttpd.sh && \
	RUNIT_SUPPORT=YES /install/privoxy.sh

COPY ./conf/privoxy /etc/privoxy

CMD ["/sbin/runsvdir", "-P", "/etc/service"]


