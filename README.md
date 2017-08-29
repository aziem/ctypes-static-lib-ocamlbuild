Small example showing how to build a small C static library and static linking with an OCaml library.


The static library lives under clib. The file libtest.clib allows
ocamlbuild to compile the C files:

```shellscript
mytest.o
```

In the tags file the following line tells ocamlbuild to add the C code as a depedency for test.ml:

```shellscript
<test.cm{x,}a>: linkdep(clib/libtest.a)
```

This depedency is realised in the OCamlbuild plugin: myocamlbuild.ml contains the following:

```shellscript
pdep ["library";"link"] "linkdep" (fun param -> [param]);
```

The above gives enough information to OCamlbuild to build the libtest.a archive under clib.

The linkarchive tag under _tags controls when static linking to libtest.a happens: the linking should only occur for the final OCaml library object file: test.cmxa

Thus the linking only happens when a file is tagged with linkarchive, and other object files are not linked against libtest.a



