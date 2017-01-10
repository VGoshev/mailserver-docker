#!/bin/sh

cd `dirname $0`

ARCH=`uname -m`
IMAGE="sunx/mailserver"

if `echo $ARCH | grep -q arm`; then
	echo arm
	rm -rf ./build
	cp -a ./docker ./build

	#Use armhf/alpine as base image instead of alpine
	sed -i -r 's,(FROM)\s+(alpine),\1 armhf/\2,' build/Dockerfile

	docker build -t $IMAGE ./build/
	#&& rm -rf ./build
else
	if `echo $ARCH | grep -q x86_64`; then
		docker build -t $IMAGE ./docker/
	else 
		echo "Error: Architecture $ARCH isn't supported"
		exit 1
	fi
fi

