
include ../pkg_defs.make

# Package parameters

PKG_NAME = fitsio

PKG_FORMAT = git
PKG_GIT_CLONE = git clone git://github.com/esheldon/fitsio.git
PKG_GIT_CHECKOUT = git checkout -b hpcports $(PKG_VERSION) >/dev/null 2>&1

PKG_SRCDIR = fitsio

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_external_cfitsio.patch


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
	export CFITSIO_EXT_PREFIX=$(cfitsio_PREFIX); \
	python setup.py build 


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/$(python_SITE)/site-packages; \
	export PYTHONPATH="$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/$(python_SITE)/site-packages:$(PYTHONPATH)"; \
	export CC="$(CC)"; export CFLAGS="$(CFLAGS)"; \
	export CXX="$(CXX)"; export CXXFLAGS="$(CXXFLAGS)"; \
	export OMPFLAGS="$(OMPFLAGS)"; \
	export CFITSIO_EXT_PREFIX=$(cfitsio_PREFIX); \
	python setup.py install --prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	python setup.py clean


# Include common package rules

include ../pkg.make


