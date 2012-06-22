
# System configuration

include ../../system/$(TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell git rev-parse --short HEAD)

# Package parameters

PKG_NAME = hpcp

PKG_FORMAT = none

PKG_SRCDIR = hpcp

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@mkdir -p $(STAGE); \
	echo "PREFIX = $(PREFIX)" > $(STAGE)/opts.make; \
	echo "NAME = $(PKG_NAME)" >> $(STAGE)/opts.make; \
	echo "VERSION = $(PKG_VERSION)" >> $(STAGE)/opts.make; \
	echo "setenv HPCP_CC \"$(CC)\"" > $(STAGE)/base.module; \
	echo "setenv HPCP_CXX \"$(CXX)\"" >> $(STAGE)/base.module; \
	echo "setenv HPCP_F77 \"$(F77)\"" >> $(STAGE)/base.module; \
	echo "setenv HPCP_FC \"$(FC)\"" >> $(STAGE)/base.module; \
	echo "setenv HPCP_MPICC \"$(MPICC)\"" >> $(STAGE)/base.module; \
	echo "setenv HPCP_MPICXX \"$(MPICXX)\"" >> $(STAGE)/base.module; \
	echo "setenv HPCP_MPIF77 \"$(MPIF77)\"" >> $(STAGE)/base.module; \
	echo "setenv HPCP_MPIFC \"$(MPIFC)\"" >> $(STAGE)/base.module; \
	echo "setenv HPCP_CFLAGS \"$(CFLAGS)\"" >> $(STAGE)/base.module; \
	echo "setenv HPCP_CXXFLAGS \"$(CXXFLAGS)\"" >> $(STAGE)/base.module; \
	echo "setenv HPCP_FFLAGS \"$(FFLAGS)\"" >> $(STAGE)/base.module; \
	echo "setenv HPCP_FCFLAGS \"$(FCFLAGS)\"" >> $(STAGE)/base.module; \
	echo "setenv HPCP_OMPFLAGS \"$(OMPFLAGS)\"" >> $(STAGE)/base.module; \
	echo "setenv HPCP_FLIBS \"$(FLIBS)\"" >> $(STAGE)/base.module; \
	echo "setenv HPCP_FCLIBS \"$(FCLIBS)\"" >> $(STAGE)/base.module; \
	echo "setenv HPCP_MPIFLIBS \"$(MPIFLIBS)\"" >> $(STAGE)/base.module; \
	echo "setenv HPCP_MPIFCLIBS \"$(MPIFCLIBS)\"" >> $(STAGE)/base.module; \
	echo "setenv HPCP_VENDOR \"$(VENDOR)\"" >> $(STAGE)/base.module; \
	if [ "x$(VENDOR)" = "xapple" ]; then \
		echo "setenv HPCP_VENDOR_CPPFLAGS \"$(APPLE_CPPFLAGS)\"" >> $(STAGE)/base.module; \
		echo "setenv HPCP_VENDOR_LDFLAGS \"$(APPLE_LDFLAGS)\"" >> $(STAGE)/base.module; \
		echo "setenv HPCP_VENDOR_LIBS_CC \"$(APPLE_LIBS_CC)\"" >> $(STAGE)/base.module; \
		echo "setenv HPCP_VENDOR_LIBS_CXX \"$(APPLE_LIBS_CXX)\"" >> $(STAGE)/base.module; \
		echo "setenv HPCP_VENDOR_LIBS_F77 \"$(APPLE_LIBS_F77)\"" >> $(STAGE)/base.module; \
		echo "setenv HPCP_VENDOR_LIBS_FC \"$(APPLE_LIBS_FC)\"" >> $(STAGE)/base.module; \
	fi; \
	if [ "x$(VENDOR)" = "xamd" ]; then \
		echo "setenv HPCP_VENDOR_CPPFLAGS \"$(AMD_CPPFLAGS)\"" >> $(STAGE)/base.module; \
		echo "setenv HPCP_VENDOR_LDFLAGS \"$(AMD_LDFLAGS)\"" >> $(STAGE)/base.module; \
		echo "setenv HPCP_VENDOR_LIBS_CC \"$(AMD_LIBS_CC)\"" >> $(STAGE)/base.module; \
		echo "setenv HPCP_VENDOR_LIBS_CXX \"$(AMD_LIBS_CXX)\"" >> $(STAGE)/base.module; \
		echo "setenv HPCP_VENDOR_LIBS_F77 \"$(AMD_LIBS_F77)\"" >> $(STAGE)/base.module; \
		echo "setenv HPCP_VENDOR_LIBS_FC \"$(AMD_LIBS_FC)\"" >> $(STAGE)/base.module; \
	fi; \
	if [ "x$(VENDOR)" = "xintel" ]; then \
		echo "setenv HPCP_VENDOR_CPPFLAGS \"$(INTEL_CPPFLAGS)\"" >> $(STAGE)/base.module; \
		echo "setenv HPCP_VENDOR_LDFLAGS \"$(INTEL_LDFLAGS)\"" >> $(STAGE)/base.module; \
		echo "setenv HPCP_VENDOR_LIBS_CC \"$(INTEL_LIBS_CC)\"" >> $(STAGE)/base.module; \
		echo "setenv HPCP_VENDOR_LIBS_CXX \"$(INTEL_LIBS_CXX)\"" >> $(STAGE)/base.module; \
		echo "setenv HPCP_VENDOR_LIBS_F77 \"$(INTEL_LIBS_F77)\"" >> $(STAGE)/base.module; \
		echo "setenv HPCP_VENDOR_LIBS_FC \"$(INTEL_LIBS_FC)\"" >> $(STAGE)/base.module; \
	fi


pkg-configure :
	@echo "" > /dev/null


pkg-preinstall :
	@echo "" > /dev/null


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



