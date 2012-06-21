
cmbconfig : cmbconfig.in
	@./gen_cmbconfig.sh


clean :
	@rm -f cmbconfig


install : cmbconfig
	@mkdir -p $(PREFIX)/$(PKG_NAME)-$(PKG_VERSION)/bin; \
	cp -a cmbconfig $(PREFIX)/$(PKG_NAME)-$(PKG_VERSION)/bin/

