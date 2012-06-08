#@COPYRIGHT@


ifndef TARGET
	TARGET = $(error TARGET undefined)UNDEFINED
endif

include system/$(TARGET).make
include system/defaults.make
include ports/pkg_stale.make

ifneq "$(STALE)" "FALSE"
	PKGS =
endif


help :
	@if test $(STALE) = "FALSE"; then \
		cat tools/usage.txt; \
		echo ""; \
		echo "Available packages"; \
		echo "===================="; \
		echo ""; \
		echo "$(PKGS)"; \
		echo ""; \
	else \
		echo "hpcports:  Package list is stale, run \"make update\""; \
	fi


update :
	@$(SHELL) tools/pkg_update.sh


fetch :
	@if test $(STALE) = "FALSE"; then \
		for pkg in $(PKGS); do \
			echo cd ports/$${pkg}; \
			echo $(MAKE) fetch; \
		done; \
	else \
		echo "hpcports:  Package list is stale, run \"make update\""; \
	fi


clean :
	@if test $(STALE) = "FALSE"; then \
		for pkg in $(PKGS); do \
			echo cd ports/$${pkg}; \
			echo $(MAKE) clean; \
		done; \
	else \
		echo "hpcports:  Package list is stale, run \"make update\""; \
	fi


purge :
	@if test $(STALE) = "FALSE"; then \
		for pkg in $(PKGS); do \
			echo cd ports/$${pkg}; \
			echo $(MAKE) purge; \
		done; \
	else \
		echo "hpcports:  Package list is stale, run \"make update\""; \
	fi


dist-clean : purge
	@rm -f ports/pkg_deps.make ports/pkg_list.make
	@echo "STALE = TRUE" > ports/pkg_stale.make


dist : dist-clean
	@echo "Making release tarball..."


ifeq "$(STALE)" "FALSE"
	include ports/pkg_list.make
	include ports/pkg_deps.make
	include ports/pkg_rules.make
endif

