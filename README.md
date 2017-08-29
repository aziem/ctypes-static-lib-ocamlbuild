Small example showing how to link with a static library using
OCaml-Ctypes. 

The master branch is a pure ocamlbuild solution to build a static C
lib and building an OCaml executable linking with the C lib.

NOTE: There are two other branches:

1. The oasis branch shows how to build the C static library and
   linking with an OCaml executable using the Oasis build tool.
   
2. The oasis-lib branch shows how to build a C static library and an
   OCaml library which is statically linked against the C lib.

In the top-level directory:

```shellscript
oasis setup
```

followed by:

```shellscript
make test.native
```

will build a small OCaml executable which statically links with the static lib in clib.

myocamlbuild.ml contains code to check if the current OS is Linux or
OSX to set the right linkage flag.

