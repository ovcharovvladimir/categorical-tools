module F (I : sig
  type t
end) =
struct
  module Quasigroup = Quasigroup.F (I)

  type op = ?_d:I.t Identity.C._class -> Quasigroup.op

  let op : op =
    let op ?_d:_ = Quasigroup.op in
    op
end
