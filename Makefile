all: test/test

internal/IntFoo.cmx : internal/IntFoo.ml
	ocamlopt -I internal -c internal/IntFoo.ml

internal/IntFoo_t.cmx : internal/IntFoo_t.ml
	ocamlopt -I internal -c internal/IntFoo_t.ml

internal/IntFails.cmx : internal/IntFoo_t.cmx internal/IntFails.ml
	ocamlopt -I internal -c internal/IntFails.ml

internal/IntWorks.cmx : internal/IntWorks.ml
	ocamlopt -I internal -c internal/IntWorks.ml

lib/fails.cmx : internal/IntFails.cmx internal/IntFoo.cmx lib/fails.ml
	ocamlopt -I internal -c lib/fails.ml

lib/fails.cmxa : internal/IntFoo.cmx internal/IntFoo_t.cmx internal/IntFails.cmx lib/fails.cmx
	ocamlopt -a $+ -o lib/fails.cmxa 

lib/works.cmx : internal/IntWorks.cmx internal/IntFoo.cmx lib/works.ml
	ocamlopt -I internal -c lib/works.ml

lib/works.cmxa : internal/IntFoo.cmx internal/IntFoo_t.cmx internal/IntWorks.cmx lib/works.cmx
	ocamlopt -a $+ -o lib/works.cmxa 

test/test.cmx : lib/fails.cmxa lib/works.cmxa test/test.ml
	ocamlopt -I lib -c test/test.ml

test/test: test/test.cmx

clean:
	rm -f */*.cmxa */*.cmx */*.cmo */*.cmi */*.o **/*.a */*~
