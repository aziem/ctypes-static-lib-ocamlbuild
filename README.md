Small example showing how to link with a static library using OCaml-Ctypes


NOTE: the oasis branch shows how to build the C static library and
linking with an OCaml executable


The static library lives in clib. Build the static lib using:

```shellscript
cd clib; make libtest.a
```

Then in the top-level directory:

```shellscript
make test.native
```

will build a small OCaml executable which statically links with the static lib in clib.

The myocamlbuild.ml file has a variable pointing to the location of the static lib.

myocamlbuild.ml contains code to check if the current OS is Linux or
OSX to set the right linkage flag.

TODO: make ocamlbuild build the C static lib. 
