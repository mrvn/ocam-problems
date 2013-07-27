module W2 = Works.Functor.Make(Works.Foo)
(*
ocamlopt -I lib -c test/test2.ml
File "test/test2.ml", line 1, characters 31-40:
Error: Signature mismatch:
       Modules do not match:
         sig module IntFoo : sig type t = int val foo : t -> unit end end
       is not included in
         Works.Functor.Foo_t
       The field `foo' is required but not provided
       The field `t' is required but not provided
make: *** [test/test2.cmx] Error 2
*)
