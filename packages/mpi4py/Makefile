
include ../pkg_defs.make

# Package parameters

PKG_NAME = mpi4py

PKG_FORMAT = tar
PKG_TAR = mpi4py-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) https://github.com/mpi4py/mpi4py/archive/$(PKG_VERSION).tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = mpi4py-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	cd $(STAGE)/$(PKG_BUILDDIR); \
	lib=`echo $(MPILIBS) | sed -e "s#-l##g"`; \
	echo "[hpcp]" >> mpi.cfg; \
	echo "mpicc = $(MPICC)" >> mpi.cfg; \
	echo "mpicxx = $(MPICXX)" >> mpi.cfg; \
	echo "include_dirs = $(MPICPPFLAGS)" >> mpi.cfg; \
	echo "library_dirs = $(MPILDFLAGS)" >> mpi.cfg; \
	echo "runtime_library_dirs = $(MPILDFLAGS)" >> mpi.cfg; \
	echo "libraries = $${lib}" >> mpi.cfg; \
	echo "" >> mpi.cfg


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	python setup.py build --mpi=hpcp


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



