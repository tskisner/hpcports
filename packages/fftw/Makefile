
# System configuration

include ../../system/$(TARGET).make
include ../../system/defaults.make

# Package parameters

PKG_NAME = fftw

PKG_VERSION = 3.3.2

PKG_FORMAT = tar
PKG_TAR = fftw-3.3.2.tar.gz
PKG_TAR_FETCH = curl http://fftw.org/fftw-3.3.2.tar.gz -o $(POOL)/$(PKG_TAR)
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = fftw-3.3.2

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
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	F77="$(F77)" FFLAGS="$(FFLAGS)" \
	MPICC="$(MPICC)" \
	./configure \
	--enable-threads --enable-mpi $${dyn} \
	--prefix=$(PREFIX)/$(PKG_NAME)-$(PKG_VERSION)


pkg-preinstall :
	@echo "" > /dev/null


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



