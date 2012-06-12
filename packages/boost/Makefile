
# System configuration

include ../../system/$(TARGET).make
include ../../system/defaults.make

# Package parameters

PKG_NAME = boost

PKG_VERSION = 1.49.0

PKG_FORMAT = tar
PKG_TAR = boost_1_49_0.tar.bz2
PKG_TAR_FETCH = $(CURL) -L http://sourceforge.net/projects/boost/files/boost/1.49.0/boost_1_49_0.tar.bz2/download -o $(POOL)/$(PKG_TAR)
PKG_TAR_EXTRACT = $(BXTAR)

PKG_SRCDIR = boost_1_49_0

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_boost_make.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	if [ "x$(TOOLCHAIN)" = "xgnu" ]; then \
		echo "using gcc : : $(CXX) : cflags=$(CFLAGS) cxxflags=$(CXXFLAGS) " > user-config.jam \
	fi; \
	if [ "x$(TOOLCHAIN)" = "xintel" ]; then \
		echo "using intel-linux : : $(CXX) : cflags=$(CFLAGS) cxxflags=$(CXXFLAGS) " > user-config.jam \
	fi; \
	opts="variant=release "; \
	if [ "x$(BUILD_DYNAMIC)" = "xTRUE" ]; then \
		opts="$${opts}link=shared runtime-link=shared"; \
	else \
		opts="$${opts}link=static runtime-link=static"; \
	fi; \
	./bootstrap.sh --prefix=$(PREFIX)/$(PKG_NAME)-$(PKG_VERSION); \
	echo "OPTS = \"$${opts}\"" > hpcp_opts.make


pkg-preinstall :
	@echo "" > /dev/null


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



