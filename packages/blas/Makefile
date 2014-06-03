
include ../pkg_defs.make

# Package parameters

PKG_NAME = blas

PKG_FORMAT = zip
PKG_ZIP = openblas-v$(PKG_VERSION).zip
PKG_ZIP_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_ZIP) http://github.com/xianyi/OpenBLAS/archive/v$(PKG_VERSION).zip
PKG_ZIP_EXTRACT = $(UZIP)

PKG_SRCDIR = src

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@echo "" > /dev/null


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR)/OpenBLAS-$(PKG_VERSION); \
	threads="USE_OPENMP=1"; \
	if [ "x$(OMPFLAGS)" = "x" ]; then \
		threads="USE_OPENMP=0"; \
	fi; \
	shared=""; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		shared="NO_SHARED=1"; \
	fi; \
	$(MAKE) $${shared} $${threads} \
	NO_LAPACK=1 \
	FC="$(FC)" FCFLAGS="$(FCFLAGS)" \
	CC="$(CC)" CFLAGS="$(CFLAGS)"


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR)/OpenBLAS-$(PKG_VERSION); \
	$(MAKE) PREFIX="$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)" install


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR)/OpenBLAS-$(PKG_VERSION); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



