
include ../pkg_defs.make

# Package parameters

PKG_NAME = numexpr

PKG_FORMAT = tar
PKG_TAR = numexpr-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) https://pypi.python.org/packages/source/n/numexpr/numexpr-2.4.tar.gz#md5=df7e8d9e9dbb145b56d43c465c2bf854
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = numexpr-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


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
	mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/$(python_SITE)/site-packages; export PYTHONPATH="$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/$(python_SITE)/site-packages:$(PYTHONPATH)"; python setup.py install --prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	python setup.py clean


# Include common package rules

include ../pkg.make



