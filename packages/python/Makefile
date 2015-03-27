
include ../pkg_defs.make

# Package parameters

PKG_NAME = python

PKG_FORMAT = tar
PKG_TAR = Python-$(PKG_VERSION).tgz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) https://www.python.org/ftp/python/$(PKG_VERSION)/Python-$(PKG_VERSION).tgz

PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = Python-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_gcc_test.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	host=""; \
	if [ "x$(HPCP_CROSS_HOST)" != "x" ]; then \
		host="--host=$(HPCP_CROSS_HOST)"; \
	fi; \
	dyn="--enable-shared"; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="--disable-shared"; \
	fi; \
	nognu="--without-gcc"; \
	if [ "x$(TOOLCHAIN)" = "xgnu" ]; then \
		nognu=""; \
	fi; \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	OPT="$(CFLAGS)" \
	CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
	CPPFLAGS="-I$(sqlite_PREFIX)/include -I$(readline_PREFIX)/include -I$(tk_PREFIX)/include -I$(tcl_PREFIX)/include -I$(bzip2_PREFIX)/include -I$(openssl_PREFIX)/include" \
	LDFLAGS="$(LDFLAGS) -L$(sqlite_PREFIX)/lib -L$(readline_PREFIX)/lib -L$(tk_PREFIX)/lib -L$(tcl_PREFIX)/lib -L$(bzip2_PREFIX)/lib -L$(openssl_PREFIX)/lib" \
	LIBS="$(sqlite_LIBS_CC) $(readline_LIBS_CC) $(termcap_LIBS_CC) $(tk_LIBS_CC) $(tcl_LIBS_CC) $(bzip2_LIBS_CC) $(openssl_LIBS_CC) $(LIBS)" \
	./configure $${dyn} $${nognu} $${host} \
	--disable-toolbox-glue \
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



