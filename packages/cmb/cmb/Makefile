include ../opts.make


cmbconfig : cmbconfig.in
	@./gen_cmbconfig.sh $(SHELL)


clean :
	@rm -f cmbconfig


install : cmbconfig
	@mkdir -p $(PREFIX)/$(NAME)-$(VERSION)/bin; \
	cp cmbconfig $(PREFIX)/$(NAME)-$(VERSION)/bin/

