module W = IntFoo
(* Fails as it should:
ocamlopt -I lib -c test/test3.ml
File "test/test3.ml", line 1, characters 11-17:
Error: Unbound module IntFoo
make: *** [test/test3.cmx] Error 2
*)
