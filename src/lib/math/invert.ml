module type C = sig
  type a
  type b

  val inv : a -> b
end
[@@typeclass]

module FF (OpI : T.S) (IvI : T.S) = struct
  module type C2 = sig
    type a

    val inv1 : a OpI.t -> a IvI.t OpI.t
    val inv2 : a IvI.t OpI.t -> a OpI.t
  end
  [@@typeclass]

  module Rule01 (CV : C2 [@typeclass _a C2]) = struct
    let inv = CV.inv1
  end
  [@@instance:
    (module Invert.C with type a = _a OpI.t and type b = _a IvI.t OpI.t)]

  module Rule02 (CV : C2 [@typeclass _a C2]) = struct
    let inv = CV.inv2
  end
  [@@instance:
    (module Invert.C with type a = _a IvI.t OpI.t and type b = _a OpI.t)]

  module C = C2

  module type C = C2
end
