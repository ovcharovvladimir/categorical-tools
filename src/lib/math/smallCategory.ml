module F (I : T.S) = struct
  open I
  module Sg = Semigroupoid.F (I)

  type 'a idc = ('a * 'a) t Identity.C._class

  type ('a, 'b, 'c) op =
    ?_d:'a idc -> ?_d:'b idc -> ?_d:'c idc -> ('a, 'b, 'c) Sg.op

  let op : ('a, 'b, 'c) op =
    let op ?_d:_ ?_d:_ ?_d:_ = Sg.op in
    op
end
