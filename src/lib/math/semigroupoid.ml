module F (I : T.S) = struct
  open I
  module Magmoid = Magmoid.F (I)

  type ('a, 'b, 'c) make_op =
    ?_d:('a t, 'b t, 'c t) Associative.C._class -> ('a, 'b, 'c) Magmoid.op

  type ('a, 'b, 'c) op = ('a * 'b, 'b * 'c, 'a * 'c) make_op

  let op : ('a, 'b, 'c) op =
    let op ?_d:_ = Magmoid.op in
    op
end
