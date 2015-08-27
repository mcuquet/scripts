PREFIX = $(HOME)
BINDIR = $(PREFIX)/bin
MANDDIR = $(PREFIX)/share/man
MANSEC = 1

INSTALL = install
INSTALLSCRIPT = -m 755
INSTALLMAN = -m 644
MAKEDIR = install -d

RM = rm -f

JUNK =

SCRIPTS = cleanlatex.pl latex2html-circumvent.pl qphys2file.pl unqphys.pl
SCRIPTS_W_MAN =

## Let's go

install: install-scripts install-man

install-scripts:
	@echo Installing latex scripts:
	@$(foreach S, $(SCRIPTS), \
		echo "  $(basename $S)"; \
		$(INSTALL) $(INSTALLSCRIPT) $S $(BINDIR)/$(basename $S); \
		)

install-man:

clean:
	$(RM) $(JUNK)
