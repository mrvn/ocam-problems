all: c.cmx

%.cmi: %.mli
	ocamlc -c -o $@ $<

%.inferred.new: %.ml
	ocamlc -i $< > $@

%.inferred: %.inferred.new
	cmp -s $@ $< || cp $< $@

%.cmi: %.inferred
	ocamlc -c -intf-suffix .inferred -o $@ $<

%.cmo: %.ml %.cmi
	ocamlc -c -o temp.$@ $<
	rm -f temp.$(patsubst %.cmo,%.cmi,$@)
	mv temp.$@ $@

%.cmx: %.ml %.cmi
	ocamlopt -c -o temp.$@ $<
	rm -f temp.$(patsubst %.cmx,%.cmi,$@)
	mv temp.$(patsubst %.cmx,%.o,$@) $(patsubst %.cmx,%.o,$@)
	mv temp.$@ $@

clean:
	rm -f *.cmi *.cmo *.cmx *.o *~ *.inferred *.inferred.new

.PRECIOUS: %.inferred %.inferred.new %.cmx %.cmo %.cmi

include depends

depends: $(shell echo *.ml *.mli)
	ocamldep *.ml *.mli >depends

b.inferred.new: a.cmi
c.inferred.new: b.cmi
