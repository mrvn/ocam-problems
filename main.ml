external fail : unit -> unit = "fail"
external test : (unit -> unit) -> unit = "test"

let callback () =
  fail ()
   
let () =
  test callback

