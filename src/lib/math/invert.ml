module type C = sig
  type a
  type b

  val inv : a -> b
end
[@@typeclass]

module F (I : T.S) = struct
  open I

  module type Base = sig
    type a

    val inv1 : a -> a t
    val inv2 : a t -> a
    val norm : a t t -> a
  end
  [@@typeclass]

  module Rule01 (CV : Base [@typeclass _a Base]) = struct
    let inv = CV.inv1
  end
  [@@instance: (module C with type a = _a and type b = _a t)]

  module Rule02 (CV : Base [@typeclass _a Base]) = struct
    let inv = CV.inv2
  end
  [@@instance: (module C with type a = _a t and type b = _a)]

  module Rule03 (CV : Base [@typeclass _a Base]) = struct
    let inv a = CV.inv1 (CV.norm a)
  end
  [@@instance: (module C with type a = _a t t and type b = _a t)]
end
