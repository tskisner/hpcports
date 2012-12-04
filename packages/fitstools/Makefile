
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = fitstools

PKG_FORMAT = zip
PKG_ZIP = cexamples.zip
PKG_ZIP_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_ZIP) http://heasarc.nasa.gov/docs/software/fitsio/cexamples/cexamples.zip
PKG_ZIP_EXTRACT = $(UZIP)

PKG_SRCDIR = cexamples

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_fitstools_makefile.patch


# rules for this package


pkg-prefetch :
	@echo "" > /dev/null
	

pkg-configure :
	@echo "PREFIX = $(HPCP_PREFIX)" > $(STAGE)/opts.make; \
	echo "NAME = $(PKG_NAME)" >> $(STAGE)/opts.make; \
	echo "VERSION = $(PKG_VERSION)" >> $(STAGE)/opts.make; \
	echo "cfitsio_LIBS_CC = $(cfitsio_LIBS_CC)" >> $(STAGE)/opts.make; \
	echo "CC = $(CC)" >> $(STAGE)/opts.make; \
	echo "CFLAGS = $(CFLAGS)" >> $(STAGE)/opts.make; \
	echo "LDFLAGS = $(LDFLAGS)" >> $(STAGE)/opts.make; \
	echo "LIBS = $(LIBS)" >> $(STAGE)/opts.make


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



