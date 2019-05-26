

#define RUN_TEST(CV) \
let run_test () = \
  match CV.f with f, j, k, l -> \
  let a = CV.randomA () in \
  let b = CV.randomB () in \
  let d = CV.randomD () in \
  let c = f a b in \
  let e = j b d in \
  let f1 = k c d in \
  let f2 = l a e in \
  if CV.equalF f1 f2 then () else failwith "testbla"

#define WITH_TEST(CV,x) (RUN_TEST(CV) in run_test (); x)


module Make (T : sig
  type _ t
end) =
struct
  open T

  module type TernopOfBinops = sig
    type a
    type b
    type c
    type d
    type e
    type f

    val f :
      (a t -> b t -> c t)
      * (b t -> d t -> e t)
      * (c t -> d t -> f t)
      * (a t -> e t -> f t)

    val randomA : unit -> a t
    val randomB : unit -> b t
    val randomD : unit -> d t
    val equalF : f t -> f t -> bool
  end
  [@@typeclass]

  module Ab2c : sig
    type ('a, 'b, 'c) t

    val of_t : ('a, 'b, 'c) t -> 'c
    val to_t : 'c -> ('a, 'b, 'c) t
  end = struct
    type ('a, 'b, 'c) t = 'c

    let of_t a = a
    let to_t a = a
  end

  module type Binop = sig
    type a
    type b
    type c

    val f : a -> b -> c
  end
  [@@typeclass]

  module NEWXXXXRANDOM
      (CV : TernopOfBinops
        [@typeclass (_a, _b, _c, _b, _b, _c) TernopOfBinops]) =
  struct
    let f a b = WITH_TEST(CV,(match CV.f with f, _, _, _ -> Ab2c.to_t (f a b)))
  end
  [@@instance:
    (module
     Binop
       with type a = _a t and type b = _b t and type c = (_a, _b, _c t) Ab2c.t)]

  module NEWXXXXRANDOM
      (CV : TernopOfBinops
        [@typeclass (_a, _b, _c, _d, _e, _f) TernopOfBinops]) =
  struct
    let f a b = WITH_TEST(CV,(match CV.f with _, _, f, _ -> Ab2c.to_t (f (Ab2c.of_t a) b)))
  end
  [@@instance:
    (module
     Binop
       with type a = (_a, _b, _c t) Ab2c.t
        and type b = _d t
        and type c = (_c, _d, _f t) Ab2c.t)]


end
