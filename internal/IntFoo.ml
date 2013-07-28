module T = struct
  type t = int
  let foo (t: t) = Printf.printf "foo %d\n" t
end
