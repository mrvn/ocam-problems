module Foo = struct
  type t = int
  let foo (t: t) = Printf.printf "foo %d\n" t
end

module W = Works.Functor.Make(Foo)
(*
module F = Fails.Functor.Make(Foo)
*)
(*
File "test/test.ml", line 8, characters 30-33:
Error: Signature mismatch:
       Modules do not match:
         sig type t = int val foo : t -> unit end
       is not included in
         IntFoo_t.IntFoo_t
       Unbound module type IntFoo_t.IntFoo_t
make: *** [test/test.cmx] Error 2
*)
(*
  module F2 = Fails.Functor.Make(Fails.Foo)
*)
(*  
File "test/test.ml", line 21, characters 32-41:
Error: Signature mismatch:
       Modules do not match:
         sig module IntFoo : sig type t = int val foo : t -> unit end end
       is not included in
         IntFoo_t.IntFoo_t
       Unbound module type IntFoo_t.IntFoo_t
make: *** [test/test.cmx] Error 2
*)
(*
module W2 = Works.Functor.Make(Works.Foo)
*)
(*
  File "test/test.ml", line 34, characters 31-40:
Error: Signature mismatch:
       Modules do not match:
         sig module IntFoo : sig type t = int val foo : t -> unit end end
       is not included in
         Works.Functor.Foo_t
       The field `foo' is required but not provided
       The field `t' is required but not provided
make: *** [test/test.cmx] Error 2
*)
