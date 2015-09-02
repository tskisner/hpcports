
include ../pkg_defs.make

# Package parameters

PKG_NAME = galsim

PKG_FORMAT = tar
PKG_TAR = GalSim-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) https://github.com/GalSim-developers/GalSim/archive/v$(PKG_VERSION).tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = GalSim-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_shell.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE); \
	mkdir -p $(PKG_BUILDDIR)


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	boost=""; \
	if [ "x$(boost_PREFIX)" != "x" ]; then \
		boost="BOOST_DIR=$(boost_PREFIX)"; \
	fi; \
	fftw=""; \
	if [ "x$(fftw_PREFIX)" != "x" ]; then \
		fftw="FFTW_DIR=$(fftw_PREFIX)"; \
	fi; \
	tmv=""; \
	if [ "x$(tmv_PREFIX)" != "x" ]; then \
		tmv="TMV_DIR=$(tmv_PREFIX)"; \
	fi; \
	py=""; \
	if [ "x$(python_PREFIX)" != "x" ]; then \
		py="PYTHON=$(python_PREFIX)/bin/python"; \
	fi; \
	scons \
	PREFIX=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION) \
	CXX="$(CXX)" FLAGS="$(CXXFLAGS)" $${boost} $${fftw} $${tmv} $${py}


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	scons \
	PREFIX=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION) \
	install


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	scons -c


# Include common package rules

include ../pkg.make


