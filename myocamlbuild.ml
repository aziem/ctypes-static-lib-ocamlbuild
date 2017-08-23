open Ocamlbuild_plugin
open Command

let static_lib_loc = "/home/aziem/work/personal/github/ctypes-static-lib-ocamlbuild/clib/libtest.a"

let () =
  dispatch begin function
    | After_rules ->
      flag ["link"; "ocaml"; "native"]
        (S[A"-cclib"; A("-Wl,--whole-archive " ^ static_lib_loc) ; A"-cclib"; A"-Wl,--no-whole-archive"; A"-cclib";A"-Wl,-E" ])
    | _ -> ()
  end
