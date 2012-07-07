
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = healpy

PKG_FORMAT = git
PKG_GIT_CLONE = $(GIT) clone https://github.com/healpy/healpy.git
PKG_GIT_CHECKOUT = $(GIT) checkout -b hpcports $(PKG_VERSION) >/dev/null 2>&1

PKG_SRCDIR = healpy

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_healpy.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@echo "" > /dev/null


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	python setup.py build 


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION)/lib/$(python_SITE)/site-packages; \
	export PYTHONPATH="$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION)/lib/$(python_SITE)/site-packages:$(PYTHONPATH)"; \
	python setup.py install --prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION)


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	python setup.py clean


# Include common package rules

include ../pkg.make



