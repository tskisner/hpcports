

STAGE = staging_$(HPCP_TARGET)

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


status :
	@if [ "x$(PKG_OVERRIDE)" != "xTRUE" ]; then \
		if [ -d $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION) ]; then \
			printf "%s%12s : (installed)\n" "$(HPCP)" "$(PKG_NAME)"; \
		elif [ -d $(STAGE) ]; then \
			if [ -e $(STAGE)/state.build ]; then \
				printf "%s%12s : (built)\n" "$(HPCP)" "$(PKG_NAME)"; \
			elif [ -e $(STAGE)/state.configure ]; then \
				printf "%s%12s : (configured)\n" "$(HPCP)" "$(PKG_NAME)"; \
			elif [ -e $(STAGE)/state.patch ]; then \
				printf "%s%12s : (patched)\n" "$(HPCP)" "$(PKG_NAME)"; \
			elif [ -e $(STAGE)/state.extract ]; then \
				printf "%s%12s : (extracted)\n" "$(HPCP)" "$(PKG_NAME)"; \
			else \
				printf "%s%12s : (not extracted)\n" "$(HPCP)" "$(PKG_NAME)"; \
			fi; \
		else \
			printf "%s%12s : (not extracted)\n" "$(HPCP)" "$(PKG_NAME)"; \
		fi; \
	else \
		printf "%s%12s : (Overridden)\n" "$(HPCP)" "$(PKG_NAME)"; \
	fi


prefetch :
	@$(MAKE) pkg-prefetch > /dev/null 2>&1


fetch : prefetch
	@if [ "x$(PKG_FORMAT)" = "xtar" ]; then \
		if [ ! -e $(HPCP_POOL)/$(PKG_TAR) ]; then \
			echo "$(HPCP)  $(PKG_NAME):  Fetching tarball"; \
			$(PKG_TAR_FETCH) > $(HPCP_POOL)/$(PKG_NAME).fetchlog 2>&1; \
			chgrp -R $(INST_GRP) $(HPCP_POOL)/$(PKG_TAR) $(HPCP_POOL)/$(PKG_NAME).fetchlog; \
			chmod -R $(INST_PERM) $(HPCP_POOL)/$(PKG_TAR) $(HPCP_POOL)/$(PKG_NAME).fetchlog; \
			if [ ! -e $(HPCP_POOL)/$(PKG_TAR) ]; then \
				echo "$(HPCP)    FAILED:  $(HPCP_POOL)/$(PKG_TAR) was not fetched!"; \
			fi; \
		fi; \
	elif [ "x$(PKG_FORMAT)" = "xzip" ]; then \
		if [ ! -e $(HPCP_POOL)/$(PKG_ZIP) ]; then \
			echo "$(HPCP)  $(PKG_NAME):  Fetching zip file"; \
			$(PKG_ZIP_FETCH) > $(HPCP_POOL)/$(PKG_NAME).fetchlog 2>&1; \
			chgrp -R $(INST_GRP) $(HPCP_POOL)/$(PKG_ZIP) $(HPCP_POOL)/$(PKG_NAME).fetchlog; \
			chmod -R $(INST_PERM) $(HPCP_POOL)/$(PKG_ZIP) $(HPCP_POOL)/$(PKG_NAME).fetchlog; \
			if [ ! -e $(HPCP_POOL)/$(PKG_ZIP) ]; then \
				echo "$(HPCP)    FAILED:  $(HPCP_POOL)/$(PKG_ZIP) was not fetched!"; \
			fi; \
		fi; \
	elif [ "x$(PKG_FORMAT)" = "xgit" ]; then \
		if [ ! -e $(HPCP_POOL)/$(PKG_NAME)-$(PKG_VERSION) ]; then \
			echo "$(HPCP)  $(PKG_NAME):  Cloning git repo"; \
			gitver=`head -n 1 ../gitgit/version`; \
			if [ -e $(HPCP_PREFIX)/env/gitgit-$${gitver}.sh ]; then \
				. $(HPCP_PREFIX)/env/gitgit-$${gitver}.sh; \
			fi; \
			cd $(HPCP_POOL); \
			$(PKG_GIT_CLONE) > $(PKG_NAME)-$(PKG_VERSION).fetchlog 2>&1; \
			echo "$(HPCP)  $(PKG_NAME):  Checking out git revision"; \
			mv $(PKG_SRCDIR) $(PKG_NAME)-$(PKG_VERSION); \
			cd $(PKG_NAME)-$(PKG_VERSION); \
			$(PKG_GIT_CHECKOUT) >> ../$(PKG_NAME)-$(PKG_VERSION).fetchlog 2>&1; \
			chgrp -R $(INST_GRP) $(HPCP_POOL)/$(PKG_NAME)-$(PKG_VERSION) $(HPCP_POOL)/$(PKG_NAME)-$(PKG_VERSION).fetchlog; \
			chmod -R $(INST_PERM) $(HPCP_POOL)/$(PKG_NAME)-$(PKG_VERSION) $(HPCP_POOL)/$(PKG_NAME)-$(PKG_VERSION).fetchlog; \
		fi; \
	fi


