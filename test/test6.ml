module W2 = Fails.Functor.Make(Fails.Foo)
(*
ocamlopt -I lib -c test/test6.ml
File "test/test6.ml", line 1, characters 31-40:
Error: Signature mismatch:
       Modules do not match:
         sig module IntFoo : sig type t = int val foo : t -> unit end end
       is not included in
         IntFoo_t.IntFoo_t
       Unbound module type IntFoo_t.IntFoo_t
make: *** [test/test6.cmx] Error 2
*)
