
include ../pkg_defs.make

# Package parameters

PKG_NAME = healpix

PKG_FORMAT = tar
PKG_TAR = healpix-autotools-3.30.1.tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://github.com/tskisner/healpix-autotools/releases/download/v3.30.1/healpix-autotools-3.30.1.tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = healpix-autotools-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = 

# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	host=""; \
	if [ "x$(HPCP_CROSS_HOST)" != "x" ]; then \
		host="--host=$(HPCP_CROSS_HOST)"; \
	fi; \
	dyn=""; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="--disable-shared --enable-static --enable-all-static"; \
	fi; \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
	FC="$(FC)" FCFLAGS="$(FCFLAGS)" \
	MPICC="$(MPICC)" \
	MPICXX="$(MPICXX)" \
	MPIFC="$(MPIFC)" \
	FCLIBS="$(FCLIBS)" \
	LDFLAGS="$(LDFLAGS)" LIBS="$(LIBS)" \
	./configure $${dyn} $${host} \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION) \
	--with-cfitsio=$(cfitsio_PREFIX)


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE)


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	mkdir -p "$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/$(python_SITE)/site-packages"; \
	export CPATH="$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/include:$(CPATH)"; \
	export PYTHONPATH="$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/$(python_SITE)/site-packages:$(PYTHONPATH)"; \
	$(MAKE) install


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



