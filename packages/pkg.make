
PKG_OVERRIDE = $($(PKG_NAME)_OVERRIDE)

ifndef PKG_TAR_FETCH
	PKG_TAR_FETCH = echo "NA"
endif

ifndef PKG_TAR_EXTRACT
	PKG_TAR_EXTRACT = echo "NA"
endif

ifndef PKG_GIT_CLONE
	PKG_GIT_CLONE = echo "NA"
endif

ifndef PKG_GIT_CHECKOUT
	PKG_GIT_CHECKOUT = echo "NA"
endif


prefetch :
	@$(MAKE) pkg-prefetch > /dev/null 2>&1


fetch : prefetch
	@if [ "x$(PKG_OVERRIDE)" != "xTRUE" ]; then \
		if [ "x$(PKG_FORMAT)" = "xtar" ]; then \
			if [ ! -e $(HPCP_POOL)/$(PKG_TAR) ]; then \
				printf "%s%18s :  Fetching tarball\n" "$(HPCP)" "$(PKG_NAME)"; \
				$(PKG_TAR_FETCH) > $(HPCP_POOL)/$(PKG_NAME).fetchlog 2>&1; \
				chgrp -R $(INST_GRP) $(HPCP_POOL)/$(PKG_TAR) $(HPCP_POOL)/$(PKG_NAME).fetchlog; \
				chmod -R $(INST_PERM) $(HPCP_POOL)/$(PKG_TAR) $(HPCP_POOL)/$(PKG_NAME).fetchlog; \
				if [ ! -e $(HPCP_POOL)/$(PKG_TAR) ]; then \
					printf "%s%18s :  FAILED: %s\n" "$(HPCP)" "$(PKG_NAME)" "$(HPCP_POOL)/$(PKG_TAR) was not fetched!"; \
				fi; \
			fi; \
		elif [ "x$(PKG_FORMAT)" = "xzip" ]; then \
			if [ ! -e $(HPCP_POOL)/$(PKG_ZIP) ]; then \
				printf "%s%18s :  Fetching zip file\n" "$(HPCP)" "$(PKG_NAME)"; \
				$(PKG_ZIP_FETCH) > $(HPCP_POOL)/$(PKG_NAME).fetchlog 2>&1; \
				chgrp -R $(INST_GRP) $(HPCP_POOL)/$(PKG_ZIP) $(HPCP_POOL)/$(PKG_NAME).fetchlog; \
				chmod -R $(INST_PERM) $(HPCP_POOL)/$(PKG_ZIP) $(HPCP_POOL)/$(PKG_NAME).fetchlog; \
				if [ ! -e $(HPCP_POOL)/$(PKG_ZIP) ]; then \
					printf "%s%18s :  FAILED: %s\n" "$(HPCP)" "$(PKG_NAME)" "$(HPCP_POOL)/$(PKG_ZIP) was not fetched!"; \
				fi; \
			fi; \
		elif [ "x$(PKG_FORMAT)" = "xgit" ]; then \
			if [ ! -e $(HPCP_POOL)/$(PKG_NAME)-$(PKG_VERSION) ]; then \
				printf "%s%18s :  Cloning git repo\n" "$(HPCP)" "$(PKG_NAME)"; \
				cd $(HPCP_POOL); \
				$(PKG_GIT_CLONE) > $(PKG_NAME)-$(PKG_VERSION).fetchlog 2>&1; \
				printf "%s%18s :  Checking out git revision\n" "$(HPCP)" "$(PKG_NAME)"; \
				mv $(PKG_SRCDIR) $(PKG_NAME)-$(PKG_VERSION); \
				cd $(PKG_NAME)-$(PKG_VERSION); \
				$(PKG_GIT_CHECKOUT) >> ../$(PKG_NAME)-$(PKG_VERSION).fetchlog 2>&1; \
				chgrp -R $(INST_GRP) $(HPCP_POOL)/$(PKG_NAME)-$(PKG_VERSION) $(HPCP_POOL)/$(PKG_NAME)-$(PKG_VERSION).fetchlog; \
				chmod -R $(INST_PERM) $(HPCP_POOL)/$(PKG_NAME)-$(PKG_VERSION) $(HPCP_POOL)/$(PKG_NAME)-$(PKG_VERSION).fetchlog; \
			fi; \
		fi; \
	fi


