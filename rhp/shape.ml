type t
type coord

(* A coordinate is a number or a string, as rhp reads it; a command is an
   array of a letter and its coordinates, and the letter a string too. *)
external share : float -> coord = "%identity"
external css : string -> coord = "%identity"

type command = coord array

let m x y = [| css "M"; x; y |]
let l x y = [| css "L"; x; y |]
let q cx cy x y = [| css "Q"; cx; cy; x; y |]
let c c1x c1y c2x c2y x y = [| css "C"; c1x; c1y; c2x; c2y; x; y |]
let z = [| css "Z" |]

external shape : command array -> t = "shape" [@@mel.module "@bezda/rhp"]

let make x y commands = shape (Array.of_list (m x y :: commands))
