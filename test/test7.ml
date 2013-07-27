module W = IntFoo
(* Fails as it should:
ocamlopt -I lib -c test/test7.ml
File "test/test7.ml", line 1, characters 11-17:
Error: Unbound module IntFoo
make: *** [test/test7.cmx] Error 2
*)
