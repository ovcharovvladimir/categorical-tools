module FF (OpI : T.S) (InvI : T.S) = struct
  open OpI
  module Sc = SmallCategory.F (OpI)
  module Iv = Invert.FF (OpI) (InvI)

  type 'a ivc = 'a Iv.C._class

  type ('a, 'b, 'c) op =
    ?_d:'a ivc -> ?_d:'b ivc -> ?_d:'c ivc -> ('a, 'b, 'c) Sc.op

  let op : ('a, 'b, 'c) op =
    let op ?_d:_ ?_d:_ ?_d:_ = Sc.op in
    op
end
