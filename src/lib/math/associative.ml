(*
module M (I : sig type _ t end) = struct

module type T = sig
  type a type b type c
  val op : a t -> b t -> c t
end

end
*)

module type S = sig
  type _ t
  type (_, _) closure
  type (_, _) op
  type _ permuted

  val op : 'a t -> ('b, 'a) closure t -> (('a, 'b) op, 'a) closure t

  module AssociativeRules : sig
    val perm01 : (('a, 'b) op, 'c) op t -> ('a, ('b, 'c) op) op t
    val perm02 : ('a, ('b, 'c) op) op t -> (('a, 'b) op, 'c) op t
    val perm03 : ('a, 'b) op t -> ('a permuted, 'b) op permuted t
    val perm04 : ('a, 'b) op t -> ('a, 'b permuted) op permuted t
  end
end

module M (I : S) = struct
  open I
end
