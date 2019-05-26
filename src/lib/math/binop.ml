module type C = sig
  type a
  type b
  type c

  val op : a -> b -> c
end
[@@typeclass]

type ('a, 'b, 'c) op = ?_d:('a, 'b, 'c) C._class -> 'a -> 'b -> 'c

let op = C.op
