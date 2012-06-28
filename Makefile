#@COPYRIGHT@


ifndef HPCP_TARGET
HPCP_TARGET = $(error HPCP_TARGET undefined)UNDEFINED
endif

include system/$(HPCP_TARGET).make
include system/defaults.make

GITHASH := $(shell git rev-parse --short HEAD)


help : packages/up2date.$(GITHASH)
	@cat tools/usage.txt | sed -e 's/^/$(HPCP)  /'


packages/up2date.$(GITHASH) :
	@rm -f packages/up2date.*; \
	$(SHELL) tools/pkg_update.sh $(GITHASH)


update :
	@rm -f packages/up2date.*; \
	$(MAKE) help > /dev/null 2>&1


packages/pkg_list.make : packages/up2date.$(GITHASH)
packages/pkg_rules.make : packages/up2date.$(GITHASH)

include packages/pkg_list.make
include packages/pkg_rules.make


status : packages/up2date.$(GITHASH)
	@echo "$(HPCP)"; \
	for pkg in $(PKGS); do \
		cd packages/$${pkg}; \
		$(MAKE) status; \
		cd ../..; \
	done; \
	echo "$(HPCP)"


install : install-common $(PKGS)


install-common :
	@mkdir -p $(HPCP_PREFIX)/env/modulefiles; \
	mkdir -p $(HPCP_POOL); \
	chgrp -R $(INST_GRP) $(HPCP_POOL); \
	chmod -R $(INST_PERM) $(HPCP_POOL); \
	chgrp -R $(INST_GRP) $(HPCP_PREFIX); \
	chgrp -R $(INST_GRP) $(HPCP_PREFIX)/env; \
	chgrp -R $(INST_GRP) $(HPCP_PREFIX)/env/modulefiles; \
	chmod -R $(INST_PERM) $(HPCP_PREFIX); \
	chmod -R $(INST_PERM) $(HPCP_PREFIX)/env; \
	chmod -R $(INST_PERM) $(HPCP_PREFIX)/env/modulefiles


fetch : packages/up2date.$(GITHASH)


uninstall : packages/up2date.$(GITHASH)


clean : packages/up2date.$(GITHASH)
	rm -rf packages/overrides_$(HPCP_TARGET)


purge : packages/up2date.$(GITHASH)


git-clean : purge
	@rm -f packages/pkg_deps.make packages/pkg_list.make 
	@rm -f packages/pkg_rules.make packages/up2date.*



