
include ../pkg_defs.make

# Package parameters

PKG_NAME = mpi4py

PKG_FORMAT = tar
PKG_TAR = mpi4py-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) https://pypi.python.org/packages/source/m/mpi4py/mpi4py-$(PKG_VERSION).tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = mpi4py-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	cd $(STAGE)/$(PKG_BUILDDIR); \
	echo "[config]" > setup.cfg; \
	echo "mpicc = $(MPICC)" >> setup.cfg; \
	echo "mpicxx = $(MPICXX)" >> setup.cfg; \
	echo "mpif77 = $(MPIF77)" >> setup.cfg; \
	echo "mpif90 = $(MPIFC)" >> setup.cfg; \
	echo "mpif95 = $(MPIFC)" >> setup.cfg; \
	echo "" >> setup.cfg; \
	echo "[build]" >> setup.cfg; \
	echo "debug = 0" >> setup.cfg; \
	echo "" >> setup.cfg; \
	echo "[install]" >> setup.cfg; \
	echo "optimize = 1" >> setup.cfg; \
	echo "" >> setup.cfg


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	python setup.py build


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	export PYTHONPATH="$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/$(python_SITE)/site-packages:$(PYTHONPATH)"; \
	python setup.py install --prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION); \
	python setup.py install_exe --install-dir=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/bin


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	python setup.py clean


# Include common package rules

include ../pkg.make



