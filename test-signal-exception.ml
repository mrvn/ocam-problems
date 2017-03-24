exception Break

let break _ = raise Break

let main_loop () =
  Sys.signal Sys.sigint (Sys.Signal_handle break);
  try (* Read and evaluate user commands  *)
    while true do
      Printf.printf "Press CTRL-C to stop\n%!";
      Unix.sleep 1
    done
  with Break ->
    Printf.printf "Break\n%!"

let () =
  main_loop ()
