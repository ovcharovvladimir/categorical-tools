(*
module ClassesF (I : T.S) = struct
  open I

  module type Associativity = sig
    type a
    type b
    type c

    val op : (a * b) t -> (b * c) t -> (a * c) t
  end
  [@@typeclass]

  module type Identity = sig
    type a

    val op : (a * a) t
  end

  module SemigroupoidClassI = Semigroupoid.ClassF (I)
  open SemigroupoidClassI

  module Semigroupoid_
      (CV : Associativity [@typeclass (_a, _b, _c) Associativity]) =
  struct
    let op = CV.op
  end
  [@@instance:
    (module
     SemigroupoidClassI.C
       with type a = _a and type b = _b and type c = _c)]
end

module type S = sig
  module I : T.S
  include ClassesF(I).Associativity
end
*)
