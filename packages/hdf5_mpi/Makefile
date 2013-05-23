
include ../pkg_defs.make

# Package parameters

PKG_NAME = hdf5_mpi

PKG_FORMAT = tar
PKG_TAR = hdf5-$(PKG_VERSION).tar.bz2
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://www.hdfgroup.org/ftp/HDF5/current/src/hdf5-$(PKG_VERSION).tar.bz2
PKG_TAR_EXTRACT = $(BXTAR)

PKG_SRCDIR = hdf5-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	dyn=""; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="--disable-shared"; \
	fi; \
	CC="$(MPICC)" CFLAGS="$(CFLAGS)" \
	CXX="$(MPICXX)" CXXFLAGS="$(CXXFLAGS)" \
	FC="$(MPIFC)" FCFLAGS="$(FCFLAGS)" \
	LDFLAGS="$(LDFLAGS)" LIBS="$(LIBS)" \
	./configure $${dyn} \
	--enable-parallel --disable-threadsafe \
	--enable-fortran --enable-fortran2003 \
	--with-zlib="$(zlib_PREFIX)" \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


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



