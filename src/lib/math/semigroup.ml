module type S = sig
  type 'a t
  type ('a, 'b) closure = 'b
  type ('a, 'b) op = 'a
  type 'a permuted = 'a

  val op : 'a t -> 'a t -> 'a t

  module AssociativeRules : sig
    val perm01 : 'a t -> 'a t
    val perm02 : 'a t -> 'a t
    val perm03 : 'a t -> 'a t
    val perm04 : 'a t -> 'a t
  end
end

module Validate (I : S) = struct
  module Magma : Magma.S = I
  module Associative : Associative.S = I
end
