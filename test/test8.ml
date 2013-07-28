module Foo = IntFoo
(* Works but I want it to fail *)

module Foo2 = struct
  type t = int
  let foo (t: t) = Printf.printf "foo %d\n" t
end

module F = Fails.Functor.Make(Foo2)
(* Works now *)

module F2 = Fails.Functor.Make(Fails.Foo.T)
(* Works now *)
