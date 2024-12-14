prefix ?= /usr/local

libexecdir ?= $(prefix)/libexec
libexec = $(lastword $(subst /, ,$(libexecdir)))
bindir ?= $(prefix)/bin
pkgname = dosemu-installdos

all:

install:
	install -m 0755 -D src/dosemu-* -t $(DESTDIR)$(libexecdir)/$(pkgname)
	mkdir -p $(DESTDIR)$(bindir)
	ln -sf ../$(libexec)/$(pkgname)/dosemu-install3rdpartydos $(DESTDIR)$(bindir)/dosemu-install3rdpartydos

uninstall:
	$(RM) $(DESTDIR)$(bindir)/dosemu-install3rdpartydos
	$(RM) -r $(DESTDIR)$(libexecdir)/$(pkgname)

rpm: fdpp.spec.rpkg
	rpkg local

deb:
	debuild -i -us -uc -b
