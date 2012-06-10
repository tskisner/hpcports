#@COPYRIGHT@


ifndef TARGET
TARGET = $(error TARGET undefined)UNDEFINED
endif

include system/$(TARGET).make
include system/defaults.make


help : packages/up2date
	@cat tools/usage.txt


packages/up2date :
	@$(SHELL) tools/pkg_update.sh


packages/pkg_list.make : packages/up2date
packages/pkg_deps.make : packages/up2date
packages/pkg_rules.make : packages/up2date

include packages/pkg_list.make
include packages/pkg_deps.make
include packages/pkg_rules.make


status : packages/up2date
	@echo "$(HPCP)"; \
	for pkg in $(PKGS); do \
		if [ -d packages/$${pkg}/staging_$(TARGET) ]; then \
			if [ -e packages/$${pkg}/staging_$(TARGET)/state.install ]; then \
				printf "%s%12s : (installed)\n" "$(HPCP)" "$${pkg}"; \
			else \
				if [ -e packages/$${pkg}/staging_$(TARGET)/state.build ]; then \
					printf "%s%12s : (built)\n" "$(HPCP)" "$${pkg}"; \
				else \
					if [ -e packages/$${pkg}/staging_$(TARGET)/state.configure ]; then \
						printf "%s%12s : (configured)\n" "$(HPCP)" "$${pkg}"; \
					else \
						if [ -e packages/$${pkg}/staging_$(TARGET)/state.patch ]; then \
							printf "%s%12s : (patched)\n" "$(HPCP)" "$${pkg}"; \
						else \
							if [ -e packages/$${pkg}/staging_$(TARGET)/state.extract ]; then \
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


fetch : packages/up2date
	@for pkg in $(PKGS); do \
		cd packages/$${pkg}; \
		$(MAKE) fetch; \
		cd ../..; \
	done


clean : packages/up2date
	@for pkg in $(PKGS); do \
		cd packages/$${pkg}; \
		$(MAKE) clean; \
		cd ../..; \
	done


purge : packages/up2date
	@for pkg in $(PKGS); do \
		cd packages/$${pkg}; \
		$(MAKE) purge; \
		cd ../..; \
	done


dist-clean : purge
	@rm -f packages/pkg_deps.make packages/pkg_list.make 
	@rm -f packages/pkg_rules.make packages/up2date


dist : dist-clean
	@echo "Making release tarball..."




