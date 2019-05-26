module type C = sig
  type a
  type b
  type c

  val op : a -> b -> c
end
[@@typeclass]
