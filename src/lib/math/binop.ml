module type Class = sig
  type a
  type b
  type c

  val op : a -> b -> c
end
[@@typeclass]

module type S = Class
