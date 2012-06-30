
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell $(SHELL) ./gen_version.sh $(MD5) $(HPCP_ENV))

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
	@mkdir -p $(PREFIX)/$(NAME)-$(VERSION)/bin; \
	cp $(STAGE)/$(PKG_BUILDDIR)/cmbconfig $(PREFIX)/$(NAME)-$(VERSION)/bin/


pkg-clean :
	@rm -f $(STAGE)/$(PKG_BUILDDIR)/cmbconfig


# Include common package rules

include ../pkg.make



