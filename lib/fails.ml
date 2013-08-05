module Foo_t = IntFoo_t
module Foo = struct module T : IntFoo_t.T_t = IntFoo.T end
module Functor = IntFails
