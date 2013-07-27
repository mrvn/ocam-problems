module Make = functor (Foo : IntFoo_t.IntFoo_t) ->
struct
  let do_foo x = Foo.foo x
end
