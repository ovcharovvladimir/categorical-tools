module type C = sig
  type a
  type b

  val f : a -> b
end
[@@typeclass]
