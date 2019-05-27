module F (I : sig
  type t
end) =
struct
  open I

  module I2 = struct
    type _ t = I.t
  end

  module Magma = Magma.F (I)

  type op = ?_d:(t, t, t) Associative.C._class -> Magma.op

  let op : op =
    let op ?_d:_ = Magma.op in
    op
end
