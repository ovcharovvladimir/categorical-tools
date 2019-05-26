module type S = sig
  type t

  val f : unit -> t
end
[@@typeclass]
