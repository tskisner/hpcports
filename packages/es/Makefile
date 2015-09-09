
include ../pkg_defs.make

# Package parameters

PKG_NAME = es

PKG_FORMAT = git
PKG_GIT_CLONE = git clone git://github.com/rcthomas/es.git
PKG_GIT_CHECKOUT = git checkout -b hpcports $(PKG_VERSION) >/dev/null 2>&1

PKG_SRCDIR = es

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	./autogen.sh; \
	host=""; \
	if [ "x$(HPCP_CROSS_HOST)" != "x" ]; then \
		host="--host=$(HPCP_CROSS_HOST)"; \
	fi; \
	dyn=""; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="--disable-shared"; \
	fi; \
	lapack="yes"; \
	if [ "x$(lapack_LIBS_CXX)" != "x" ]; then \
		lapack="$(lapack_LIBS_CXX)"; \
	fi; \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
	F77="$(F77)" FFLAGS="$(FFLAGS)" \
	FC="$(FC)" FCFLAGS="$(FCFLAGS)" \
	MPICXX="$(MPICXX)" \
	LIBTOOLFLAGS="$(LIBTOOLFLAGS)" \
	LDFLAGS="$(LDFLAGS)" LIBS="$(LIBS)" \
	FLIBS="$(FLIBS)" \
	./configure $${dyn} $${host} \
	--with-pic \
	--with-blas="$(blas_LIBS_CXX)" \
	--with-lapack="$${lapack}" \
	--with-cfitsio-libs="$(cfitsio_LIBS_CXX)" \
	--with-appspack-libs="$(appspack_LIBS_CXX)" \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) LIBTOOLFLAGS="$(LIBTOOLFLAGS)"


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) LIBTOOLFLAGS="$(LIBTOOLFLAGS)" install; \
	cd $(STAGE)/$(PKG_BUILDDIR)/python; \
	mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/$(python_SITE)/site-packages; \
	export PYTHONPATH="$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/$(python_SITE)/site-packages:$(PYTHONPATH)"; \
	python setup.py install --prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean; \
	cd $(STAGE)/$(PKG_BUILDDIR)/python; \
	python setup.py clean


# Include common package rules

include ../pkg.make



