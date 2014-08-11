
include ../pkg_defs.make

# Package parameters

PKG_NAME = flame

PKG_FORMAT = tar
PKG_TAR = libflame-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://www.cs.utexas.edu/users/flame/snapshots/libflame-$(PKG_VERSION).tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = libflame-$(PKG_VERSION)

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
	dyn="--enable-dynamic-build"; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="--disable-dynamic-build"; \
	fi; \
	fopt="--enable-autodetect-f77-ldflags --enable-autodetect-f77-name-mangling"; \
	if [ "x$(BUILD_FORTRAN)" = "xFALSE" ]; then \
		fopt="--disable-autodetect-f77-ldflags --disable-autodetect-f77-name-mangling"; \
	fi; \
	omp=""; \
	if [ "x$(OMPFLAGS)" != "x" ]; then \
		omp="--enable-multithreading=openmp"; \
	fi; \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	F77="$(F77)" FFLAGS="$(FFLAGS)" \
	LDFLAGS="$(LDFLAGS)" LIBS="$(LIBS) -lm" \
	./configure $${dyn} $${fopt} $${omp} $${host} \
	--disable-builtin-blas \
	--enable-vector-intrinsics=sse \
	--with-cc="$(CC)" \
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



