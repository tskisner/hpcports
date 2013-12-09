
include ../pkg_defs.make

# Package parameters

PKG_NAME = hotpants

PKG_FORMAT = tar
PKG_TAR = hotpants_v$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://www.astro.washington.edu/users/becker/v2.0/software/hotpants_v$(PKG_VERSION).tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = hotpants_v5.1.10b

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_make.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	echo "CC = $(CC)" > hpcp.make; \
	if [ "x$(VENDOR)" = "xapple" ]; then \
		echo "CFLAGS = $(CFLAGS) -I/usr/include/malloc" >> hpcp.make; \
	else \
		echo "CFLAGS = $(CFLAGS)" >> hpcp.make; \
	fi; \
	echo "LDFLAGS = $(LDFLAGS)" >> hpcp.make; \
	echo "LIBS = $(LIBS)" >> hpcp.make; \
	echo "cfitsio_LIBS_CC = $(cfitsio_LIBS_CC)" >> hpcp.make; \
	echo "PREFIX = $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)" >> hpcp.make


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE)


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) install


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



