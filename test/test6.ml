module W2 = Fails.Functor.Make(Fails.Foo.T)
(*
ocamlopt -I lib -c test/test6.ml
File "test/test6.ml", line 1, characters 31-42:
Error: Signature mismatch:
       Modules do not match:
         sig type t = int val foo : t -> unit end
       is not included in
         IntFoo_t.T_t
       Unbound module type IntFoo_t.T_t
make: *** [test/test6.cmx] Error 2
*)
