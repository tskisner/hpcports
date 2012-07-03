
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = readline

PKG_FORMAT = tar
PKG_TAR = readline-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) ftp://ftp.gnu.org/gnu/readline/readline-6.2.tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = readline-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_readline_shlib.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	dyn="--enable-shared --disable-static"; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="--disable-shared --enable-static"; \
	fi; \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	LIBS="$(LIBS)" \
	./configure \
	$${dyn} \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION)


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



