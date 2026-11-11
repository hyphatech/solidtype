(* A project's colour, as its folder is drawn: one of Tailwind's, since
   HeroUI's tokens name what a colour means, never which project it is. *)

type t = Api.project_colour = Blue | Green | Orange | Purple | Pink

let all = [ Blue; Green; Orange; Purple; Pink ]

let label = function
  | Blue -> "Blue"
  | Green -> "Green"
  | Orange -> "Orange"
  | Purple -> "Purple"
  | Pink -> "Pink"

let key = function
  | Blue -> "blue"
  | Green -> "green"
  | Orange -> "orange"
  | Purple -> "purple"
  | Pink -> "pink"

let of_key k = List.find_opt (fun c -> String.equal (key c) k) all

(* Written whole, so Tailwind finds each class in this file. *)
let text_class = function
  | Blue -> "text-blue-500"
  | Green -> "text-green-500"
  | Orange -> "text-orange-500"
  | Purple -> "text-purple-500"
  | Pink -> "text-pink-500"

let to_draft : t -> Api.project_draft_input_colour = function
  | Blue -> Blue
  | Green -> Green
  | Orange -> Orange
  | Purple -> Purple
  | Pink -> Pink
