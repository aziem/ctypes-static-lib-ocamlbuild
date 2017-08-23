Small example showing how to link with a static library using OCaml-Ctypes

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

This only works on Linux: OSX will require different incantations passed to its linker.

TODO: make ocamlbuild build the C static lib. 