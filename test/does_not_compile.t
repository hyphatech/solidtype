Each mistake the types exist to refuse, written in an island and built
against the installed library, with the error a user reads.

  $ cat > dune-project <<'EOF'
  > (lang dune 3.18)
  > (using melange 0.1)
  > (dialect
  >  (name mlx)
  >  (implementation
  >   (extension mlx)
  >   (preprocess
  >    (run mlx-pp %{input-file}))))
  > EOF
  $ cat > dune <<'EOF'
  > (library
  >  (name cases)
  >  (modes melange)
  >  (libraries solidtype solidtype-kobalte melange.dom)
  >  (preprocess
  >   (pps melange.ppx ppx_solidtype)))
  > EOF
  $ build () { dune build --root . 2>&1; }

A Kobalte part's check lists every attribute of its element, which the
compiler prints whole; [brief] keeps where and what, its last line.

  $ brief () { build | grep -E '^File|^[0-9]+ [|]|^ +[\^]+$|cannot be applied'; }

The components the cases use.

  $ cat > label.mlx <<'EOF'
  > let%component make ~(text : string) ?(count : int option) () =
  >   ignore count;
  >   <span>(fun () -> Solidtype.Jsx.string (text ()))</span>
  > EOF
  $ cat > each.mlx <<'EOF'
  > let%component make ~(each : 'a array) ~(children : 'a -> Solidtype.Jsx.element) () =
  >   ignore (each ());
  >   ignore children;
  >   <ul />
  > EOF

A correct island compiles.

  $ cat > case.mlx <<'EOF'
  > let make () =
  >   let count, _ = Solidtype.Solid.create_signal 0 in
  >   <div class_=(fun () -> if Solidtype.Solid.get count > 2 then "hot" else "cold")>
  >     <Label text=(fun () -> "times") count=(fun () -> Solidtype.Solid.get count) />
  >     <Each each=(fun () -> [| "a"; "b" |])>(fun s -> <li>(fun () -> Solidtype.Jsx.string s)</li>)</Each>
  >   </div>
  > EOF
  $ build

So does each namespace, a handler typed by its event.

  $ cat > case.mlx <<'EOF'
  > let make () =
  >   <input
  >     on_click=(Solidtype.Jsx.native (fun (e : Dom.mouseEvent) -> ignore e))
  >     on_input=(Solidtype.Jsx.capture (fun (e : Dom.inputEvent) -> ignore e))
  >     value=(Solidtype.Jsx.prop (fun () -> "x"))
  >     title=(Solidtype.Jsx.attr "t")
  >     hidden=(Solidtype.Jsx.bool false)
  >     on=(Solidtype.Jsx.listen "custom-event" (fun _ -> ()))
  >     attr=(Solidtype.Jsx.named "data-X" "y") />
  > EOF
  $ build

So does an SVG shape given the presentation attributes Solid's types pick
for it.

  $ cat > case.mlx <<'EOF'
  > let make () =
  >   <svg view_box="0 0 7 7" fill="none">
  >     <path d="M1 1H6V6Z" fill="currentColor" stroke="none" fill_rule="evenodd" />
  >   </svg>
  > EOF
  $ build

A read passed as an attribute's value, not inside a thunk.

  $ cat > case.mlx <<'EOF'
  > let make () =
  >   let count, _ = Solidtype.Solid.create_signal 0 in
  >   <div class_=(if Solidtype.Solid.get count > 2 then "hot" else "cold") />
  > EOF
  $ build
  File "case.mlx", line 3, characters 53-58:
  3 |   <div class_=(if Solidtype.Solid.get count > 2 then "hot" else "cold") />
                                                           ^^^^^
  Error: This constant has type string but an expression was expected of type
           unit -> string
         Hint: Did you forget to wrap the expression using fun () ->?
  [1]

A read passed as a child's value.

  $ cat > case.mlx <<'EOF'
  > let make () =
  >   let count, _ = Solidtype.Solid.create_signal 0 in
  >   <p>(Solidtype.Jsx.int (Solidtype.Solid.get count))</p>
  > EOF
  $ build
  File "case.mlx", line 3, characters 5-52:
  3 |   <p>(Solidtype.Jsx.int (Solidtype.Solid.get count))</p>
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  Error: This expression has type Solidtype.Jsx.content
         but an expression was expected of type unit -> Solidtype.Jsx.content
         Hint: Did you forget to wrap the expression using fun () ->?
  [1]