extract : fetch
	@if [ ! -e $(STAGE)/$(PKG_SRCDIR) ]; then \
		mkdir -p $(STAGE); \
		cd $(STAGE); \
		rm -f log.*; \
		if [ "x$(PKG_OVERRIDE)" != "xTRUE" ]; then \
			printf "%s%18s :  Extracting\n" "$(HPCP)" "$(PKG_NAME)"; \
			if [ "x$(PKG_FORMAT)" = "xtar" ]; then \
				if [ -e $(HPCP_POOL)/$(PKG_TAR) ]; then \
					$(PKG_TAR_EXTRACT) $(HPCP_POOL)/$(PKG_TAR) > $(PKG_DIR)/$(STAGE)/log.extract 2>&1; \
				fi; \
			elif [ "x$(PKG_FORMAT)" = "xzip" ]; then \
				if [ -e $(HPCP_POOL)/$(PKG_ZIP) ]; then \
					$(PKG_ZIP_EXTRACT) $(PKG_SRCDIR) $(HPCP_POOL)/$(PKG_ZIP) > $(PKG_DIR)/$(STAGE)/log.extract 2>&1; \
				fi; \
			elif [ "x$(PKG_FORMAT)" = "xgit" ]; then \
				if [ -e $(HPCP_POOL)/$(PKG_NAME)-$(PKG_VERSION) ]; then \
					cp -a $(HPCP_POOL)/$(PKG_NAME)-$(PKG_VERSION) ./$(PKG_SRCDIR); \
				fi; \
			elif [ "x$(PKG_FORMAT)" = "xnone" ]; then \
				if [ -e ../$(PKG_SRCDIR) ]; then \
					cp -a ../$(PKG_SRCDIR) ./; \
				else \
					mkdir -p $(PKG_SRCDIR); \
				fi; \
			fi; \
			cd $(PKG_DIR)/$(STAGE); \
			if [ ! -e $(PKG_SRCDIR) ]; then \
				printf "%s%18s :  FAILED: %s\n" "$(HPCP)" "$(PKG_NAME)" "extracted source $(PKG_SRCDIR) was not created."; \
			else \
				touch state.extract; \
			fi; \
		else \
			printf "%s%18s :  Overriding\n" "$(HPCP)" "$(PKG_NAME)"; \
			mkdir -p $(PKG_SRCDIR); \
			touch state.extract; \
		fi; \
		../../../tools/pkg_extract.pl $(PKG_NAME) $(python_SITE); \
	fi


patch : extract
	@if [ -e $(STAGE)/$(PKG_SRCDIR) ]; then \
		if [ -e $(STAGE)/state.extract ]; then \
			if [ "x$(PKG_OVERRIDE)" != "xTRUE" ]; then \
				printf "%s%18s :  Patching\n" "$(HPCP)" "$(PKG_NAME)"; \
				. $(STAGE)/$(PKG_NAME)_deps.sh; \
				cd $(STAGE)/$(PKG_SRCDIR); \
				rm -f ../log.patch; \
				for pfile in $(PKG_PATCHES); do \
					$(PATCH) -p1 < ../../$${pfile} >> ../log.patch 2>&1; \
				done; \
				cd ../..; \
			fi; \
			touch $(STAGE)/state.patch && \
			rm $(STAGE)/state.extract; \
		fi; \
	fi


configure : patch
	@if [ -e $(STAGE)/$(PKG_SRCDIR) ]; then \
		if [ -e $(STAGE)/state.patch ]; then \
			if [ "x$(PKG_OVERRIDE)" != "xTRUE" ]; then \
				printf "%s%18s :  Configuring\n" "$(HPCP)" "$(PKG_NAME)"; \
				. $(STAGE)/$(PKG_NAME)_deps.sh; \
				$(MAKE) pkg-configure > $(STAGE)/log.configure 2>&1 && \
				touch $(STAGE)/state.configure && \
				rm $(STAGE)/state.patch; \
			else \
				touch $(STAGE)/state.configure && \
				rm $(STAGE)/state.patch; \
			fi; \
		fi; \
	fi


build : configure
	@if [ -e $(STAGE)/$(PKG_SRCDIR) ]; then \
		if [ -e $(STAGE)/state.configure ]; then \
			if [ "x$(PKG_OVERRIDE)" != "xTRUE" ]; then \
				$(MAKE) uninstall; \
				printf "%s%18s :  Building\n" "$(HPCP)" "$(PKG_NAME)"; \
				. $(STAGE)/$(PKG_NAME)_deps.sh; \
				$(MAKE) pkg-build > $(STAGE)/log.build 2>&1 && \
				touch $(STAGE)/state.build && \
				rm $(STAGE)/state.configure; \
			else \
				touch $(STAGE)/state.build && \
				rm $(STAGE)/state.configure; \
			fi; \
		fi; \
	fi


