module type S = sig
  type _ t

  val op : 'a t -> 'a t -> 'a t
end
