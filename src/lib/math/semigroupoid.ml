module type S = sig
  type _ t
  type ('a, _) closure = 'a
  type (_, _) op
  type _ permuted

  val op : 'a t -> 'b t -> ('a, 'b) op t
  val reduce : ('a * 'b, 'b * 'c) op t -> ('a * 'c) t

  module AssociativeRules : sig
    val perm01 : (('a, 'b) op, 'c) op t -> ('a, ('b, 'c) op) op t
    val perm02 : ('a, ('b, 'c) op) op t -> (('a, 'b) op, 'c) op t
    val perm03 : ('a, 'b) op t -> ('a permuted, 'b) op permuted t
    val perm04 : ('a, 'b) op t -> ('a, 'b permuted) op permuted t
  end
end

module Validate (I : S) = struct
  module Associative : Associative.S = I
end
