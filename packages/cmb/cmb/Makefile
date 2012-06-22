include ../opts.make


cmbconfig : cmbconfig.in
	@cp cmbconfig.in cmbconfig; \
	chmod +x cmbconfig


clean :
	@rm -f cmbconfig


install : cmbconfig
	@mkdir -p $(PREFIX)/$(NAME)-$(VERSION)/bin; \
	cp cmbconfig $(PREFIX)/$(NAME)-$(VERSION)/bin/

