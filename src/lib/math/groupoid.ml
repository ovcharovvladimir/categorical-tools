module F (I : T.S) = struct
  open I
  module Sc = SmallCategory.F (I)

  type ('a, 'b, 'c) op = ('a, 'b, 'c) Sc.op

  (*
  let op : ('a, 'b, 'c) op =
    let op ?_d:_ ?_d:_ ?_d:_ = Sg.op in
    op
*)
end
