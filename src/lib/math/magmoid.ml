module F (I : T.S) = struct
  open I

  module type C = sig
    type a
    type b
    type c
  end
  [@@typeclass]

  type ('a, 'b, 'c) op =
    ?_d:('a, 'b, 'c) C._class -> ('a t, 'b t, 'c t) Binop.op

  let op : ('a, 'b, 'c) op =
    let op ?_d:_ = Binop.op in
    op
end
