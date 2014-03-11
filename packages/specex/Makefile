
include ../pkg_defs.make

# Package parameters

PKG_NAME = specex

PKG_FORMAT = git
PKG_GIT_CLONE = git clone git@github.com:julienguy/specex.git
PKG_GIT_CHECKOUT = git checkout -b hpcports $(PKG_VERSION) >/dev/null 2>&1

PKG_SRCDIR = specex

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	PKG_CONFIG_PATH="$(PKG_CONFIG_PATH):." \
	./waf configure \
	--debug=False \
	--optimize=3 \
	--enable-openmp=True \
	--autogen-harp-pkgconfig="." \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	./waf


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	./waf install; \
	ln -s $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/libharp_plugin_specex.so $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/harp_plugin_specex.so


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	./waf clean


# Include common package rules

include ../pkg.make



