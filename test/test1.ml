module Foo = struct
  type t = int
  let foo (t: t) = Printf.printf "foo %d\n" t
end

module W = Works.Functor.Make(Foo)
