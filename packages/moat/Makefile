
# System configuration

include ../../system/$(TARGET).make
include ../../system/defaults.make

# Package parameters

PKG_NAME = moat

PKG_VERSION = f62ff7f

PKG_FORMAT = git
PKG_GIT_CLONE = $(GIT) clone git@github.com:tskisner/MOAT.git
PKG_GIT_CHECKOUT = $(GIT) checkout -b hpcports $(PKG_VERSION) >/dev/null 2>&1; ./autogen.sh

PKG_SRCDIR = MOAT

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	dyn="--disable-shared"; \
	if [ "x$(BUILD_DYNAMIC)" = "xTRUE" ]; then \
		dyn=""; \
	fi; \
	if [ "x$(VENDOR)" = "xapple" ]; then \
		CC="$(CC)" CFLAGS="$(CFLAGS)" \
		CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
		F77="$(F77)" FFLAGS="$(FFLAGS)" \
		MPICXX="$(MPICXX)" \
		./configure \
		$${dyn} \
		--with-fftw-cpp=no \
		--with-accelerate-cpp=$(APPLE_CPPFLAGS) \
		--with-accelerate-libs="$(APPLE_LDFLAGS) $(APPLE_LIBS_CXX)" \
		--with-papi-cpp=no \
		--with-boost=$(boost_PREFIX) \
		--prefix=$(PREFIX)/$(PKG_NAME)-$(PKG_VERSION); \
	fi; \
	if [ "x$(VENDOR)" = "xamd" ]; then \
		CC="$(CC)" CFLAGS="$(CFLAGS)" \
		CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
		F77="$(F77)" FFLAGS="$(FFLAGS)" \
		MPICXX="$(MPICXX)" \
		./configure \
		$${dyn} \
		--with-fftw-cpp=no \
		--with-acml-cpp=$(AMD_CPPFLAGS) \
		--with-acml-libs="$(AMD_LDFLAGS) $(AMD_LIBS_CXX)" \
		--with-papi-cpp=no \
		--with-boost=$(boost_PREFIX) \
		--prefix=$(PREFIX)/$(PKG_NAME)-$(PKG_VERSION); \
	fi; \
	if [ "x$(VENDOR)" = "xintel" ]; then \
		CC="$(CC)" CFLAGS="$(CFLAGS)" \
		CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
		F77="$(F77)" FFLAGS="$(FFLAGS)" \
		MPICXX="$(MPICXX)" \
		./configure \
		$${dyn} \
		--with-fftw-cpp=no \
		--with-mkl-cpp=$(INTEL_CPPFLAGS) \
		--with-mkl-libs="$(INTEL_LDFLAGS) $(INTEL_LIBS_CXX)" \
		--with-papi-cpp=no \
		--with-boost=$(boost_PREFIX) \
		--prefix=$(PREFIX)/$(PKG_NAME)-$(PKG_VERSION); \
	fi; \
	if [ "x$(VENDOR)" = "x" ]; then \
		CC="$(CC)" CFLAGS="$(CFLAGS)" \
		CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
		F77="$(F77)" FFLAGS="$(FFLAGS)" \
		MPICXX="$(MPICXX)" \
		./configure \
		$${dyn} \
		--with-fftw-cpp=$(fftw_CPPFLAGS) \
		--with-papi-cpp=no \
		--with-boost=$(boost_PREFIX) \
		--prefix=$(PREFIX)/$(PKG_NAME)-$(PKG_VERSION); \
	fi


pkg-preinstall :
	@echo "" > /dev/null


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



