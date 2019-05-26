module ClassF (I : T.S) = struct
  open I

  module type C = sig
    type a
    type b
    type c

    val op : a t -> b t -> c t
  end
  [@@typeclass]

  open Binop

  module Binop_ (CV : C [@typeclass (_a, _b, _c) C]) = struct
    let op = CV.op
  end
  [@@instance:
    (module Binop.Class with type a = _a t and type b = _b t and type c = _c t)]
end

module type S = sig
  module I : T.S
  include ClassF(I).C
end
