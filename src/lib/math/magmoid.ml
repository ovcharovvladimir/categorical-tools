module F (I : T.S) = struct
  open I

  module type C = sig
    type a
    type b
    type c
  end
  [@@typeclass]

  type ('a, 'b, 'c) op =
    ?_d:('a, 'b, 'c) C._class -> ('a t, 'b t, 'c t) Binop.op

  let op : ('a, 'b, 'c) op =
    let op ?_d:_ = Binop.C.op in
    op
end

module Test01 = struct
  type 'a t = S : (int -> int) -> (int * int) t
end

module I01 = struct
  open Test01
  open Binop

  module Test02 = struct
    let op a b = match (a, b) with S a, S b -> S (fun c -> b (a c))
  end
  [@@instance:
    (module
     C
       with type a = (int * int) t
        and type b = (int * int) t
        and type c = (int * int) t)]
end

module I02 = struct
  module M = F (Test01)
  open Test01
  open M

  module Test03 = struct end
  [@@instance:
    (module
     C
       with type a = int * int and type b = int * int and type c = int * int)]
end

open I01
open I02
module M = F (Test01)
open Test01
open Binop
open M

let test01 = S (fun a -> a + 1)
let test02 = S (fun a -> a + 2)
let test03 : (int * int) t = op test01 test02
