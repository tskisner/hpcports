
include ../pkg_defs.make

# Package parameters

PKG_NAME = boost

PKG_FORMAT = tar
PKG_TAR = boost_1_57_0.tar.bz2
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://sourceforge.net/projects/boost/files/boost/1.57.0/boost_1_57_0.tar.bz2/download
PKG_TAR_EXTRACT = $(BXTAR)

PKG_SRCDIR = boost_1_57_0

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = shptr_helper.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	jampath="tools/build/user-config.jam"; \
	boostchain=""; \
	echo "" > $${jampath}; \
	if [ "x$(TOOLCHAIN)" = "xgnu" ]; then \
		echo "using gcc : : $(CXX) : <cflags>\"$(CFLAGS)\" <cxxflags>\"$(CXXFLAGS)\" ;" >> $${jampath}; \
		boostchain="gcc"; \
	fi; \
	if [ "x$(TOOLCHAIN)" = "xdarwin" ]; then \
		echo "using darwin : : $(CXX) : <cflags>\"$(CFLAGS)\" <cxxflags>\"$(CXXFLAGS)\" <linkflags>\"-stdlib=libc++\" ;" >> $${jampath}; \
		sed -i "" -E "s|-install_name \"|-install_name \"$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/|" tools/build/tools/darwin.jam; \
		boostchain="darwin"; \
	fi; \
	if [ "x$(TOOLCHAIN)" = "xintel" ]; then \
		echo "using intel-linux : : $(CXX) : <cflags>\"$(CFLAGS)\" <cxxflags>\"$(CXXFLAGS)\" ;" >> $${jampath}; \
		boostchain="intel-linux"; \
	fi; \
	if [ "x$(MPILIBS)" != "x" ]; then \
		mpicppflags=""; \
		if [ "x$(MPICPPFLAGS)" != "x" ]; then \
			mpicppflags="<include>$(MPICPPFLAGS)"; \
		fi; \
		mpildflags=""; \
		if [ "x$(MPILDFLAGS)" != "x" ]; then \
			mpildflags="<library-path>$(MPILDFLAGS)"; \
		fi; \
		mpilib=""; \
		if [ "x$(BUILD_DYNAMIC)" = "xTRUE" ]; then \
			mpilib=""; \
			if [ "x$(MPILIBS)" != "x" ]; then \
				mpilib=`echo "$(MPICXXLIBS) $(MPILIBS)" | sed -e "s#-l#<find-shared-library>#g"`; \
			fi; \
		else \
			mpilib=`echo "$(MPICXXLIBS) $(MPILIBS)" | sed -e "s#-l#<find-static-library>#g"`; \
		fi; \
		echo "using mpi : $(MPICXX) : $${mpicppflags} $${mpildflags} $${mpilib} ;" >> $${jampath}; \
	else \
		echo "using mpi ;" >> $${jampath}; \
	fi; \
	echo "" >> $${jampath}; \
	BOOST_BUILD_USER_CONFIG=$${jampath} ./bootstrap.sh --with-toolset=$${boostchain} --prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


pkg-build :
	@echo "" >/dev/null


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	jampath="tools/build/user-config.jam"; \
	opts="--layout=tagged variant=release threading=multi "; \
	if [ "x$(BUILD_DYNAMIC)" = "xTRUE" ]; then \
		opts="$${opts}link=shared runtime-link=shared"; \
	else \
		opts="$${opts}link=static runtime-link=static"; \
	fi; \
	BOOST_BUILD_USER_CONFIG=$${jampath} ./b2 $${opts} install


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	./b2 --clean


# Include common package rules

include ../pkg.make



