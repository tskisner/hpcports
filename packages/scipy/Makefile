
include ../pkg_defs.make

# Package parameters

PKG_NAME = scipy

PKG_FORMAT = tar
PKG_TAR = scipy-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://sourceforge.net/projects/scipy/files/scipy/0.10.1/scipy-0.10.1.tar.gz/download
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = scipy-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@echo "" > /dev/null


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	export ATLAS=None; python setup.py build


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/$(python_SITE)/site-packages; \
	export PYTHONPATH="$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/$(python_SITE)/site-packages:$(PYTHONPATH)"; \
	python setup.py install --prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	python setup.py clean


# Include common package rules

include ../pkg.make



