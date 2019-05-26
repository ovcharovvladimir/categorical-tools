(*
module F (I : T.S) = struct
  open I
  module Magmoid = Magmoid.F (I)

  module type C = sig
    type a
    type b
    type c

    val op 
      :  ?_d:('a, 'b, 'c) Magmoid.C._class
      -> ?_d:('a, 'b, 'c) Associative.C._class
      -> (a * b as 'a) t
      -> (b * c as 'b) t
      -> (a * c as 'c) t
  end
  [@@typeclass]
end

module T1 = struct
  module I = struct
    type 'a t = S : (int -> int) -> (int * int) t
  end

  open I
  module SG = F (I)
  open SG

  module T2 = struct
    let op ?_d:_ ?_d:_ a b =
      match (a, b) with S a, S b -> S (fun c -> b (a c))
  end
  [@@instance:
    (module SG.C with type a = int and type b = int and type c = int)]

  module KU = struct
    open SG.Magmoid

    module T3 = struct
      let op ?_d:_ a b = match (a, b) with S a, S b -> S (fun c -> b (a c))
    end
    [@@instance:
      (module
       SG.Magmoid.C
         with type a = int * int and type b = int * int and type c = int * int)]
  end

  open KU

  module KUU = struct
    open Associative

    module T4 = struct end
    [@@instance:
      (module
       Associative.C
         with type a = int * int and type b = int * int and type c = int * int)]
  end

  open KUU

  let test1 = S (fun a -> a + 1)
  let test2 = S (fun a -> a + 2)
  let test3 = SG.C.op test1 test2
end
*)
