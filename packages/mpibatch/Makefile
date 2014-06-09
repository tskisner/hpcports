
include ../pkg_defs.make

# Package parameters

PKG_NAME = mpibatch

PKG_FORMAT = none

PKG_SRCDIR = mpibatch

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE); \
	echo "PREFIX = $(HPCP_PREFIX)" > opts.make; \
	echo "NAME = $(PKG_NAME)" >> opts.make; \
	echo "VERSION = $(PKG_FULLVERSION)" >> opts.make; \
	echo "MPICC = $(MPICC)" >> opts.make; \
	echo "CC = $(CC)" >> opts.make; \
	echo "CFLAGS = $(CFLAGS)" >> opts.make; \
	echo "LDFLAGS = $(LDFLAGS)" >> opts.make; \
	echo "LIBS = $(LIBS)" >> opts.make


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