extract : fetch
	@if [ ! -e $(STAGE)/$(PKG_SRCDIR) ]; then \
		echo "$(HPCP)  $(PKG_NAME):  Extracting"; \
		mkdir -p $(STAGE); \
		cd $(STAGE); \
		rm -f log.*; \
		if [ "x$(PKG_FORMAT)" = "xtar" ]; then \
			if [ -e $(HPCP_POOL)/$(PKG_TAR) ]; then \
				$(PKG_TAR_EXTRACT) $(HPCP_POOL)/$(PKG_TAR) > log.extract 2>&1; \
			fi; \
		elif [ "x$(PKG_FORMAT)" = "xzip" ]; then \
			if [ -e $(HPCP_POOL)/$(PKG_ZIP) ]; then \
				$(PKG_ZIP_EXTRACT) $(PKG_SRCDIR) $(HPCP_POOL)/$(PKG_ZIP) > log.extract 2>&1; \
			fi; \
		elif [ "x$(PKG_FORMAT)" = "xgit" ]; then \
			if [ -e $(HPCP_POOL)/$(PKG_NAME)-$(PKG_VERSION) ]; then \
				cp -a $(HPCP_POOL)/$(PKG_NAME)-$(PKG_VERSION) ./$(PKG_SRCDIR) && \
				rm -rf $(PKG_SRCDIR)/.git; \
			fi; \
		elif [ "x$(PKG_FORMAT)" = "xnone" ]; then \
			if [ -e ../$(PKG_SRCDIR) ]; then \
				cp -a ../$(PKG_SRCDIR) ./; \
			fi; \
		fi; \
		if [ ! -e $(PKG_SRCDIR) ]; then \
			echo "$(HPCP)    FAILED:  extracted source $(PKG_SRCDIR) was not created."; \
		else \
			touch state.extract; \
		fi; \
		$(SHELL) ../../../tools/pkg_env.sh $(PKG_NAME) $(PKG_VERSION) $(HPCP_PREFIX) $(HPCP_TARGET) $(HPCP_ENV) $(python_SITE) $(MOD_SUFFIX); \
	fi


patch : extract
	@if [ -e $(STAGE)/$(PKG_SRCDIR) ]; then \
		if [ -e $(STAGE)/state.extract ]; then \
			echo "$(HPCP)  $(PKG_NAME):  Patching"; \
			source $(STAGE)/dep_env.sh; \
			cd $(STAGE)/$(PKG_SRCDIR); \
			rm -f ../log.patch; \
			for pfile in $(PKG_PATCHES); do \
				$(PATCH) -p1 < ../../$${pfile} >> ../log.patch 2>&1; \
			done; \
			touch ../state.patch && \
			rm ../state.extract; \
		fi; \
	fi


configure : patch
	@if [ -e $(STAGE)/$(PKG_SRCDIR) ]; then \
		if [ -e $(STAGE)/state.patch ]; then \
			echo "$(HPCP)  $(PKG_NAME):  Configuring"; \
			source $(STAGE)/dep_env.sh; \
			$(MAKE) pkg-configure > $(STAGE)/log.configure 2>&1 && \
			touch $(STAGE)/state.configure && \
			rm $(STAGE)/state.patch; \
		fi; \
	fi


