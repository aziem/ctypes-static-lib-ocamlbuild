open Ctypes
open Foreign

let mean = foreign "mean" (float @-> float @-> returning float)

let _ =
  Printf.printf "%f\n" (mean 2.0 3.0)
