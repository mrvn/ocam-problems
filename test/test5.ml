module Foo = struct
  type t = int
  let foo (t: t) = Printf.printf "foo %d\n" t
end

module W = Fails.Functor.Make(Foo)
(*
ocamlopt -I lib -c test/test5.ml
File "test/test5.ml", line 6, characters 30-33:
Error: Signature mismatch:
       Modules do not match:
         sig type t = int val foo : t -> unit end
       is not included in
         IntFoo_t.IntFoo_t
       Unbound module type IntFoo_t.IntFoo_t
make: *** [test/test5.cmx] Error 2
*)