build : configure
	@if [ -e $(STAGE)/$(PKG_SRCDIR) ]; then \
		if [ -e $(STAGE)/state.configure ]; then \
			$(MAKE) uninstall; \
			echo "$(HPCP)  $(PKG_NAME):  Building"; \
			source $(STAGE)/dep_env.sh; \
			$(MAKE) pkg-build > $(STAGE)/log.build 2>&1 && \
			touch $(STAGE)/state.build && \
			rm $(STAGE)/state.configure; \
		fi; \
	fi


install : build
	@if [ -e $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION) ]; then \
		echo "$(HPCP)  $(PKG_NAME):  Already installed"; \
	else \
		if [ -e $(STAGE)/$(PKG_SRCDIR) ]; then \
			if [ -e $(STAGE)/state.build ]; then \
				echo "$(HPCP)  $(PKG_NAME):  Installing"; \
				source $(STAGE)/dep_env.sh; \
				$(MAKE) pkg-install > $(STAGE)/log.install 2>&1; \
				chgrp -R $(INST_GRP) $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION); \
				chmod -R $(INST_PERM) $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION); \
				cp $(STAGE)/$(PKG_NAME)-$(PKG_VERSION).sh $(HPCP_PREFIX)/env/; \
				chgrp -R $(INST_GRP) $(HPCP_PREFIX)/env/$(PKG_NAME)-$(PKG_VERSION).sh; \
				chmod -R $(INST_PERM) $(HPCP_PREFIX)/env/$(PKG_NAME)-$(PKG_VERSION).sh; \
				suffix="$(MOD_SUFFIX)"; \
				if [ $(PKG_NAME) = "hpcp" ]; then \
					suffix=""; \
				fi; \
				mkdir -p $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}; \
				if [ $(PKG_NAME) = "hpcp" ]; then \
					cp $(STAGE)/$(PKG_NAME).module $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/$(PKG_VERSION); \
				else \
					cp $(STAGE)/$(PKG_NAME).module $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/$(PKG_VERSION)-$(HPCP_ENV); \
				fi; \
				if [ -e $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/.version ]; then \
					cp $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/.version $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/.oldversion; \
				fi; \
				cp $(STAGE)/$(PKG_NAME).version $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/.version; \
				chgrp -R $(INST_GRP) $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}; \
				chmod -R $(INST_PERM) $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}; \
			fi; \
		fi; \
	fi


reinstall :
	@$(MAKE) uninstall; $(MAKE) install


clean :
	@if [ -e $(STAGE)/$(PKG_SRCDIR) ]; then \
		if [ -e $(STAGE)/state.build ]; then \
			echo "$(HPCP)  $(PKG_NAME):  Cleaning"; \
			$(MAKE) pkg-clean > $(STAGE)/log.clean 2>&1 && \
			touch $(STAGE)/state.configure && \
			rm $(STAGE)/state.build && \
			rm $(STAGE)/log.build; \
		fi; \
	fi


uninstall :
	@echo "$(HPCP)  $(PKG_NAME):  Uninstalling"; \
	rm -f $(STAGE)/log.install; \
	rm -rf $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION); \
	rm -f $(HPCP_PREFIX)/env/$(PKG_NAME)-$(PKG_VERSION).sh; \
	suffix="$(MOD_SUFFIX)"; \
	if [ $(PKG_NAME) = "hpcp" ]; then \
		suffix=""; \
		rm -f $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)/$(PKG_VERSION); \
	else \
		rm -f $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/$(PKG_VERSION)-$(HPCP_ENV); \
	fi; \
	rm -f $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/.version; \
	if [ -e $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/.oldversion ]; then \
		mv $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/.oldversion $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}/.version; \
	else \
		rm -rf $(HPCP_PREFIX)/env/modulefiles/$(PKG_NAME)$${suffix}; \
	fi


purge :
	@echo "$(HPCP)  $(PKG_NAME):  Purging"; \
	rm -rf $(STAGE)


