
include ../pkg_defs.make

# Package parameters

PKG_NAME = clapack

PKG_FORMAT = tar
PKG_TAR = clapack-$(PKG_VERSION)-CMAKE.tgz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://www.netlib.org/clapack/clapack-$(PKG_VERSION)-CMAKE.tgz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = clapack-$(PKG_VERSION)-CMAKE

PKG_BUILDDIR = build

PKG_PATCHES = 


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE); \
	mkdir -p $(PKG_BUILDDIR); \
	cd $(PKG_BUILDDIR); \
	cmake \
	-D CMAKE_C_COMPILER="$(CC)" \
	-D CMAKE_C_FLAGS="$(CFLAGS)" \
	-D CMAKE_INSTALL_PREFIX=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION) \
	../$(PKG_SRCDIR)


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE)


pkg-install :
	@mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/include; \
	mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib; \
	cp $(STAGE)/$(PKG_SRCDIR)/INCLUDE/f2c.h $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/include; \
	echo '#include <f2c.h>' > $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/include/clapack.h; \
	cat $(STAGE)/$(PKG_SRCDIR)/INCLUDE/clapack.h >> $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/include/clapack.h; \
	cp $(STAGE)/$(PKG_BUILDDIR)/F2CLIBS/libf2c/libf2c.a $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib; \
	cp $(STAGE)/$(PKG_BUILDDIR)/SRC/liblapack.a $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



