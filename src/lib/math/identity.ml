module type C = sig
  type a

  val id : a
end
[@@typeclass]

let id = C.id
