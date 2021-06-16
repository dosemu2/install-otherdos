prefix ?= /usr/local

libexecdir ?= $(prefix)/libexec
bindir ?= $(prefix)/bin
pkgname = dosemu-installdos

all:

install:
	install -m 0755 -D src/dosemu-* -t $(DESTDIR)$(libexecdir)/$(pkgname)
	mkdir -p $(DESTDIR)$(bindir)
	ln -s ../libexec/$(pkgname)/dosemu-install3rdpartydos $(DESTDIR)$(bindir)/dosemu-install3rdpartydos

rpm: fdpp.spec.rpkg
	rpkg local

deb:
	debuild -i -us -uc -b
