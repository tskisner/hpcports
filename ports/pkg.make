# defined in the per package makefiles:
# PKG_NAME
# PKG_VERSION
# PKG_COMPRESSED
# PKG_EXTRACT
# PKG_FETCH


# include the system-specific variables

include ../../system/$(CMBTARGET).make


all :


fetch :
	@mkdir -p staging; \
	cd staging; \
	if [ ! -e ../../../pool/$(PKG_COMPRESSED) ]; then \
	echo "FETCHing of packages not implemented!"; \
	fi; \
	cp ../../../pool/$(PKG_COMPRESSED) . ; \
	$(PKG_EXTRACT) $(PKG_COMPRESSED)


build :
	@echo "Building package $(PKG_NAME)"


purge :
	@echo "Purging package $(PKG_NAME)"; \
	rm -rf staging


