# Docker image of mail server (Exim + Dovecot + RSpamd + Procmail)
Docker image  for Mail server, based on Alpine Linux edge, it contains:
* [Exim](http://www.exim.org/) MTA
* [Dovecot](http://www.dovecot.org/) IMAP and POP3 Server
* [RSpamd](https://www.rspamd.com/) Spam filtering system
* [Procmail](https://en.wikipedia.org/wiki/Procmail) Mail delivery arend

## Supported tags and respective `Dockerfile` links

* [`latest`](https://github.com/SunAngel/mailserver-docker/blob/master/docker/Dockerfile) - Latest avaliable version.

## Quickstart

To run container you can use following command:
```bash
docker run \  
  -v /home/docker/mail:/home/mail \  
  -p 993:993 -p 995:995 \
	-p 110:110 -p 143:143 \
	-p 25:25 -p 465:465 \
  -d sunx/mailserver
```

After first run container will create default configuration files for Exim, Dovecot and RSpamd in `/home/mail/etc/` directory, which you should edit manually. Default configuration files are well documented, so you shouldn't have any problems in changeing it. Also you can read official manuals ([Exim](http://www.exim.org/docs.html), [Dovecot](http://wiki2.dovecot.org/), [RSpamd](https://www.rspamd.com/doc/index.html)) for help.

## Detailed description of image and containers

### Used ports

This image, usually  uses following tcp ports:
* 143, 993 - IMAP and IMAP over SSL
* 110, 995 - POP3 and POP3 over SSL
* 25, 465 - SMTP and SMTP over TLS

### Volume
This image uses one volume with internal path `/home/mail`, it will store configuration files, data files and logs.

I would recommend you use host directory mapping of named volume to run containers, so you will not lose your valuable data after image update and starting new container.

## Issues and ToDo

Default RSpamd configuration files, probably, shouldn't been put into volume, only local configuration directories should. It will, probably, fixed soon.

Procmail is no longer maintained for a long time, so, probably, this image will be switched to use different MDA in future ([maildrop](http://www.courier-mta.org/maildrop/), probably) or 2 versions of image will exists.

## License

This Dockerfile and scripts are released under [MIT License](https://github.com/SunAngel/mailserver-docker/blob/master/LICENSE).
