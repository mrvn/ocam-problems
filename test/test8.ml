module Foo = IntFoo
(* Fails but I want it to fail *)

module Foo2 = struct
  type t = int
  let foo (t: t) = Printf.printf "foo %d\n" t
end

module F = Fails.Functor.Make(Foo2)
(* Works now *)

module F2 = Fails.Functor.Make(Fails.Foo)
(*  
ocamlopt -I lib -I internal -c test/test8.ml
File "test/test8.ml", line 12, characters 31-40:
Error: Signature mismatch:
       Modules do not match:
         sig module IntFoo : sig type t = int val foo : t -> unit end end
       is not included in
         IntFoo_t.IntFoo_t
       The field `foo' is required but not provided
       The field `t' is required but not provided
make: *** [test/test8.cmx] Error 2
*)
