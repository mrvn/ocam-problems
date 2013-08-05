all: c.cmx

%.cmi: %.mli
	ocamlc -c -o $@ $<

%.cmo %.cmi: %.ml
	ocamlc -c -o $@ $<

%.cmx: %.ml
	ocamlopt -c -o temp.$@ $<
	rm -f temp.$(patsubst %.cmx,%.cmi,$@)
	mv temp.$(patsubst %.cmx,%.o,$@) $(patsubst %.cmx,%.o,$@)
	mv temp.$@ $@

clean:
	rm -f *.cmi *.cmo *.cmx *.o *~

.PRECIOUS: %.cmx %.cmo %.cmi

include depends

depends: $(shell echo *.ml *.mli)
	ocamldep *.ml *.mli >depends
