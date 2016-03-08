ocam-problems
=============

memory problems in Gc.finalise when sharing a Waek.t with C stubs

  % make
  ocamlopt -g -c -o main.cmx main.ml
  gcc -O2 -W -Wall -g -c -o stubs.o stubs.c
  ocamlopt -o test main.cmx stubs.o
  ./test
  Creating object
  setup(0x7fae26d10fa8)
  test
    weak = 0x7fae26d10fa8
    obj = 0x7fae26f12098
    tag = 248
  test done
  Garbage collection
  cleanup
  test
    weak = 0x7fae26d10fa8
    obj = 0x6730d0
    tag = 168
  test done
  Makefile:2: recipe for target 'all' failed
  make: *** [all] Segmentation fault
