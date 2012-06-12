

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


prefetch :
	@$(MAKE) pkg-prefetch > /dev/null 2>&1


fetch : prefetch
	@if [ "x$(PKG_FORMAT)" = "xtar" ]; then \
		if [ ! -e $(POOL)/$(PKG_TAR) ]; then \
			echo "$(HPCP)  $(PKG_NAME):  Fetching"; \
			$(PKG_TAR_FETCH) > $(POOL)/$(PKG_NAME).fetchlog 2>&1; \
			if [ ! -e $(POOL)/$(PKG_TAR) ]; then \
				echo "$(HPCP)    FAILED:  $(POOL)/$(PKG_TAR) was not fetched!"; \
			fi; \
		fi; \
	else \
		if [ "x$(PKG_FORMAT)" = "xgit" ]; then \
			if [ ! -e $(POOL)/$(PKG_SRCDIR) ]; then \
				echo "$(HPCP)  $(PKG_NAME):  Fetching"; \
				cd $(POOL); \
				$(PKG_GIT_CLONE) > $(PKG_NAME).fetchlog 2>&1; \
				cd $(PKG_SRCDIR); \
				$(PKG_GIT_CHECKOUT) >> $(POOL)/$(PKG_NAME).fetchlog 2>&1; \
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
			echo "tar format"; \
			if [ -e $(POOL)/$(PKG_TAR) ]; then \
				$(PKG_TAR_EXTRACT) $(POOL)/$(PKG_TAR) > log.extract 2>&1; \
			fi; \
		else \
			if [ "x$(PKG_FORMAT)" = "xgit" ]; then \
				if [ -e $(POOL)/$(PKG_SRCDIR) ]; then \
					ln -s $(POOL)/$(PKG_SRCDIR) $(PKG_SRCDIR); \
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
			rm -f log.patch; \
			for pfile in $(PKG_PATCHES); do \
				$(PATCH) -p1 < $${pfile} >> ../log.patch 2>&1; \
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


build : configure uninstall
	@if [ -e $(STAGE)/$(PKG_SRCDIR) ]; then \
		if [ -e $(STAGE)/state.configure ]; then \
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


install : preinstall
	@if [ -e $(STAGE)/$(PKG_SRCDIR) ]; then \
		if [ -e $(STAGE)/state.build ]; then \
			echo "$(HPCP)  $(PKG_NAME):  Installing"; \
			cd $(STAGE)/$(PKG_SRCDIR); \
			$(MAKE) install > ../log.install 2>&1 && \
			touch ../state.install && \
			rm ../state.build; \
			cp ../$(PKG_NAME).sh $(PREFIX)/env/; \
			mkdir -p $(PREFIX)/env/modulefiles/$(PKG_NAME); \
			cp ../$(PKG_NAME).module $(PREFIX)/env/modulefiles/$(PKG_NAME)/$(PKG_VERSION)-hpcp; \
			if [ -e $(PREFIX)/env/modulefiles/$(PKG_NAME)/.version ]; then \
				cp $(PREFIX)/env/modulefiles/$(PKG_NAME)/.version $(PREFIX)/env/modulefiles/$(PKG_NAME)/.oldversion; \
			fi; \
			cp ../$(PKG_NAME).version $(PREFIX)/env/modulefiles/$(PKG_NAME)/.version; \
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
		else \
			if [ -e $(STAGE)/state.install ]; then \
				echo "$(HPCP)  $(PKG_NAME):  Cleaning"; \
				$(MAKE) pkg-clean > $(STAGE)/log.clean 2>&1 && \
				touch $(STAGE)/state.configure && \
				rm $(STAGE)/state.install && \
				rm -f $(STAGE)/log.install && \
				rm -f $(STAGE)/log.build; \
			fi; \
		fi; \
	fi


uninstall :
	@echo "$(HPCP)  $(PKG_NAME):  Uninstalling"; \
	if [ -e $(STAGE)/$(PKG_SRCDIR) ]; then \
		if [ -e $(STAGE)/state.install ]; then \
			touch $(STAGE)/state.build && \
			rm $(STAGE)/state.install && \
			rm -f $(STAGE)/log.install; \
		fi; \
	fi; \
	rm -rf $(PREFIX)/$(PKG_NAME)-$(PKG_VERSION); \
	rm -f $(PREFIX)/env/$(PKG_NAME).sh; \
	rm -f $(PREFIX)/env/modulefiles/$(PKG_NAME)/$(PKG_VERSION)-hpcp; \
	if [ -e $(PREFIX)/env/modulefiles/$(PKG_NAME)/.oldversion ]; then \
		cp $(PREFIX)/env/modulefiles/$(PKG_NAME)/.oldversion $(PREFIX)/env/modulefiles/$(PKG_NAME)/.version; \
	else \
		rm -rf $(PREFIX)/env/modulefiles/$(PKG_NAME); \
	fi


purge :
	@echo "$(HPCP)  $(PKG_NAME):  Purging"; \
	rm -rf $(STAGE)


