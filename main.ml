external setup : 'a Weak.t -> unit = "setup"
external test : unit -> unit = "test"

let cleanup obj =
  Printf.printf "cleanup\n%!";
  test ()

class obj = object(self)
  val weak = Weak.create 1
  initializer Weak.set weak 0 (Some self)
  initializer setup weak
  initializer Gc.finalise cleanup self
end

let () =
  Printf.printf "Creating object\n%!";
  ignore (new obj);
  test ()

let () =
  Printf.printf "Garbage collection\n%!";
  Gc.full_major ()

let () =
  Printf.printf "checking after GC\n%!";
  test ()

