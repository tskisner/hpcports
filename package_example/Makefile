
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version.  This can be a simple static string like
# below, stored in the "version" file, or it can be generated 
# from an arbitrary shell command.  See the cmb package for 
# an example.

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = example

# This is a simple tarball format.  See the moat package for
# an example of using a git checkout.  See the cmb package
# for an example of a package which exists entirely within
# HPCPorts.

PKG_FORMAT = tar

# the name of the package after download
PKG_TAR = curl-$(PKG_VERSION).tar.bz2

# the command to download the package to the HPCP_POOL directory
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://curl.haxx.se/download/curl-$(PKG_VERSION).tar.bz2

# the command to run to extract the tarball.  defined in
# system/defaults.make or $HPCP_TARGET.make.
PKG_TAR_EXTRACT = $(BXTAR)

# the name of the extracted source directory
PKG_SRCDIR = curl-$(PKG_VERSION)

# the directory to build in.
PKG_BUILDDIR = $(PKG_SRCDIR)

# a list of patch files to be applied with "patch -p1 < (file)"
PKG_PATCHES =


# Custom rules for this package

# commands to run before fetching the source
pkg-prefetch :
	@echo "" > /dev/null

# run arbitrary configuration commands so that the source tree
# is prepared to support the "make" and "make install" commands.
pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	dyn=""; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="--disable-shared"; \
	fi; \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
	F77="$(F77)" FFLAGS="$(FFLAGS)" \
	FC="$(FC)" FCFLAGS="$(FCFLAGS)" \
	./configure \
	$${dyn} \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION)

# commands to run before installation
pkg-preinstall :
	@echo "" > /dev/null

# commands to clean the build directory of any built files
# that were created by running "make"
pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



