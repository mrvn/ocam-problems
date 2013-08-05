ocam-problems
=============

Problem with ocamldep using proxy objects:

1. run make to build c.cmx
2. edit a.mli to read: type t
3. run make

```
% make      
ocamldep *.ml *.mli >depends
ocamlc -c -o a.cmi a.mli
ocamlopt -c -o temp.a.cmx a.ml
rm -f temp.a.cmi
mv temp.a.o a.o
mv temp.a.cmx a.cmx
ocamlopt -c -o temp.b.cmx b.ml
rm -f temp.b.cmi
mv temp.b.o b.o
mv temp.b.cmx b.cmx
ocamlopt -c -o temp.c.cmx c.ml
File "c.ml", line 1:
Error: The files b.cmi and a.cmi make inconsistent assumptions
       over interface A
make: *** [c.cmx] Error 2
```
