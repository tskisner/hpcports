
# System configuration

include ../../system/$(TARGET).make
include ../../system/defaults.make

# Package parameters

PKG_NAME = boost

PKG_VERSION = 1.49.0

PKG_FORMAT = tar
PKG_TAR = boost_1_49_0.tar.bz2
PKG_TAR_FETCH = $(WGET) -O $(POOL)/$(PKG_TAR) http://sourceforge.net/projects/boost/files/boost/1.49.0/boost_1_49_0.tar.bz2/download
PKG_TAR_EXTRACT = $(BXTAR)

PKG_SRCDIR = boost_1_49_0

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_boost_make.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	pyopt="--with-python=no"; \
	if [ "x$(PYTHON)" != "x" ]; then \
		pyopt="--with-python=$(PYTHON)"; \
	fi; \
	boostchain=""; \
	if [ "x$(TOOLCHAIN)" = "xgnu" ]; then \
		echo "using gcc : : $(CXX) : cflags=\"$(CFLAGS)\" cxxflags=\"$(CXXFLAGS)\" " > tools/build/v2/user-config.jam; \
		boostchain="gcc"; \
	fi; \
	if [ "x$(TOOLCHAIN)" = "xdarwin" ]; then \
		echo "using darwin : : $(CXX) : cflags=\"$(CFLAGS)\" cxxflags=\"$(CXXFLAGS)\" " > tools/build/v2/user-config.jam; \
		boostchain="darwin"; \
	fi; \
	if [ "x$(TOOLCHAIN)" = "xintel" ]; then \
		echo "using intel : : $(CXX) : cflags=\"$(CFLAGS)\" cxxflags=\"$(CXXFLAGS)\" " > tools/build/v2/user-config.jam; \
		boostchain="intel"; \
	fi; \
	opts="variant=release "; \
	if [ "x$(BUILD_DYNAMIC)" = "xTRUE" ]; then \
		opts="$${opts}link=shared runtime-link=shared"; \
	else \
		opts="$${opts}link=static runtime-link=static"; \
	fi; \
	echo "OPTS = $${opts}" > hpcp_opts.make; \
	./bootstrap.sh $${pyopt} --with-toolset=$${boostchain} --prefix=$(PREFIX)/$(PKG_NAME)-$(PKG_VERSION)

	
pkg-preinstall :
	@echo "" > /dev/null


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



