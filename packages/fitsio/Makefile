
include ../pkg_defs.make

# Package parameters

PKG_NAME = fitsio

PKG_FORMAT = git
PKG_GIT_CLONE = git clone git://github.com/esheldon/fitsio.git
PKG_GIT_CHECKOUT = git checkout -b hpcports $(PKG_VERSION) >/dev/null 2>&1

PKG_SRCDIR = fitsio

#PKG_FORMAT = tar
#PKG_TAR = $(PKG_VERSION).tar.gz
#PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) https://github.com/esheldon/fitsio/archive/v$(PKG_VERSION).tar.gz
#PKG_TAR_EXTRACT = $(GXTAR)

#PKG_SRCDIR = fitsio-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = 


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@echo "" > /dev/null


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	export CC="$(CC)"; export CFLAGS="$(CFLAGS)"; \
	export CXX="$(CXX)"; export CXXFLAGS="$(CXXFLAGS)"; \
	export OMPFLAGS="$(OMPFLAGS)"; \
	python setup.py build 


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/$(python_SITE)/site-packages; \
	export PYTHONPATH="$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/$(python_SITE)/site-packages:$(PYTHONPATH)"; \
	export CC="$(CC)"; export CFLAGS="$(CFLAGS)"; \
	export CXX="$(CXX)"; export CXXFLAGS="$(CXXFLAGS)"; \
	export OMPFLAGS="$(OMPFLAGS)"; \
	python setup.py install --prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	python setup.py clean


# Include common package rules

include ../pkg.make



