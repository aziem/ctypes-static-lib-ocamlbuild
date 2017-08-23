test.native: test.ml
	ocamlbuild -use-ocamlfind -pkg ctypes -pkg ctypes.foreign test.native

clean:
	ocamlbuild -clean
