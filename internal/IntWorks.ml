module type Foo_t = sig
  type t
  val foo : t -> unit
end

module Make = functor (Foo : Foo_t) ->
struct
  let do_foo x = Foo.foo x
end
