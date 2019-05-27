(*
module M = struct
  type _ t = SQ4 : Z.t * Z.t * Z.t * Z.t -> [`CellType of Z.t] t
  type ('a, 'b) closure = 'b
  type ('a, 'b) op = 'a
  type 'a permuted = 'a

  let op : 'a t -> 'a t -> 'a t =
   fun a b ->
    ignore (a, b) ;
    failwith ""

  module AssociativeRules = struct
    let perm01 a = a
    let perm02 a = a
    let perm03 a = a
    let perm04 a = a
  end
end

module Valid = Semigroup.Validate (M)
*)
