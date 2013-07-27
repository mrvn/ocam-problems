# call 'make -k' to see all tests

all: test/test1 test/test2 test/test3 test/test4 test/test5 test/test6 test/test7 test/test8

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

test/test1.cmx : lib/works.cmxa test/test1.ml
	ocamlopt -I lib -c test/test1.ml

test/test2.cmx : lib/works.cmxa test/test2.ml
	ocamlopt -I lib -c test/test2.ml

test/test3.cmx : lib/works.cmxa test/test3.ml
	ocamlopt -I lib -c test/test3.ml

test/test4.cmx : lib/works.cmxa test/test4.ml
	ocamlopt -I lib -I internal -c test/test4.ml

test/test5.cmx : lib/fails.cmxa test/test5.ml
	ocamlopt -I lib -c test/test5.ml

test/test6.cmx : lib/fails.cmxa test/test6.ml
	ocamlopt -I lib -c test/test6.ml

test/test7.cmx : lib/fails.cmxa test/test7.ml
	ocamlopt -I lib -c test/test7.ml

test/test8.cmx : lib/fails.cmxa test/test8.ml
	ocamlopt -I lib -I internal -c test/test8.ml

test/test%: test/test%.cmx
	@:

clean:
	rm -f */*.cmxa */*.cmx */*.cmo */*.cmi */*.o **/*.a */*~
