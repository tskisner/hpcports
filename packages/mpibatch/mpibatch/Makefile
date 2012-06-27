include ../opts.make


mpiBatch : mpiBatch.o
	$(MPICC) -o mpiBatch mpiBatch.o $(LDFLAGS) $(LIBS)

mpiBatch.o : mpiBatch.c
	$(MPICC) $(CFLAGS) -o mpiBatch.o -c mpiBatch.c

clean :
	@rm -f mpiBatch *.o

install : mpiBatch
	@mkdir -p $(PREFIX)/$(NAME)-$(VERSION)/bin; \
	cp mpiBatch $(PREFIX)/$(NAME)-$(VERSION)/bin/

