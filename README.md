ocam-problems
=============

When an ocaml function is used as callback from C code and the last
thing the callback does is call a C stub returning unit and the return
register happens to contain ((x & 3) == 2) then this is taken as an
exception.

Ocaml should sanitize the return register after calling the C stub.

    % make
    ocamlopt -g -c -o main.cmx main.ml
    gcc -O2 -W -Wall -g -c -o stubs.o stubs.c
    ocamlopt -o test main.cmx stubs.o
    ./test
    test(0x61ea78)
    fail
    test: callback got exception 0x0
