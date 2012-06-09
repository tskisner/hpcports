#@COPYRIGHT@


ifndef TARGET
TARGET = $(error TARGET undefined)UNDEFINED
endif

include system/$(TARGET).make
include system/defaults.make
include ports/pkg_stale.make

help :
	@if test $(STALE) = "FALSE"; then \
		cat tools/usage.txt; \
	else \
		echo "hpcports:  Package list is stale, run \"make update\""; \
	fi

ifeq "$(STALE)" "FALSE"

include ports/pkg_list.make
include ports/pkg_deps.make
include ports/pkg_rules.make

else

PKGS =

endif


update :
	@$(SHELL) tools/pkg_update.sh


status :
	@if test $(STALE) = "FALSE"; then \
		echo ""; \
		for pkg in $(PKGS); do \
			if [ -d ports/$${pkg}/staging_$(TARGET) ]; then \
				if [ -e ports/$${pkg}/staging_$(TARGET)/state.install ]; then \
					printf "%12s : (installed)\n" "$${pkg}"; \
				else \
					if [ -e ports/$${pkg}/staging_$(TARGET)/state.build ]; then \
						printf "%12s : (built)\n" "$${pkg}"; \
					else \
						if [ -e ports/$${pkg}/staging_$(TARGET)/state.configure ]; then \
							printf "%12s : (configured)\n" "$${pkg}"; \
						else \
							if [ -e ports/$${pkg}/staging_$(TARGET)/state.patch ]; then \
								printf "%12s : (patched)\n" "$${pkg}"; \
							else \
								if [ -e ports/$${pkg}/staging_$(TARGET)/state.extract ]; then \
									printf "%12s : (extracted)\n" "$${pkg}"; \
								else \
									printf "%12s : (not extracted)\n" "$${pkg}"; \
								fi; \
							fi; \
						fi; \
					fi; \
				fi; \
			else \
				printf "%12s : (not extracted)\n" "$${pkg}"; \
			fi; \
		done; \
		echo ""; \
	else \
		echo "hpcports:  Package list is stale, run \"make update\""; \
	fi


install : $(PKGS)


fetch :
	@if test $(STALE) = "FALSE"; then \
		for pkg in $(PKGS); do \
			cd ports/$${pkg}; \
			$(MAKE) fetch; \
		done; \
	else \
		echo "hpcports:  Package list is stale, run \"make update\""; \
	fi


clean :
	@if test $(STALE) = "FALSE"; then \
		for pkg in $(PKGS); do \
			cd ports/$${pkg}; \
			$(MAKE) clean; \
		done; \
	else \
		echo "hpcports:  Package list is stale, run \"make update\""; \
	fi


purge :
	@if test $(STALE) = "FALSE"; then \
		for pkg in $(PKGS); do \
			cd ports/$${pkg}; \
			$(MAKE) purge; \
		done; \
	else \
		echo "hpcports:  Package list is stale, run \"make update\""; \
	fi


dist-clean : purge
	@rm -f ports/pkg_deps.make ports/pkg_list.make
	@echo "STALE = TRUE" > ports/pkg_stale.make


dist : dist-clean
	@echo "Making release tarball..."




