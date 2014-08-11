
include ../pkg_defs.make

# Package parameters

PKG_NAME = tk

PKG_FORMAT = tar
PKG_TAR = tk$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://prdownloads.sourceforge.net/tcl/tk$(PKG_VERSION)-src.tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = tk$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_config.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	cd $(STAGE)/$(PKG_BUILDDIR)/unix; \
	$(MAKE) configure; \
	host=""; \
	if [ "x$(HPCP_CROSS_HOST)" != "x" ]; then \
		host="--host=$(HPCP_CROSS_HOST)"; \
	fi; \
	dyn=""; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="--disable-shared"; \
	fi; \
	tcinc=""; \
	if [ "x$(tcl_OVERRIDE)" != "xTRUE" ]; then \
		tcinc="-I$(tcl_PREFIX)/include"; \
	fi; \
	tclink=""; \
	if [ "x$(tcl_OVERRIDE)" != "xTRUE" ]; then \
		tclink="-L$(tcl_PREFIX)/lib"; \
	fi; \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	CPPFLAGS="$${tcinc}" \
	LDFLAGS="$(LDFLAGS) $${tclink}" LIBS="$(LIBS)" \
	./configure $${dyn} $${host} \
	--with-tcl=$(tcl_PREFIX)/bin \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR)/unix; \
	$(MAKE)


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR)/unix; \
	$(MAKE) install; \
	ln -s $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/libtk8.5.so $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/libtk.so


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR)/unix; \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



