include ../opts.make

all : mpiBatch cl2pf cl2pp

mpiBatch : mpiBatch.o
	$(MPICC) -o mpiBatch mpiBatch.o $(LDFLAGS) $(LIBS)

mpiBatch.o : mpiBatch.c
	$(MPICC) $(CFLAGS) -o mpiBatch.o -c mpiBatch.c

cl2pf : cl2pf.o
	$(CC) -o cl2pf cl2pf.o $(LDFLAGS) $(LIBS)

cl2pf.o : cl2pf.c
	$(CC) $(CFLAGS) -o cl2pf.o -c cl2pf.c

cl2pp : cl2pp.o
	$(CC) -o cl2pp cl2pp.o $(LDFLAGS) $(LIBS)

cl2pp.o : cl2pp.c
	$(CC) $(CFLAGS) -o cl2pp.o -c cl2pp.c

clean :
	@rm -f mpiBatch cl2pf cl2pp *.o

install : mpiBatch
	@mkdir -p $(PREFIX)/$(NAME)-$(VERSION)/bin; \
	cp mpiBatch cl2pf cl2pp $(PREFIX)/$(NAME)-$(VERSION)/bin/

