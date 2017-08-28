open Ocamlbuild_plugin
open Command

type platform = Linux | OSX

let get_platform () =
  let cmd = Unix.open_process_in "uname" in
  let res =
	try String.trim (input_line cmd)
	with End_of_file -> ""
  in
  let () = close_in cmd in
  match res with
	| "Linux" -> Linux
        | "Darwin" -> OSX
        | _ -> Linux (* Assume linux by default *)

let static_lib_loc =
  match get_platform () with
  | OSX -> "/Users/aac31/work/personal/github/ctypes-static-lib-ocamlbuild/clib/libtest.a"
  | Linux -> "/home/aziem/work/personal/github/ctypes-static-lib-ocamlbuild/clib/libtest.a"

let () =
  dispatch begin function
    | After_rules ->
      begin
      match get_platform () with
      | OSX -> 	flag ["link"; "ocaml"; "native"]
        	  (S[A"-cclib"; A("-Wl,-force_load " ^ static_lib_loc) ; ])
      | Linux -> flag ["link"; "ocaml"; "native"]
                   (S[A"-cclib"; A("-Wl,--whole-archive " ^ static_lib_loc) ; A"-cclib"; A"-Wl,--no-whole-archive"; A"-cclib";A"-Wl,-E" ])
      end
    | _ -> ()
  end
