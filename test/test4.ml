module Foo = IntFoo
(* Works but I want it to fail *)

module Foo2 = struct
  type t = int
  let foo (t: t) = Printf.printf "foo %d\n" t
end

module F = Works.Functor.Make(Foo2)
(* Works now *)

module F2 = Works.Functor.Make(Works.Foo)
(*  
ocamlopt -I lib -I internal -c test/test4.ml
File "test/test4.ml", line 12, characters 31-40:
Error: Signature mismatch:
       Modules do not match:
         sig module IntFoo : sig type t = int val foo : t -> unit end end
       is not included in
         Works.Functor.Foo_t
       The field `foo' is required but not provided
       The field `t' is required but not provided
make: *** [test/test4.cmx] Error 2
*)
