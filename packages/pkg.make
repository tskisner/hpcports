

STAGE = staging_$(TARGET)

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
	@if [ -d $(PREFIX)/$(PKG_NAME)-$(PKG_VERSION) ]; then \
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
	fi


prefetch :
	@$(MAKE) pkg-prefetch > /dev/null 2>&1


fetch : prefetch
	@if [ "x$(PKG_FORMAT)" = "xtar" ]; then \
		if [ ! -e $(POOL)/$(PKG_TAR) ]; then \
			echo "$(HPCP)  $(PKG_NAME):  Fetching tarball"; \
			$(PKG_TAR_FETCH) > $(POOL)/$(PKG_NAME).fetchlog 2>&1; \
			chgrp -R $(INST_GRP) $(POOL)/$(PKG_TAR); \
			chmod -R $(INST_PERM) $(POOL)/$(PKG_TAR); \
			if [ ! -e $(POOL)/$(PKG_TAR) ]; then \
				echo "$(HPCP)    FAILED:  $(POOL)/$(PKG_TAR) was not fetched!"; \
			fi; \
		fi; \
	else \
		if [ "x$(PKG_FORMAT)" = "xgit" ]; then \
			if [ ! -e $(POOL)/$(PKG_SRCDIR) ]; then \
				echo "$(HPCP)  $(PKG_NAME):  Cloning git repo"; \
				cd $(POOL); \
				$(PKG_GIT_CLONE) > $(PKG_NAME).fetchlog 2>&1; \
				echo "$(HPCP)  $(PKG_NAME):  Checking out git revision"; \
				cd $(PKG_SRCDIR); \
				$(PKG_GIT_CHECKOUT) >> ../$(PKG_NAME).fetchlog 2>&1; \
				chgrp -R $(INST_GRP) $(POOL)/$(PKG_SRCDIR); \
				chmod -R $(INST_PERM) $(POOL)/$(PKG_SRCDIR); \
			fi; \
		fi; \
	fi;


extract : fetch
	@if [ ! -e $(STAGE)/$(PKG_SRCDIR) ]; then \
		echo "$(HPCP)  $(PKG_NAME):  Extracting"; \
		mkdir -p $(STAGE); \
		cd $(STAGE); \
		rm -f log.*; \
		if [ "x$(PKG_FORMAT)" = "xtar" ]; then \
			if [ -e $(POOL)/$(PKG_TAR) ]; then \
				$(PKG_TAR_EXTRACT) $(POOL)/$(PKG_TAR) > log.extract 2>&1; \
			fi; \
		else \
			if [ "x$(PKG_FORMAT)" = "xgit" ]; then \
				if [ -e $(POOL)/$(PKG_SRCDIR) ]; then \
					cp -a $(POOL)/$(PKG_SRCDIR) ./ && \
					rm -rf $(PKG_SRCDIR)/.git; \
				fi; \
			fi; \
		fi; \
		if [ ! -e $(PKG_SRCDIR) ]; then \
			echo "$(HPCP)    FAILED:  extracted source $(PKG_SRCDIR) was not created."; \
		else \
			touch state.extract; \
		fi; \
		$(SHELL) ../../../tools/pkg_env.sh $(PKG_NAME) $(PKG_VERSION) $(STAGE) $(PREFIX); \
	fi


patch : extract
	@if [ -e $(STAGE)/$(PKG_SRCDIR) ]; then \
		if [ -e $(STAGE)/state.extract ]; then \
			echo "$(HPCP)  $(PKG_NAME):  Patching"; \
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
			cd $(STAGE)/$(PKG_SRCDIR); \
			source ../dep_env.sh; \
			$(MAKE) > ../log.build 2>&1 && \
			touch ../state.build && \
			rm ../state.configure; \
		fi; \
	fi


preinstall : build
	@$(MAKE) pkg-preinstall


install :
	@if [ -e $(PREFIX)/$(PKG_NAME)-$(PKG_VERSION) ]; then \
		echo "$(HPCP)  $(PKG_NAME):  Already installed"; \
	else \
		$(MAKE) preinstall; \
		if [ -e $(STAGE)/$(PKG_SRCDIR) ]; then \
			if [ -e $(STAGE)/state.build ]; then \
				echo "$(HPCP)  $(PKG_NAME):  Installing"; \
				cd $(STAGE)/$(PKG_SRCDIR); \
				$(MAKE) install > ../log.install 2>&1 \
				chgrp -R $(INST_GRP) $(PREFIX)/$(PKG_NAME)-$(PKG_VERSION); \
				chmod -R $(INST_PERM) $(PREFIX)/$(PKG_NAME)-$(PKG_VERSION); \
				cp ../$(PKG_NAME).sh $(PREFIX)/env/; \
				mkdir -p $(PREFIX)/env/modulefiles/$(PKG_NAME); \
				cp ../$(PKG_NAME).module $(PREFIX)/env/modulefiles/$(PKG_NAME)/$(PKG_VERSION)-hpcp; \
				if [ -e $(PREFIX)/env/modulefiles/$(PKG_NAME)/.version ]; then \
					cp $(PREFIX)/env/modulefiles/$(PKG_NAME)/.version $(PREFIX)/env/modulefiles/$(PKG_NAME)/.oldversion; \
				fi; \
				cp ../$(PKG_NAME).version $(PREFIX)/env/modulefiles/$(PKG_NAME)/.version; \
				chgrp -R $(INST_GRP) $(PREFIX)/env/modulefiles/$(PKG_NAME); \
				chmod -R $(INST_PERM) $(PREFIX)/env/modulefiles/$(PKG_NAME); \
			fi; \
		fi; \
	fi


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
	rm -rf $(PREFIX)/$(PKG_NAME)-$(PKG_VERSION); \
	rm -f $(PREFIX)/env/$(PKG_NAME).sh; \
	rm -f $(PREFIX)/env/modulefiles/$(PKG_NAME)/$(PKG_VERSION)-hpcp; \
	rm -f $(PREFIX)/env/modulefiles/$(PKG_NAME)/.version; \
	if [ -e $(PREFIX)/env/modulefiles/$(PKG_NAME)/.oldversion ]; then \
		mv $(PREFIX)/env/modulefiles/$(PKG_NAME)/.oldversion $(PREFIX)/env/modulefiles/$(PKG_NAME)/.version; \
	else \
		rm -rf $(PREFIX)/env/modulefiles/$(PKG_NAME); \
	fi


purge :
	@echo "$(HPCP)  $(PKG_NAME):  Purging"; \
	rm -rf $(STAGE)


