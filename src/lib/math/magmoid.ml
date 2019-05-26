module F (I : T.S) = struct
  open I

  module type C = sig
    type a
    type b
    type c

    val op : ?_d:(a, b, c) Binop.C._class -> a t -> b t -> c t
  end
  [@@typeclass]

  (*
  open Binop

  module Binop_ (CV : C [@typeclass (_a, _b, _c) C]) = struct
    let op = CV.op
  end
  [@@instance:
    (module Binop.Class with type a = _a t and type b = _b t and type c = _c t)]
*)
end