A read passed as a component's prop.

  $ cat > case.mlx <<'EOF'
  > let make () =
  >   let count, _ = Solidtype.Solid.create_signal 0 in
  >   <Label text=(if Solidtype.Solid.get count = 1 then "time" else "times") />
  > EOF
  $ build
  File "case.mlx", line 3, characters 53-59:
  3 |   <Label text=(if Solidtype.Solid.get count = 1 then "time" else "times") />
                                                           ^^^^^^
  Error: This constant has type string but an expression was expected of type
           unit -> 'a
         Hint: Did you forget to wrap the expression using fun () ->?
  [1]

A misspelt attribute.

  $ cat > case.mlx <<'EOF'
  > let make () = <div klass_="x" />
  > EOF
  $ build
  File "case.mlx", line 1, characters 26-29:
  1 | let make () = <div klass_="x" />
                                ^^^
  Error: Unbound type constructor Solidtype.Html.Div.klass_
  Hint:              Did you mean Solidtype.Html.Div.class_?
  [1]

A required prop left out.

  $ cat > case.mlx <<'EOF'
  > let make () = <Label />
  > EOF
  $ build
  File "case.mlx", line 1, characters 14-23:
  1 | let make () = <Label />
                    ^^^^^^^^^
  Error: This expression has type text:string Solidtype.Check.value -> unit
         but an expression was expected of type unit
         because it is in the result of a conditional with no else branch
  Hint: This function application is partial, maybe some arguments are missing.
  [1]

A prop the component does not take.

  $ cat > case.mlx <<'EOF'
  > let make () = <Label text=(fun () -> "x") colour="red" />
  > EOF
  $ build
  File "case.mlx", line 1, characters 49-54:
  1 | let make () = <Label text=(fun () -> "x") colour="red" />
                                                       ^^^^^
  Error: The function applied to this argument has type
           ?count:int Solidtype.Check.value -> ?props:Label.Props.t -> unit
  This argument cannot be applied with label ~colour
  [1]

A component's prop named props, the name a component's props take as one
value, spread.

  $ cat > case.mlx <<'EOF'
  > let%component make ~(props : string) () =
  >   <span>(fun () -> Solidtype.Jsx.string (props ()))</span>
  > EOF
  $ build
  File "case.mlx", line 1, characters 21-35:
  1 | let%component make ~(props : string) () =
                           ^^^^^^^^^^^^^^
  Error: props=p spreads a component's props, so no prop is named props: give
         this one another name
  [1]

Children given to a component that takes none.

  $ cat > case.mlx <<'EOF'
  > let make () = <Label text=(fun () -> "x")>"more"</Label>
  > EOF
  $ build
  File "case.mlx", line 1, characters 14-56:
  1 | let make () = <Label text=(fun () -> "x")>"more"</Label>
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  Error: The function applied to this argument has type
           ?count:int Solidtype.Check.value -> ?props:Label.Props.t -> unit
  This argument cannot be applied with label ~children
  [1]

Children whose type does not agree with another prop's.

  $ cat > case.mlx <<'EOF'
  > let make () =
  >   <Each each=(fun () -> [| "a"; "b" |])>(fun (n : int) -> <li>(fun () -> Solidtype.Jsx.int n)</li>)</Each>
  > EOF
  $ build
  File "case.mlx", line 2, characters 2-106:
  2 |   <Each each=(fun () -> [| "a"; "b" |])>(fun (n : int) -> <li>(fun () -> Solidtype.Jsx.int n)</li>)</Each>
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  Error: This expression has type
           (int -> Solidtype.Jsx.element, [> `render ])
           Solidtype.Check.children
         but an expression was expected of type
           (string -> Solidtype.Jsx.element, [ `render ])
           Solidtype.Check.children
         Type int is not compatible with type string
  [1]

