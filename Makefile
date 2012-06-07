
all : boost

boost : 
	@cd pkg/boost; \
	$(MAKE) fetch; \
	$(MAKE) build;

