
include ../pkg_defs.make

# Package parameters

PKG_NAME = cmb

PKG_FORMAT = none

PKG_SRCDIR = cmb

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@echo "" > /dev/null


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	./gen_cmbconfig.sh $(SHELL)


pkg-install :
	@mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/bin; \
	cp $(STAGE)/$(PKG_BUILDDIR)/cmbconfig $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/bin/


pkg-clean :
	@rm -f $(STAGE)/$(PKG_BUILDDIR)/cmbconfig


# Include common package rules

include ../pkg.make



