all: test
	./test

test: main.cmx stubs.o
	ocamlopt -o $@ $+

%.cmx: %.ml
	ocamlopt -g -c -o $@ $<

%.o: %.c
	gcc -O2 -W -Wall -g -c -o $@ $<

clean:
	rm -f test *.o *.cmx *.cmi *~