install : 
	@if [ -e $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION) ]; then \
		printf "%s%18s :  Already Installed\n" "$(HPCP)" "$(PKG_NAME)"; \
	else \
		$(MAKE) build; \
		if [ -e $(STAGE)/state.build ]; then \
			mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION); \
			if [ "x$(PKG_OVERRIDE)" != "xTRUE" ]; then \
				printf "%s%18s :  Installing\n" "$(HPCP)" "$(PKG_NAME)"; \
				. $(STAGE)/$(PKG_NAME)_deps.sh; \
				$(MAKE) pkg-install > $(STAGE)/log.install 2>&1; \
				find $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION) -name '*.la' -exec rm '{}' \; ; \
			else \
				printf "%s%18s :  Installing Override\n" "$(HPCP)" "$(PKG_NAME)"; \
			fi; \
			if [ -e $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/$(python_SITE)/site-packages ]; then \
				for pyfile in `find $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/$(python_SITE)/site-packages -name \'\*.py\'`; do \
					python -m compileall $${pyfile}; \
				done; \
			fi; \
			chgrp -R $(INST_GRP) $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION); \
			chmod -R $(INST_PERM) $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION); \
			suffix="$(HPCP_MOD_SUFFIX)"; \
			if [ $(PKG_NAME) = "hpcp" ]; then \
				suffix=""; \
			fi; \
			mkdir -p $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}; \
			cp $(STAGE)/$(PKG_NAME).sh $(HPCP_PREFIX)/env/$(PKG_NAME)_$(PKG_FULLVERSION).sh; \
			chgrp -R $(INST_GRP) $(HPCP_PREFIX)/env/$(PKG_NAME)_$(PKG_FULLVERSION).sh; \
			chmod -R $(INST_PERM) $(HPCP_PREFIX)/env/$(PKG_NAME)_$(PKG_FULLVERSION).sh; \
			cp $(STAGE)/$(PKG_NAME).module $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/$(PKG_FULLVERSION); \
			if [ -e $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/.version ]; then \
				cp $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/.version $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/.oldversion; \
			fi; \
			cp $(STAGE)/$(PKG_NAME).modversion $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/.version; \
			chgrp -R $(INST_GRP) $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}; \
			chmod -R $(INST_PERM) $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}; \
		fi; \
	fi


clean :
	@if [ -e $(STAGE)/$(PKG_SRCDIR) ]; then \
		if [ -e $(STAGE)/state.build ]; then \
			if [ "x$(PKG_OVERRIDE)" != "xTRUE" ]; then \
				printf "%s%18s :  Cleaning\n" "$(HPCP)" "$(PKG_NAME)"; \
				$(MAKE) pkg-clean > $(STAGE)/log.clean 2>&1 && \
				touch $(STAGE)/state.configure && \
				rm $(STAGE)/state.build && \
				rm $(STAGE)/log.build; \
			else \
				touch $(STAGE)/state.configure && \
				rm $(STAGE)/state.build \
			fi; \
		fi; \
	fi


uninstall :
	@if [ "x$(PKG_OVERRIDE)" != "xTRUE" ]; then \
		printf "%s%18s :  Uninstalling\n" "$(HPCP)" "$(PKG_NAME)"; \
		rm -f $(STAGE)/log.install; \
	else \
		printf "%s%18s :  Uninstalling Override\n" "$(HPCP)" "$(PKG_NAME)"; \
	fi; \
	rm -rf $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION); \
	rm -f $(HPCP_PREFIX)/env/$(PKG_NAME)_$(PKG_FULLVERSION).sh; \
	suffix="$(HPCP_MOD_SUFFIX)"; \
	if [ $(PKG_NAME) = "hpcp" ]; then \
		suffix=""; \
	fi; \
	rm -f $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/$(PKG_FULLVERSION); \
	if [ -e $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/.version ]; then \
		cur=`cat $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/.version | grep ModulesVersion | sed -e 's#.*\"\(.*\)\".*#\1#'`; \
		rm -f $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/.version; \
		if [ $${cur} = "$(PKG_FULLVERSION)" ]; then \
			if [ -e $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/.oldversion ]; then \
				mv $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/.oldversion $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/.version; \
			fi; \
		fi; \
	fi; \
	if [ -e $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix} ]; then \
		empty=`ls -A $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}`; \
		if [ "x$${empty}" = x ]; then \
			rm -rf $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}; \
		fi; \
	fi


purge :
	@printf "%s%18s :  Purging\n" "$(HPCP)" "$(PKG_NAME)"; \
	rm -rf $(STAGE)


