
include ../pkg_defs.make

# Package parameters

PKG_NAME = boost

PKG_FORMAT = tar
PKG_TAR = boost_1_55_0.tar.bz2
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.tar.bz2/download
PKG_TAR_EXTRACT = $(BXTAR)

PKG_SRCDIR = boost_1_55_0

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = 


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	pyopt="--with-python=python"; \
	boostchain=""; \
	echo "" > tools/build/v2/user-config.jam; \
	if [ "x$(TOOLCHAIN)" = "xgnu" ]; then \
		echo "using gcc : : $(CXX) : <cflags>\"$(CFLAGS)\" <cxxflags>\"$(CXXFLAGS)\" ;" >> tools/build/v2/user-config.jam; \
		boostchain="gcc"; \
	fi; \
	if [ "x$(TOOLCHAIN)" = "xdarwin" ]; then \
		echo "using darwin : : $(CXX) : <cflags>\"$(CFLAGS)\" <cxxflags>\"$(CXXFLAGS)\" <linkflags>\"-stdlib=libc++\" ;" >> tools/build/v2/user-config.jam; \
		sed -i "" -E "s|-install_name \"|-install_name \"$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/|" tools/build/v2/tools/darwin.jam; \
		boostchain="darwin"; \
	fi; \
	if [ "x$(TOOLCHAIN)" = "xintel" ]; then \
		echo "using intel-linux : : $(CXX) : <cflags>\"$(CFLAGS)\" <cxxflags>\"$(CXXFLAGS)\" ;" >> tools/build/v2/user-config.jam; \
		boostchain="intel-linux"; \
	fi; \
	echo "using mpi : \"$(MPICXX)\" ;" >> tools/build/v2/user-config.jam; \
	echo "" >> tools/build/v2/user-config.jam; \
	./bootstrap.sh $${pyopt} --with-toolset=$${boostchain} --prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


pkg-build :
	@echo "" >/dev/null


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	opts="variant=release "; \
	if [ "x$(BUILD_DYNAMIC)" = "xTRUE" ]; then \
		opts="$${opts}link=shared runtime-link=shared"; \
	else \
		opts="$${opts}link=static runtime-link=static"; \
	fi; \
	./b2 $${opts} --user-config=tools/build/v2/user-config.jam install


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	./b2 --clean


# Include common package rules

include ../pkg.make



