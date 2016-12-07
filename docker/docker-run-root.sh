#!/bin/sh
set -x

ROOT_DIR="/home/mail"

[ -d "$ROOT_DIR/var" ] || tar xf /etc/config.tar -C $ROOT_DIR


/usr/sbin/rspamd -u rspamd -g rspamd -c /etc/rspamd/rspamd.conf

/usr/sbin/dovecot -c /etc/dovecot/dovecot.conf

/usr/sbin/exim -bV
/usr/sbin/exim -bd -q15m

# tail -f /var/log/*/*
exec /bin/sh
