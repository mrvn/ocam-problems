module Make = functor (Foo : IntFoo_t.T_t) ->
struct
  let do_foo x = Foo.foo x
end
