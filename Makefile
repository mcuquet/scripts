MAKE = make

PREFIX = $(HOME)
BINDIR = $(PREFIX)/bin
MANDDIR = $(PREFIX)/share/man
MANSEC = 1

INSTALL = install
INSTALLSCRIPT = -m 755
INSTALLMAN = -m 644
MAKEDIR = install -d

RM = rm -f

#SUBDIRS = $(addsuffix /trunk, crypto graph_converters latex net otl)
SUBDIRS = latex 

## Let's go

install:
	@for D in $(SUBDIRS); do \
		(cd $$D; $(MAKE) install); \
		done

clean:
	@for D in $(SUBDIRS); do \
		(cd $$D; $(MAKE) clean); \
		done
