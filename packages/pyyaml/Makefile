
include ../pkg_defs.make

# Package parameters

PKG_NAME = pyyaml

PKG_FORMAT = tar
PKG_TAR = PyYAML-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) --no-check-certificate https://pypi.python.org/packages/source/P/PyYAML/PyYAML-3.11.tar.gz#md5=f50e08ef0fe55178479d3a618efe21db
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = PyYAML-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	mv setup.cfg setup.cfg.orig; \
	echo "[build_ext]" > setup.cfg; \
	echo "include_dirs=$(libyaml_PREFIX)/include" >> setup.cfg; \
	echo "library_dirs=$(libyaml_PREFIX)/lib" >> setup.cfg; \
	echo "" >> setup.cfg


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	python setup.py build


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	export PYTHONPATH="$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/$(python_SITE)/site-packages:$(PYTHONPATH)"; \
	python setup.py install --prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	python setup.py clean


# Include common package rules

include ../pkg.make



