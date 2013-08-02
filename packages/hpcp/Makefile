
include ../pkg_defs.make

# Package parameters

PKG_NAME = hpcp

PKG_FORMAT = none

PKG_SRCDIR = hpcp

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@mkdir -p $(STAGE); \
	echo "setenv HPCP_CC \"$(CC)\"" > $(STAGE)/base.module; \
	echo "export HPCP_CC=\"$(CC)\"" > $(STAGE)/base.sh; \
	echo "setenv HPCP_CXX \"$(CXX)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_CXX=\"$(CXX)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_F77 \"$(F77)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_F77=\"$(F77)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_FC \"$(FC)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_FC=\"$(FC)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_MPICC \"$(MPICC)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_MPICC=\"$(MPICC)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_MPICXX \"$(MPICXX)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_MPICXX=\"$(MPICXX)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_MPIF77 \"$(MPIF77)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_MPIF77=\"$(MPIF77)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_MPIFC \"$(MPIFC)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_MPIFC=\"$(MPIFC)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_CFLAGS \"$(CFLAGS)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_CFLAGS=\"$(CFLAGS)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_CXXFLAGS \"$(CXXFLAGS)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_CXXFLAGS=\"$(CXXFLAGS)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_LDFLAGS \"$(LDFLAGS)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_LDFLAGS=\"$(LDFLAGS)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_LIBTOOLFLAGS \"$(LIBTOOLFLAGS)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_LIBTOOLFLAGS=\"$(LIBTOOLFLAGS)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_LIBS \"$(LIBS)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_LIBS=\"$(LIBS)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_FFLAGS \"$(FFLAGS)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_FFLAGS=\"$(FFLAGS)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_FCFLAGS \"$(FCFLAGS)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_FCFLAGS=\"$(FCFLAGS)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_OMPFLAGS \"$(OMPFLAGS)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_OMPFLAGS=\"$(OMPFLAGS)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_FLIBS \"$(FLIBS)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_FLIBS=\"$(FLIBS)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_FCLIBS \"$(FCLIBS)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_FCLIBS=\"$(FCLIBS)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_MPIFLIBS \"$(MPIFLIBS)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_MPIFLIBS=\"$(MPIFLIBS)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_MPIFCLIBS \"$(MPIFCLIBS)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_MPIFCLIBS=\"$(MPIFCLIBS)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_TARGET \"$(HPCP_TARGET)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_TARGET=\"$(HPCP_TARGET)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_ENV \"$(HPCP_ENV)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_ENV=\"$(HPCP_ENV)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_TOOLCHAIN \"$(TOOLCHAIN)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_TOOLCHAIN=\"$(TOOLCHAIN)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_VENDOR \"$(VENDOR)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_VENDOR=\"$(VENDOR)\"" >> $(STAGE)/base.sh; \
	echo "setenv HPCP_DYNAMIC \"$(BUILD_DYNAMIC)\"" >> $(STAGE)/base.module; \
	echo "export HPCP_DYNAMIC=\"$(BUILD_DYNAMIC)\"" >> $(STAGE)/base.sh; \
	if [ "x$(VENDOR)" = "xapple" ]; then \
		for val in $(APPLE_INCLUDE); do \
			echo "prepend-path CPATH \"$${val}\"" >> $(STAGE)/base.module; \
			echo "export CPATH=\"$${val}:\$$CPATH\"" >> $(STAGE)/base.sh; \
		done; \
		for val in $(APPLE_LIBDIR); do \
			echo "prepend-path LIBRARY_PATH \"$${val}\"" >> $(STAGE)/base.module; \
			echo "export LIBRARY_PATH=\"$${val}:\$$LIBRARY_PATH\"" >> $(STAGE)/base.sh; \
			echo "prepend-path LD_LIBRARY_PATH \"$${val}\"" >> $(STAGE)/base.module; \
			echo "export LD_LIBRARY_PATH=\"$${val}:\$$LD_LIBRARY_PATH\"" >> $(STAGE)/base.sh; \
		done; \
		echo "setenv HPCP_VENDOR_LIBS_CC \"$(APPLE_LIBS_CC)\"" >> $(STAGE)/base.module; \
		echo "export HPCP_VENDOR_LIBS_CC=\"$(APPLE_LIBS_CC)\"" >> $(STAGE)/base.sh; \
		echo "setenv HPCP_VENDOR_LIBS_CXX \"$(APPLE_LIBS_CXX)\"" >> $(STAGE)/base.module; \
		echo "export HPCP_VENDOR_LIBS_CXX=\"$(APPLE_LIBS_CXX)\"" >> $(STAGE)/base.sh; \
		echo "setenv HPCP_VENDOR_LIBS_F77 \"$(APPLE_LIBS_F77)\"" >> $(STAGE)/base.module; \
		echo "export HPCP_VENDOR_LIBS_F77=\"$(APPLE_LIBS_F77)\"" >> $(STAGE)/base.sh; \
		echo "setenv HPCP_VENDOR_LIBS_FC \"$(APPLE_LIBS_FC)\"" >> $(STAGE)/base.module; \
		echo "export HPCP_VENDOR_LIBS_FC=\"$(APPLE_LIBS_FC)\"" >> $(STAGE)/base.sh; \
	fi; \
	if [ "x$(VENDOR)" = "xamd" ]; then \
		for val in $(AMD_INCLUDE); do \
			echo "prepend-path CPATH \"$${val}\"" >> $(STAGE)/base.module; \
			echo "export CPATH=\"$${val}:\$$CPATH\"" >> $(STAGE)/base.sh; \
		done; \
		for val in $(AMD_LIBDIR); do \
			echo "prepend-path LIBRARY_PATH \"$${val}\"" >> $(STAGE)/base.module; \
			echo "export LIBRARY_PATH=\"$${val}:\$$LIBRARY_PATH\"" >> $(STAGE)/base.sh; \
			echo "prepend-path LD_LIBRARY_PATH \"$${val}\"" >> $(STAGE)/base.module; \
			echo "export LD_LIBRARY_PATH=\"$${val}:\$$LD_LIBRARY_PATH\"" >> $(STAGE)/base.sh; \
		done; \
		echo "setenv HPCP_VENDOR_LIBS_CC \"$(AMD_LIBS_CC)\"" >> $(STAGE)/base.module; \
		echo "export HPCP_VENDOR_LIBS_CC=\"$(AMD_LIBS_CC)\"" >> $(STAGE)/base.sh; \
		echo "setenv HPCP_VENDOR_LIBS_CXX \"$(AMD_LIBS_CXX)\"" >> $(STAGE)/base.module; \
		echo "export HPCP_VENDOR_LIBS_CXX=\"$(AMD_LIBS_CXX)\"" >> $(STAGE)/base.sh; \
		echo "setenv HPCP_VENDOR_LIBS_F77 \"$(AMD_LIBS_F77)\"" >> $(STAGE)/base.module; \
		echo "export HPCP_VENDOR_LIBS_F77=\"$(AMD_LIBS_F77)\"" >> $(STAGE)/base.sh; \
		echo "setenv HPCP_VENDOR_LIBS_FC \"$(AMD_LIBS_FC)\"" >> $(STAGE)/base.module; \
		echo "export HPCP_VENDOR_LIBS_FC=\"$(AMD_LIBS_FC)\"" >> $(STAGE)/base.sh; \
	fi; \
	if [ "x$(VENDOR)" = "xintel" ]; then \
		for val in $(INTEL_INCLUDE); do \
			echo "prepend-path CPATH \"$${val}\"" >> $(STAGE)/base.module; \
			echo "export CPATH=\"$${val}:\$$CPATH\"" >> $(STAGE)/base.sh; \
		done; \
		for val in $(INTEL_LIBDIR); do \
			echo "prepend-path LIBRARY_PATH \"$${val}\"" >> $(STAGE)/base.module; \
			echo "export LIBRARY_PATH=\"$${val}:\$$LIBRARY_PATH\"" >> $(STAGE)/base.sh; \
			echo "prepend-path LD_LIBRARY_PATH \"$${val}\"" >> $(STAGE)/base.module; \
			echo "export LD_LIBRARY_PATH=\"$${val}:\$$LD_LIBRARY_PATH\"" >> $(STAGE)/base.sh; \
		done; \
		echo "setenv HPCP_VENDOR_LIBS_CC \"$(INTEL_LIBS_CC)\"" >> $(STAGE)/base.module; \
		echo "export HPCP_VENDOR_LIBS_CC=\"$(INTEL_LIBS_CC)\"" >> $(STAGE)/base.sh; \
		echo "setenv HPCP_VENDOR_LIBS_CXX \"$(INTEL_LIBS_CXX)\"" >> $(STAGE)/base.module; \
		echo "export HPCP_VENDOR_LIBS_CXX=\"$(INTEL_LIBS_CXX)\"" >> $(STAGE)/base.sh; \
		echo "setenv HPCP_VENDOR_LIBS_F77 \"$(INTEL_LIBS_F77)\"" >> $(STAGE)/base.module; \
		echo "export HPCP_VENDOR_LIBS_F77=\"$(INTEL_LIBS_F77)\"" >> $(STAGE)/base.sh; \
		echo "setenv HPCP_VENDOR_LIBS_FC \"$(INTEL_LIBS_FC)\"" >> $(STAGE)/base.module; \
		echo "export HPCP_VENDOR_LIBS_FC=\"$(INTEL_LIBS_FC)\"" >> $(STAGE)/base.sh; \
	fi


pkg-configure :
	@echo "" > /dev/null


pkg-build :
	@if [ ! -e $(STAGE)/orig.module ]; then \
		cp $(STAGE)/hpcp.module $(STAGE)/orig.module; \
		cat $(STAGE)/orig.module $(STAGE)/base.module > $(STAGE)/hpcp.module; \
		cp $(STAGE)/hpcp.sh $(STAGE)/orig.sh; \
		cat $(STAGE)/orig.sh $(STAGE)/base.sh > $(STAGE)/hpcp.sh; \
	fi


pkg-install :
	@mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/bin; \
	cp hpcp/hpcpenv $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/bin/


pkg-clean :
	@if [ -e $(STAGE)/orig.module ]; then \
		mv $(STAGE)/orig.module $(STAGE)/hpcp.module; \
		mv $(STAGE)/orig.sh $(STAGE)/hpcp.sh; \
	fi


# Include common package rules

include ../pkg.make



