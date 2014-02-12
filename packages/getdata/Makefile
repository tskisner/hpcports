
include ../pkg_defs.make

# Package parameters

PKG_NAME = getdata

PKG_FORMAT = tar
PKG_TAR = getdata-$(PKG_VERSION).tar.bz2
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://sourceforge.net/projects/getdata/files/getdata/$(PKG_VERSION)/getdata-$(PKG_VERSION).tar.bz2/download
PKG_TAR_EXTRACT = $(BXTAR)

PKG_SRCDIR = getdata-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = 


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	dyn=""; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="--disable-shared --disable-python --disable-perl"; \
	fi; \
	fort=""; \
	if [ "x$(BUILD_FORTRAN)" = "xFALSE" ]; then \
		fort="--disable-fortran --disable-fortran95"; \
	fi; \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
	F77="$(F77)" FFLAGS="$(FFLAGS)" \
	FC="$(FC)" FCFLAGS="$(FCFLAGS)" \
	FLIBS="$(FLIBS)" FCLIBS="$(FCLIBS)" \
	LDFLAGS="$(LDFLAGS)" LIBS="$(LIBS)" \
	./configure $${dyn} $${fort} \
	--with-pic \
	--disable-legacy-api \
	--disable-perl \
	--with-libbz2="$(bzip2_PREFIX)" \
	--with-libz="$(zlib_PREFIX)" \
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



