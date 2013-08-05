ocam-problems
=============

This (tries to) solve 3 problems:

1. I like to see what types ocaml actualy inferrs for my classes.
The inferred types are also a good starting point for writing mli
files.

2. When a .ml file without .mli file is changed the .cmi is
implicitly rebuild. This causes everything depending on the .cmi file
to be rebuild too, even if the .cmi hasn't changed.

3. When doing parallel builds the .cmi file is build implicitly
when building .cmo and .cmx. This can happen in parallel causing
errors. And if it doesn't happen in parallel the second build screws
up the timestamp causing things to be rebuild on the next make run for
no reason.


As first attempt I build .inferred files from .ml files and then
compile them to .cmi files. I also prevent .cmo and .cmx rules from
overwriting the .cmi. This solves the first and third problem.

To solve the second I added a .inferred.new step and .inferred is only
overwritten if it differs from .inferred.new.

Note: The %.inferred: %.inferred.new rule should be made silent if
nothing changed because it runs every time once the cmp succeeds.



# PROBLEM

At the bottom of the Makefile you see 2 manual dependencies:
```
b.inferred.new: a.cmi
c.inferred.new: b.cmi
```

ocamldep can't generate them, it won't even output the dependencies
for the cmi files:
```
b.cmi: a.cmi
c.cmi: b.cmi
```
Those are only added if there are mli files.

I'm looking for a way to generate the dependencies automatically now.
