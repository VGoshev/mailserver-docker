FROM alpine:edge
MAINTAINER Vladimir Goshev <sunx@sunx.name>

#We have to upgrade musl, or rspamd will not work =(
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
	apk add --no-cache --upgrade musl musl-utils && \
	apk --no-cache add exim rspamd dovecot procmail rspamd-client && \
	\
	mkdir -p /var/lib/dovecot && \
	mkdir -p /var/log/exim && chown -R exim:exim /var/log/exim && \
	mkdir -p /run/rspamd && \
	\
	tar cf /etc/config.tar /etc/exim /etc/dovecot /etc/rspamd /var/lib/dovecot /var/lib/rspamd /var/log && \
	rm -rf /etc/exim /etc/dovecot /etc/rspamd /var/lib/dovecot /var/lib/rspamd /var/log && \
	ln -s /home/mail/etc/exim /etc/exim && \
	ln -s /home/mail/etc/dovecot /etc/dovecot && \
	ln -s /home/mail/etc/rspamd /etc/rspamd && \
	ln -s /home/mail/var/lib/dovecot /var/lib/dovecot && \
	ln -s /home/mail/var/lib/rspamd /var/lib/rspamd && \
	ln -s /home/mail/var/log /var/log && \
	echo Done!

#Make exim lib dir, so exim won't print warning about it
Run mkdir /usr/lib/exim

RUN mkdir /home/mail

COPY docker-run-root.sh /bin/docker-run-root

VOLUME /home/mail

# Container will run some preparations with root access (fixing permissions, for example)
#   and then execute /bin/docker-run with user access to configure (if needed) and run
#		Services
CMD ["/bin/docker-run-root"]
