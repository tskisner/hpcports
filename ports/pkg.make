#@COPYRIGHT@


fetch :
	@if [ ! -e $(POOL)/$(PKG_COMPRESSED) ]; then \
		echo "hpcports:  Fetching $(PKG_NAME)"; \
		echo "  FAILED:  fetching of $(PKG_NAME) not yet implemented!"; \
	fi;


extract : fetch
	@if [ ! -e staging/$(PKG_UNCOMPRESSED) ]; then \
		echo "hpcports:  Extracting $(PKG_NAME)"; \
		if [ -e $(POOL)/$(PKG_COMPRESSED) ]; then \
			mkdir -p staging; \
			cd staging; \
			$(PKG_XTAR) $(POOL)/$(PKG_COMPRESSED); \
			if [ ! -e $(PKG_UNCOMPRESSED) ]; then \
				echo "  FAILED:  extracted source $(PKG_UNCOMPRESSED) was not created."; \
			fi; \
		else \
			echo "$(POOL)/$(PKG_COMPRESSED) does not exist- fetch must have failed"; \
		fi; \
	fi
	


patch : extract
	@echo "hpcports:  Patching $(PKG_NAME)"
	@if [ -e staging/$(PKG_UNCOMPRESSED) ]; then \
		cd staging/$(PKG_UNCOMPRESSED); \
		for pfile in $(PKG_PATCHES); do \
			$(PATCH) -p1 < $${pfile}; \
		done; \
	else \
		echo "staging/$(PKG_UNCOMPRESSED) does not exist- extraction must have failed"; \
	fi


configure : patch


build : configure
	@echo "hpcports:  Building $(PKG_NAME)"


pre-install : build


install : pre-install
	@echo "hpcports:  Installing $(PKG_NAME)"


purge :
	@echo "hpcports:  Purging $(PKG_NAME)"; \
	rm -rf staging


