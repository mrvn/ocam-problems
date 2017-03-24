all: test-signal-exception
	./test-signal-exception


test-signal-exception: test-signal-exception.ml
	ocamlopt -o test-signal-exception unix.cmxa test-signal-exception.ml
