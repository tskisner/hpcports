#@COPYRIGHT@

STAGE = staging_$(TARGET)


prefetch :
	@$(MAKE) pkg-prefetch


fetch : prefetch
	@if [ ! -e $(POOL)/$(PKG_COMPRESSED) ]; then \
		echo "hpcports:  Fetching $(PKG_NAME)"; \
		echo "  FAILED:  fetching of $(PKG_NAME) not yet implemented!"; \
	fi;


extract : fetch
	@if [ ! -e $(STAGE)/$(PKG_UNCOMPRESSED) ]; then \
		echo "hpcports:  Extracting $(PKG_NAME)"; \
		if [ -e $(POOL)/$(PKG_COMPRESSED) ]; then \
			mkdir -p $(STAGE); \
			cd $(STAGE); \
			rm -f log.*; \
			$(PKG_XTAR) $(POOL)/$(PKG_COMPRESSED) > log.extract 2>&1; \
			if [ ! -e $(PKG_UNCOMPRESSED) ]; then \
				echo "  FAILED:  extracted source $(PKG_UNCOMPRESSED) was not created."; \
			else \
				touch state.extract; \
			fi; \
		fi; \
	fi
	


patch : extract
	@if [ -e $(STAGE)/$(PKG_UNCOMPRESSED) ]; then \
		if [ -e $(STAGE)/state.extract ]; then \
			echo "hpcports:  Patching $(PKG_NAME)"; \
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
			echo "hpcports:  Configuring $(PKG_NAME)"; \
			$(MAKE) pkg-configure > $(STAGE)/log.configure 2>&1 && \
			touch $(STAGE)/state.configure && \
			rm $(STAGE)/state.patch; \
		fi; \
	fi


build : configure
	@if [ -e $(STAGE)/$(PKG_UNCOMPRESSED) ]; then \
		if [ -e $(STAGE)/state.configure ]; then \
			echo "hpcports:  Building $(PKG_NAME)"; \
			cd $(STAGE)/$(PKG_UNCOMPRESSED); \
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
			echo "hpcports:  Installing $(PKG_NAME)"; \
			cd $(STAGE)/$(PKG_UNCOMPRESSED); \
			$(MAKE) install > ../log.install 2>&1 && \
			touch ../state.install && \
			rm ../state.build; \
		fi; \
	fi


clean :
	@echo "hpcports:  Cleaning $(PKG_NAME)"; \
	$(MAKE) pkg-clean


purge :
	@echo "hpcports:  Purging $(PKG_NAME)"; \
	rm -rf $(STAGE)


