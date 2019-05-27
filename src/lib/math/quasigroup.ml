module F (I : sig
  type t
end) =
struct
  module I2 = struct
    type _ t = I.t
  end

  module Magma = Magma.F (I)

  module Iv =
    Invert.FF
      (I2)
      (struct
        type 'a t = 'a
      end)

  type op = ?_d:unit Iv.C._class -> Magma.op

  let op : op =
    let op ?_d:_ = Magma.op in
    op
end
