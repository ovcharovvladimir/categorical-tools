
type point = { w : Z.t; x : Z.t; y : Z.t; z : Z.t }

type _ t = Ball   : point -> [ `Ball   ] t
         | Sphere : point -> [ `Sphere ] t

let sq : Z.t -> Z.t = fun a -> Z.mul a a

let sqrt_s : Z.t -> Z.t -> Z.t = fun a -> fun b -> Z.( of_int (sign a) * sqrt b )

let ball_to_shere : Z.t -> [ `Ball ] t -> [ `Sphere ] t = fun scale -> function
  | Ball { w; x; y; z } ->
    let sqs = sq scale in
    let sqw = sq w in
    let sqx = sq x in
    let sqy = sq y in
    let sqz = sq z in
    let b = Z.( sqw + sqx + sqy + sqz ) in
    Sphere { w = sqrt_s w Z.((sqw * sqs) / b)
           ; x = sqrt_s x Z.((sqx * sqs) / b)
           ; y = sqrt_s y Z.((sqy * sqs) / b)
           ; z = sqrt_s z Z.((sqz * sqs) / b) }

