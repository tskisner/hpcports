

STAGE = staging_$(TARGET)


prefetch :
	@$(MAKE) pkg-prefetch > /dev/null 2>&1


fetch : prefetch
	@if [ ! -e $(POOL)/$(PKG_COMPRESSED) ]; then \
		echo "$(HPCP)  $(PKG_NAME):  Fetching"; \
		echo "$(HPCP)    FAILED:  fetching of $(PKG_NAME) not yet implemented!"; \
	fi;


extract : fetch
	@if [ ! -e $(STAGE)/$(PKG_UNCOMPRESSED) ]; then \
		echo "$(HPCP)  $(PKG_NAME):  Extracting"; \
		if [ -e $(POOL)/$(PKG_COMPRESSED) ]; then \
			mkdir -p $(STAGE); \
			cd $(STAGE); \
			rm -f log.*; \
			$(PKG_XTAR) $(POOL)/$(PKG_COMPRESSED) > log.extract 2>&1; \
			if [ ! -e $(PKG_UNCOMPRESSED) ]; then \
				echo "$(HPCP)    FAILED:  extracted source $(PKG_UNCOMPRESSED) was not created."; \
			else \
				touch state.extract; \
			fi; \
			$(SHELL) ../../../tools/pkg_env.sh $(PKG_NAME) $(PKG_VERSION) $(STAGE) $(PREFIX); \
		fi; \
	fi


patch : extract
	@if [ -e $(STAGE)/$(PKG_UNCOMPRESSED) ]; then \
		if [ -e $(STAGE)/state.extract ]; then \
			echo "$(HPCP)  $(PKG_NAME):  Patching"; \
			cd $(STAGE)/$(PKG_UNCOMPRESSED); \
			rm -f log.patch; \
			for pfile in $(PKG_PATCHES); do \
				$(PATCH) -p1 < $${pfile} >> ../log.patch 2>&1; \
			done; \
			touch ../state.patch && \
			rm ../state.extract; \
		fi; \
	fi


configure : patch
	@if [ -e $(STAGE)/$(PKG_UNCOMPRESSED) ]; then \
		if [ -e $(STAGE)/state.patch ]; then \
			echo "$(HPCP)  $(PKG_NAME):  Configuring"; \
			source $(STAGE)/dep_env.sh; \
			$(MAKE) pkg-configure > $(STAGE)/log.configure 2>&1 && \
			touch $(STAGE)/state.configure && \
			rm $(STAGE)/state.patch; \
		fi; \
	fi


build : configure uninstall
	@if [ -e $(STAGE)/$(PKG_UNCOMPRESSED) ]; then \
		if [ -e $(STAGE)/state.configure ]; then \
			echo "$(HPCP)  $(PKG_NAME):  Building"; \
			cd $(STAGE)/$(PKG_UNCOMPRESSED); \
			source ../dep_env.sh; \
			$(MAKE) > ../log.build 2>&1 && \
			touch ../state.build && \
			rm ../state.configure; \
		fi; \
	fi


preinstall : build
	@$(MAKE) pkg-preinstall


install : preinstall
	@if [ -e $(STAGE)/$(PKG_UNCOMPRESSED) ]; then \
		if [ -e $(STAGE)/state.build ]; then \
			echo "$(HPCP)  $(PKG_NAME):  Installing"; \
			cd $(STAGE)/$(PKG_UNCOMPRESSED); \
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
	@if [ -e $(STAGE)/$(PKG_UNCOMPRESSED) ]; then \
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
	if [ -e $(STAGE)/$(PKG_UNCOMPRESSED) ]; then \
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


