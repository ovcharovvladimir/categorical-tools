(*
module F (R : module type of Random) = struct
  open R

  let f : (t -> bool) -> bool =
   fun test ->
    let rec f = function
      | 0 -> true
      | i ->
          let a = random () in
          if test a then f (i - 1) else false
    in
    f 99
end
*)
