
include ../pkg_defs.make

# Package parameters

PKG_NAME = mpibatch

PKG_FORMAT = none

PKG_SRCDIR = mpibatch

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@mkdir -p $(STAGE); \
	echo "PREFIX = $(HPCP_PREFIX)" > $(STAGE)/opts.make; \
	echo "NAME = $(PKG_NAME)" >> $(STAGE)/opts.make; \
	echo "VERSION = $(PKG_FULLVERSION)" >> $(STAGE)/opts.make; \
	echo "MPICC = $(MPICC)" >> $(STAGE)/opts.make; \
	echo "CC = $(CC)" >> $(STAGE)/opts.make; \
	echo "CFLAGS = $(CFLAGS)" >> $(STAGE)/opts.make; \
	echo "LDFLAGS = $(LDFLAGS)" >> $(STAGE)/opts.make; \
	echo "LIBS = $(LIBS)" >> $(STAGE)/opts.make


pkg-configure :
	@echo "" > /dev/null


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



