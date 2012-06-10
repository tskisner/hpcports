#@COPYRIGHT@


ifndef TARGET
TARGET = $(error TARGET undefined)UNDEFINED
endif

include system/$(TARGET).make
include system/defaults.make


help : ports/up2date
	@cat tools/usage.txt


ports/up2date :
	@$(SHELL) tools/pkg_update.sh


ports/pkg_list.make : ports/up2date
ports/pkg_deps.make : ports/up2date
ports/pkg_rules.make : ports/up2date

include ports/pkg_list.make
include ports/pkg_deps.make
include ports/pkg_rules.make


status : ports/up2date
	@echo "$(HPCP)"; \
	for pkg in $(PKGS); do \
		if [ -d ports/$${pkg}/staging_$(TARGET) ]; then \
			if [ -e ports/$${pkg}/staging_$(TARGET)/state.install ]; then \
				printf "%s%12s : (installed)\n" "$(HPCP)" "$${pkg}"; \
			else \
				if [ -e ports/$${pkg}/staging_$(TARGET)/state.build ]; then \
					printf "%s%12s : (built)\n" "$(HPCP)" "$${pkg}"; \
				else \
					if [ -e ports/$${pkg}/staging_$(TARGET)/state.configure ]; then \
						printf "%s%12s : (configured)\n" "$(HPCP)" "$${pkg}"; \
					else \
						if [ -e ports/$${pkg}/staging_$(TARGET)/state.patch ]; then \
							printf "%s%12s : (patched)\n" "$(HPCP)" "$${pkg}"; \
						else \
							if [ -e ports/$${pkg}/staging_$(TARGET)/state.extract ]; then \
								printf "%s%12s : (extracted)\n" "$(HPCP)" "$${pkg}"; \
							else \
								printf "%s%12s : (not extracted)\n" "$(HPCP)" "$${pkg}"; \
							fi; \
						fi; \
					fi; \
				fi; \
			fi; \
		else \
			printf "%s%12s : (not extracted)\n" "$(HPCP)" "$${pkg}"; \
		fi; \
	done; \
	echo "$(HPCP)"


install : $(PKGS)


fetch : ports/up2date
	@for pkg in $(PKGS); do \
		cd ports/$${pkg}; \
		$(MAKE) fetch; \
		cd ../..; \
	done


clean : ports/up2date
	@for pkg in $(PKGS); do \
		cd ports/$${pkg}; \
		$(MAKE) clean; \
		cd ../..; \
	done


purge : ports/up2date
	@for pkg in $(PKGS); do \
		cd ports/$${pkg}; \
		$(MAKE) purge; \
		cd ../..; \
	done


dist-clean : purge
	@rm -f ports/pkg_deps.make ports/pkg_list.make 
	@rm -f ports/pkg_rules.make ports/up2date


dist : dist-clean
	@echo "Making release tarball..."




