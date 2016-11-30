FROM alpine:edge
MAINTAINER Vladimir Goshev <sunx@sunx.name>

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
	apk --no-cache add exim rspamd dovecot procmail

RUN mkdir /home/mail

COPY docker-run-root.sh /bin/docker-run-root

VOLUME /home/mail

# Container will run some preparations with root access (fixing permissions, for example)
#   and then execute /bin/docker-run with user access to configure (if needed) and run
#		Services
CMD ["/bin/docker-run-root"]