A function passed by name where a prop takes a function, which would be
called as a thunk.

  $ cat > case.mlx <<'EOF'
  > let render s = <li>(fun () -> Solidtype.Jsx.string s)</li>
  > let make () = <Each each=(fun () -> [| "a" |])>render</Each>
  > EOF
  $ build
  File "case.mlx", line 2, characters 14-60:
  2 | let make () = <Each each=(fun () -> [| "a" |])>render</Each>
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  Error: This expression has type
           (string -> Solidtype.Jsx.element, [> `nodes ])
           Solidtype.Check.children
         but an expression was expected of type
           (string -> Solidtype.Jsx.element, [ `render ])
           Solidtype.Check.children
         The second variant type does not allow tag(s) `nodes
  [1]

A function given to an element as a child.

  $ cat > case.mlx <<'EOF'
  > let make () = <p>(fun s -> Solidtype.Jsx.string s)</p>
  > EOF
  $ build
  File "case.mlx", line 1, characters 17-50:
  1 | let make () = <p>(fun s -> Solidtype.Jsx.string s)</p>
                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  Error: a child is a string, an element or a thunk, (fun () -> ...); a
         function is a component's only child
  [1]

An attribute the element does not take.

  $ cat > case.mlx <<'EOF'
  > let make () = <div href="/home" />
  > EOF
  $ build
  File "case.mlx", line 1, characters 24-31:
  1 | let make () = <div href="/home" />
                              ^^^^^^^
  Error: Unbound type constructor Solidtype.Html.Div.href
  Hint:              Did you mean Solidtype.Html.Div.ref?
  [1]

An attribute named as JavaScript spells it, not by the spelling rule.

  $ cat > case.mlx <<'EOF'
  > let make () = <div contentEditable="true" />
  > EOF
  $ build
  File "case.mlx", line 1, characters 35-41:
  1 | let make () = <div contentEditable="true" />
                                         ^^^^^^
  Error: Unbound type constructor Solidtype.Html.Div.contentEditable
  Hint:              Did you mean Solidtype.Html.Div.contenteditable?
  [1]

A value its namespace's wrapper does not take: bool:hidden takes a bool.

  $ cat > case.mlx <<'EOF'
  > let make () = <div hidden=(Solidtype.Jsx.bool "yes") />
  > EOF
  $ build
  File "case.mlx", line 1, characters 46-51:
  1 | let make () = <div hidden=(Solidtype.Jsx.bool "yes") />
                                                    ^^^^^
  Error: This constant has type string but an expression was expected of type
           bool
  [1]

A native listener given to an attribute that is no handler.

  $ cat > case.mlx <<'EOF'
  > let make () = <div title=(Solidtype.Jsx.native (fun _ -> ())) />
  > EOF
  $ build
  File "case.mlx", line 1, characters 25-61:
  1 | let make () = <div title=(Solidtype.Jsx.native (fun _ -> ())) />
                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  Error: Jsx.native wraps a handler, on_<event>=(Jsx.native f)
  [1]

A namespace given to a component, whose props have none.

  $ cat > case.mlx <<'EOF'
  > let make () = <Label text=(Solidtype.Jsx.attr "x") />
  > EOF
  $ build
  File "case.mlx", line 1, characters 26-50:
  1 | let make () = <Label text=(Solidtype.Jsx.attr "x") />
                                ^^^^^^^^^^^^^^^^^^^^^^^^
  Error: a namespace is an element's: Jsx.native, Jsx.capture, Jsx.prop,
         Jsx.attr, Jsx.bool, Jsx.listen and Jsx.named wrap an element's
         attribute
  [1]

A value an attribute's closed set does not hold.

  $ cat > case.mlx <<'EOF'
  > let make () = <button type_=`sumbit />
  > EOF
  $ build
  File "case.mlx", line 1, characters 28-35:
  1 | let make () = <button type_=`sumbit />
                                  ^^^^^^^
  Error: The constructor `sumbit has type [> `sumbit ]
         but an expression was expected of type Solidtype.Html.Button.type_
         The second variant type does not allow tag(s) `sumbit
  [1]

An option given to Show, which Solid would read for truth.

  $ cat > case.mlx <<'EOF'
  > let make (user : unit -> string option) =
  >   <Solidtype.Show when_=(fun () -> user ())><p>"hello"</p></Solidtype.Show>
  > EOF
  $ build
  File "case.mlx", line 2, characters 24-43:
  2 |   <Solidtype.Show when_=(fun () -> user ())><p>"hello"</p></Solidtype.Show>
                              ^^^^^^^^^^^^^^^^^^^
  Error: This expression has type string option Solidtype.Check.value
         but an expression was expected of type bool Solidtype.Check.value
         Type string option is not compatible with type bool
  [1]

A prop omit is given that the component does not have.

  $ cat > case.mlx <<'EOF'
  > let rest props = Label.Props.omit props [| Label.Props.Colour |]
  > EOF
  $ build
  File "case.mlx", line 1, characters 43-61:
  1 | let rest props = Label.Props.omit props [| Label.Props.Colour |]
                                                 ^^^^^^^^^^^^^^^^^^
  Error: Unbound constructor Label.Props.Colour
  [1]

A Dynamic given no props, which its component needs.

  $ cat > case.mlx <<'EOF'
  > let make () = <Solidtype.Dynamic component=(fun () -> Label.component) />
  > EOF
  $ build
  File "case.mlx", line 1, characters 14-73:
  1 | let make () = <Solidtype.Dynamic component=(fun () -> Label.component) />
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  Error: This expression has type props:Label.Props.t -> unit
         but an expression was expected of type unit
         because it is in the result of a conditional with no else branch
  Hint: This function application is partial, maybe some arguments are missing.
  [1]

A Dynamic element given props as one value, which it takes as attributes.

  $ cat > case.mlx <<'EOF'
  > let make () = <Solidtype.Dynamic.Element component=(fun () -> "div") props=42 />
  > EOF
  $ brief
  File "case.mlx", line 1, characters 75-77:
  1 | let make () = <Solidtype.Dynamic.Element component=(fun () -> "div") props=42 />
                                                                                 ^^
  This argument cannot be applied with label ~props

A Dynamic element given an attribute of the wrong type.

  $ cat > case.mlx <<'EOF'
  > let make () = <Solidtype.Dynamic.Element component=(fun () -> "div") class_=42 />
  > EOF
  $ build
  File "case.mlx", line 1, characters 76-78:
  1 | let make () = <Solidtype.Dynamic.Element component=(fun () -> "div") class_=42 />
                                                                                  ^^
  Error: This expression has type int Solidtype.Check.value
         but an expression was expected of type string Solidtype.Check.value
         Type int is not compatible with type string
  [1]

A swipe event built by hand: Kobalte hands one to a toast's handlers, and an
event has no constructor.

  $ cat > case.mlx <<'EOF'
  > let e = Solidtype_kobalte.Types.SwipeEvent.make
  > EOF
  $ build
  File "case.mlx", line 1, characters 8-47:
  1 | let e = Solidtype_kobalte.Types.SwipeEvent.make
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  Error: Unbound value Solidtype_kobalte.Types.SwipeEvent.make
  [1]

A value taken for one JavaScript threw, which only a handler is given.

  $ cat > case.mlx <<'EOF'
  > let e = Solidtype.Solid.exn_of_thrown 42
  > EOF
  $ build
  File "case.mlx", line 1, characters 38-40:
  1 | let e = Solidtype.Solid.exn_of_thrown 42
                                            ^^
  Error: The constant 42 has type int but an expression was expected of type
           Solidtype.Solid.thrown
  [1]

A Kobalte value read as whatever type its caller names.

  $ cat > case.mlx <<'EOF'
  > let n (p : Solidtype_kobalte.Types.Context_Provider.t) : int =
  >   Solidtype_kobalte.Types.Context_Provider.value p
  > EOF
  $ build
  File "case.mlx", line 2, characters 2-48:
  2 |   Solidtype_kobalte.Types.Context_Provider.value p
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  Error: Unbound value Solidtype_kobalte.Types.Context_Provider.value
  [1]

A raw external under a Kobalte wrapper, which skips what the wrapper adds.

  $ cat > case.mlx <<'EOF'
  > let f = Solidtype_kobalte.Types.Color.to_format_js
  > EOF
  $ build
  File "case.mlx", line 1, characters 8-50:
  1 | let f = Solidtype_kobalte.Types.Color.to_format_js
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  Error: Unbound value Solidtype_kobalte.Types.Color.to_format_js
  Hint:   Did you mean Solidtype_kobalte.Types.Color.to_format?
  [1]

A method of Bun's File, which a browser's does not have.

  $ cat > case.mlx <<'EOF'
  > let f = Solidtype_kobalte.Types.File.image
  > EOF
  $ build
  File "case.mlx", line 1, characters 8-42:
  1 | let f = Solidtype_kobalte.Types.File.image
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  Error: Unbound value Solidtype_kobalte.Types.File.image
  [1]

A component without its last parameter, (), reported where it is defined.

  $ cat > case.mlx <<'EOF'
  > let%component make ~(name : string) =
  >   <p>(fun () -> Solidtype.Jsx.string (name ()))</p>
  > EOF
  $ build
  File "case.mlx", lines 1-2, characters 0-51:
  1 | let%component make ~(name : string) =
  2 |   <p>(fun () -> Solidtype.Jsx.string (name ()))</p>
  Error: a component's last parameter is ()
  [1]

A function given where a thunk belongs, which cannot be called as one.

  $ cat > case.mlx <<'EOF'
  > let make () = <Label text=(fun s -> s) />
  > EOF
  $ build
  File "case.mlx", line 1, characters 26-38:
  1 | let make () = <Label text=(fun s -> s) />
                                ^^^^^^^^^^^^
  Error: The value solidtype__text has type 'a -> 'a
         but an expression was expected of type string Solidtype.Check.value
  [1]

A changing value passed by its name where a thunk belongs: a name is passed
as it is, so its type, a function, is not the value's.

  $ cat > case.mlx <<'EOF'
  > let make () =
  >   let count () = "3" in
  >   <Label text=count />
  > EOF
  $ build
  File "case.mlx", line 3, characters 14-19:
  3 |   <Label text=count />
                    ^^^^^
  Error: The value solidtype__text has type unit -> string
         but an expression was expected of type string Solidtype.Check.value
  [1]

A Switch over a match that leaves a case out.

  $ cat > case.mlx <<'EOF'
  > type answer = Waiting | Ready of int | Refused
  > let make (answer : unit -> answer) =
  >   <Solidtype.Switch>
  >     (fun () ->
  >       match answer () with
  >       | Waiting -> <p>"waiting"</p>
  >       | Ready n -> <p>(fun () -> Solidtype.Jsx.int n)</p>)
  >   </Solidtype.Switch>
  > EOF
  $ build
  File "case.mlx", lines 4-7, characters 4-58:
  4 | ....(fun () ->
  5 |       match answer () with
  6 |       | Waiting -> <p>"waiting"</p>
  7 |       | Ready n -> <p>(fun () -> Solidtype.Jsx.int n)</p>)
  Error (warning 8 [partial-match]): this pattern-matching is not exhaustive.
    Here is an example of a case that is not matched: Refused
  [1]

A prop a Kobalte part does not take.

  $ cat > case.mlx <<'EOF'
  > module Switch = Solidtype_kobalte.Switch
  > let make () = <Switch.Root checkedd=(fun () -> true) />
  > EOF
  $ brief
  File "case.mlx", line 2, characters 36-52:
  2 | let make () = <Switch.Root checkedd=(fun () -> true) />
                                          ^^^^^^^^^^^^^^^^
  This argument cannot be applied with label ~checkedd

A Kobalte part given an attribute its element does not take.

  $ cat > case.mlx <<'EOF'
  > module Switch = Solidtype_kobalte.Switch
  > let make () = <Switch.Control href="/x" />
  > EOF
  $ brief
  File "case.mlx", line 2, characters 35-39:
  2 | let make () = <Switch.Control href="/x" />
                                         ^^^^
  This argument cannot be applied with label ~href

A single-value Select given a list for its value.

  $ cat > case.mlx <<'EOF'
  > module Select = Solidtype_kobalte.Select
  > let make () =
  >   <Select.Root options=(fun () -> [| Solidtype_kobalte.Types.Either.left "a" |])
  >     value=(fun () -> Js.Nullable.return [| "a" |]) />
  > EOF
  $ build
  File "case.mlx", line 3, characters 23-80:
  3 |   <Select.Root options=(fun () -> [| Solidtype_kobalte.Types.Either.left "a" |])
                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  Error: This expression has type
           (string, 'a) Solidtype_kobalte.Types.either array
           Solidtype.Check.value
         but an expression was expected of type
           (string array, 'b) Solidtype_kobalte.Types.either array
           Solidtype.Check.value
         Type string is not compatible with type string array
  [1]

A Select of many values without multiple, which Kobalte reads to choose.

  $ cat > case.mlx <<'EOF'
  > module Select = Solidtype_kobalte.Select
  > let make () =
  >   <Select.Root_multiple options=(fun () -> [| Solidtype_kobalte.Types.Either.left "a" |]) />
  > EOF
  $ build
  File "case.mlx", line 3, characters 2-92:
  3 |   <Select.Root_multiple options=(fun () -> [| Solidtype_kobalte.Types.Either.left "a" |]) />
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  Error: This expression has type multiple:bool Solidtype.Check.value -> unit
         but an expression was expected of type unit
         because it is in the result of a conditional with no else branch
  Hint: This function application is partial, maybe some arguments are missing.
  [1]
