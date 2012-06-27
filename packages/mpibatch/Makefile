
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

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
	echo "VERSION = $(PKG_VERSION)" >> $(STAGE)/opts.make; \
	echo "MPICC = $(MPICC)" >> $(STAGE)/opts.make; \
	echo "CFLAGS = $(CFLAGS)" >> $(STAGE)/opts.make; \
	echo "LDFLAGS = $(LDFLAGS)" >> $(STAGE)/opts.make; \
	echo "LIBS = $(LIBS)" >> $(STAGE)/opts.make


pkg-configure :
	@echo "" > /dev/null


pkg-preinstall :
	@echo "" > /dev/null


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



