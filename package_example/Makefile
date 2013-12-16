
include ../pkg_defs.make

# Package parameters

PKG_NAME = example

# This is a simple tarball format.  See the moat package for
# an example of using a git checkout.  See the cmb package
# for an example of a package which exists entirely within
# HPCPorts.

PKG_FORMAT = tar

# The name of the package after download.  The PKG_VERSION
# variable has the contents of the "version" text file in
# the package directory.

PKG_TAR = example-$(PKG_VERSION).tar.bz2

# The command to download the package to the HPCP_POOL directory

PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://mypackages.com/download/example-$(PKG_VERSION).tar.bz2

# The command to run to extract the tarball.  defined in
# system/defaults.make or $HPCP_HOST.make.

PKG_TAR_EXTRACT = $(BXTAR)

# The name of the extracted source directory

PKG_SRCDIR = example-$(PKG_VERSION)

# The directory to build in.

PKG_BUILDDIR = $(PKG_SRCDIR)

# A list of patch files to be applied with "patch -p1 < (file)"

PKG_PATCHES =


# Custom rules for this package

# Commands to run before fetching the source

pkg-prefetch :
	@echo "" > /dev/null

# Run arbitrary configuration commands so that the source tree
# is prepared to support the "make" and "make install" commands.

pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	dyn=""; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="--disable-shared"; \
	fi; \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
	F77="$(F77)" FFLAGS="$(FFLAGS)" \
	FC="$(FC)" FCFLAGS="$(FCFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	./configure $${dyn} \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)

# Commands to run before installation

pkg-preinstall :
	@echo "" > /dev/null

# Commands to clean the build directory of any built files
# that were created by running "make"

pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



