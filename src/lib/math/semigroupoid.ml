module ClassF (I : T.S) = struct
  open I

  module type C = sig
    type a
    type b
    type c

    val op : (a * b) t -> (b * c) t -> (a * c) t
  end
  [@@typeclass]

  module MagmoidClassI = Magmoid.ClassF (I)

  module Magmoid_ (CV : C [@typeclass (_a, _b, _c) C]) = struct
    let op a b = failwith ""
  end
  [@@instance:
    (module
     MagmoidClassI.C
       with type a = _a * _b and type b = _b * _c and type c = _a * _c)]
end

module type S = sig
  module I : T.S
  include ClassF(I).C
end
