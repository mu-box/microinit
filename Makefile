# -*- mode: make; tab-width: 4; indent-tabs-mode: 1; st-rulers: [80] -*-
# vim: ts=8 sw=8 ft=make noet

.PHONY: all deb

all:	microinit

microinit: microinit.c microinit.h
	gcc -std=gnu11 -o microinit microinit.c

deb: microinit
	install -d deb/bin
	install -s microinit deb/bin/microinit
	fakeroot dpkg-deb --build deb microinit_0.0.3_amd64.deb