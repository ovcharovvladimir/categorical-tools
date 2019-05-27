module F (I : sig
  type t
end) =
struct
  module I2 = struct
    type _ t = I.t
  end

  module Magmoid = Magmoid.F (I2)

  type op = (unit, unit, unit) Magmoid.op

  let op : op = Magmoid.op
end
