(* @internationalized/date's functions: its conversions, queries and
   parsers, and the values they make and take, in Types. Generated from the
   declarations of @internationalized/date 3.12.4 by
   generate/internationalized_date.ts; never edited by hand. *)

module Types = Types

external create_calendar : string -> Types.Calendar.t = "createCalendar"
[@@mel.module "@internationalized/date"]
(** Creates a `Calendar` instance from a Unicode calendar identifier string. *)

external end_of_month : Types.ZonedDateTime.t -> Types.ZonedDateTime.t
  = "endOfMonth"
[@@mel.module "@internationalized/date"]
(** Returns the last date of the month for the given date. *)

external end_of_week :
  Types.ZonedDateTime.t ->
  string ->
  ?first_day_of_week:[ `fri | `mon | `sat | `sun | `thu | `tue | `wed ] ->
  unit ->
  Types.ZonedDateTime.t = "endOfWeek"
[@@mel.module "@internationalized/date"]
(** Returns the last date of the week for the given date and locale. *)

external end_of_year : Types.ZonedDateTime.t -> Types.ZonedDateTime.t
  = "endOfYear"
[@@mel.module "@internationalized/date"]
(** Returns the last day of the year for the given date. *)

external from_absolute_js : float -> string -> Types.ZonedDateTime.t
  = "fromAbsolute"
[@@mel.module "@internationalized/date"]

let from_absolute x0 x1 =
  match from_absolute_js x0 x1 with
  | v -> v
  | exception Js.Exn.Error e ->
      invalid_arg
        ("from_absolute: " ^ Option.value (Js.Exn.message e) ~default:"")

let from_absolute_opt x0 x1 =
  match from_absolute_js x0 x1 with
  | v -> Some v
  | exception Js.Exn.Error _ -> None

external from_date_js : Js.Date.t -> string -> Types.ZonedDateTime.t
  = "fromDate"
[@@mel.module "@internationalized/date"]

let from_date x0 x1 =
  match from_date_js x0 x1 with
  | v -> v
  | exception Js.Exn.Error e ->
      invalid_arg ("from_date: " ^ Option.value (Js.Exn.message e) ~default:"")

let from_date_opt x0 x1 =
  match from_date_js x0 x1 with v -> Some v | exception Js.Exn.Error _ -> None

external from_date_to_local : Js.Date.t -> Types.ZonedDateTime.t
  = "fromDateToLocal"
[@@mel.module "@internationalized/date"]
(** Takes a `Date` object and converts it to the time zone identifier for the
    current user. *)

external get_day_of_week :
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  string ->
  ?first_day_of_week:[ `fri | `mon | `sat | `sun | `thu | `tue | `wed ] ->
  unit ->
  int = "getDayOfWeek"
[@@mel.module "@internationalized/date"]
(** Returns the day of week for the given date and locale. Days are numbered
    from zero to six, where zero is the first day of the week in the given
    locale. For example, in the United States, the first day of the week is
    Sunday, but in France it is Monday. *)

external get_hours_in_day_js : Types.CalendarDate.t -> string -> int
  = "getHoursInDay"
[@@mel.module "@internationalized/date"]

let get_hours_in_day x0 x1 =
  match get_hours_in_day_js x0 x1 with
  | v -> v
  | exception Js.Exn.Error e ->
      invalid_arg
        ("get_hours_in_day: " ^ Option.value (Js.Exn.message e) ~default:"")

let get_hours_in_day_opt x0 x1 =
  match get_hours_in_day_js x0 x1 with
  | v -> Some v
  | exception Js.Exn.Error _ -> None

external get_local_time_zone : unit -> string = "getLocalTimeZone"
[@@mel.module "@internationalized/date"]
(** Returns the time zone identifier for the current user. *)

external get_minimum_day_in_month :
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  int = "getMinimumDayInMonth"
[@@mel.module "@internationalized/date"]

external get_minimum_month_in_year :
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  int = "getMinimumMonthInYear"
[@@mel.module "@internationalized/date"]

external get_weeks_in_month :
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  string ->
  ?first_day_of_week:[ `fri | `mon | `sat | `sun | `thu | `tue | `wed ] ->
  unit ->
  int = "getWeeksInMonth"
[@@mel.module "@internationalized/date"]
(** Returns the number of weeks in the given month and locale. *)

external is_equal_calendar : Types.Calendar.t -> Types.Calendar.t -> bool
  = "isEqualCalendar"
[@@mel.module "@internationalized/date"]
(** Returns whether two calendars are the same. *)

external is_equal_day :
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  bool = "isEqualDay"
[@@mel.module "@internationalized/date"]
(** Returns whether the given dates occur on the same day, and are of the same
    calendar system. *)

external is_equal_month :
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  bool = "isEqualMonth"
[@@mel.module "@internationalized/date"]
(** Returns whether the given dates occur in the same month, and are of the same
    calendar system. *)

external is_equal_year :
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  bool = "isEqualYear"
[@@mel.module "@internationalized/date"]
(** Returns whether the given dates occur in the same year, and are of the same
    calendar system. *)

external is_same_day :
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  bool = "isSameDay"
[@@mel.module "@internationalized/date"]
(** Returns whether the given dates occur on the same day, regardless of the
    time or calendar system. *)

external is_same_month :
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  bool = "isSameMonth"
[@@mel.module "@internationalized/date"]
(** Returns whether the given dates occur in the same month, using the calendar
    system of the first date. *)

external is_same_year :
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  bool = "isSameYear"
[@@mel.module "@internationalized/date"]
(** Returns whether the given dates occur in the same year, using the calendar
    system of the first date. *)

external is_today_js :
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  string ->
  bool = "isToday"
[@@mel.module "@internationalized/date"]

let is_today x0 x1 =
  match is_today_js x0 x1 with
  | v -> v
  | exception Js.Exn.Error e ->
      invalid_arg ("is_today: " ^ Option.value (Js.Exn.message e) ~default:"")

let is_today_opt x0 x1 =
  match is_today_js x0 x1 with v -> Some v | exception Js.Exn.Error _ -> None

external is_weekday :
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  string ->
  bool = "isWeekday"
[@@mel.module "@internationalized/date"]
(** Returns whether the given date is on a weekday in the given locale. *)

external is_weekend :
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  string ->
  bool = "isWeekend"
[@@mel.module "@internationalized/date"]
(** Returns whether the given date is on a weekend in the given locale. *)

external max_date :
  ?a:'a -> ?b:'b -> unit -> ('a, 'b) Types.Either.t Js.Nullable.t = "maxDate"
[@@mel.module "@internationalized/date"]
(** Returns the greater of the two provider dates. *)

external min_date : 'a -> 'b -> ('a, 'b) Types.Either.t = "minDate"
[@@mel.module "@internationalized/date"]
(** Returns the lesser of the two provider dates. *)

external now_js : string -> Types.ZonedDateTime.t = "now"
[@@mel.module "@internationalized/date"]

let now x0 =
  match now_js x0 with
  | v -> v
  | exception Js.Exn.Error e ->
      invalid_arg ("now: " ^ Option.value (Js.Exn.message e) ~default:"")

let now_opt x0 =
  match now_js x0 with v -> Some v | exception Js.Exn.Error _ -> None

external parse_absolute_js : string -> string -> Types.ZonedDateTime.t
  = "parseAbsolute"
[@@mel.module "@internationalized/date"]

let parse_absolute x0 x1 =
  match parse_absolute_js x0 x1 with
  | v -> v
  | exception Js.Exn.Error e ->
      invalid_arg
        ("parse_absolute: " ^ Option.value (Js.Exn.message e) ~default:"")

let parse_absolute_opt x0 x1 =
  match parse_absolute_js x0 x1 with
  | v -> Some v
  | exception Js.Exn.Error _ -> None

external parse_absolute_to_local_js : string -> Types.ZonedDateTime.t
  = "parseAbsoluteToLocal"
[@@mel.module "@internationalized/date"]

let parse_absolute_to_local x0 =
  match parse_absolute_to_local_js x0 with
  | v -> v
  | exception Js.Exn.Error e ->
      invalid_arg
        ("parse_absolute_to_local: "
        ^ Option.value (Js.Exn.message e) ~default:"")

let parse_absolute_to_local_opt x0 =
  match parse_absolute_to_local_js x0 with
  | v -> Some v
  | exception Js.Exn.Error _ -> None

external parse_date_js : string -> Types.CalendarDate.t = "parseDate"
[@@mel.module "@internationalized/date"]

let parse_date x0 =
  match parse_date_js x0 with
  | v -> v
  | exception Js.Exn.Error e ->
      invalid_arg ("parse_date: " ^ Option.value (Js.Exn.message e) ~default:"")

let parse_date_opt x0 =
  match parse_date_js x0 with v -> Some v | exception Js.Exn.Error _ -> None

external parse_date_time_js : string -> Types.CalendarDateTime.t
  = "parseDateTime"
[@@mel.module "@internationalized/date"]

let parse_date_time x0 =
  match parse_date_time_js x0 with
  | v -> v
  | exception Js.Exn.Error e ->
      invalid_arg
        ("parse_date_time: " ^ Option.value (Js.Exn.message e) ~default:"")

let parse_date_time_opt x0 =
  match parse_date_time_js x0 with
  | v -> Some v
  | exception Js.Exn.Error _ -> None

external parse_duration_js : string -> Types.RequiredDateTimeDuration.t
  = "parseDuration"
[@@mel.module "@internationalized/date"]

let parse_duration x0 =
  match parse_duration_js x0 with
  | v -> v
  | exception Js.Exn.Error e ->
      invalid_arg
        ("parse_duration: " ^ Option.value (Js.Exn.message e) ~default:"")

let parse_duration_opt x0 =
  match parse_duration_js x0 with
  | v -> Some v
  | exception Js.Exn.Error _ -> None

external parse_time_js : string -> Types.Time.t = "parseTime"
[@@mel.module "@internationalized/date"]

let parse_time x0 =
  match parse_time_js x0 with
  | v -> v
  | exception Js.Exn.Error e ->
      invalid_arg ("parse_time: " ^ Option.value (Js.Exn.message e) ~default:"")

let parse_time_opt x0 =
  match parse_time_js x0 with v -> Some v | exception Js.Exn.Error _ -> None

external parse_zoned_date_time_js :
  string ->
  ?disambiguation:[ `compatible | `earlier | `later | `reject ] ->
  unit ->
  Types.ZonedDateTime.t = "parseZonedDateTime"
[@@mel.module "@internationalized/date"]

let parse_zoned_date_time x0 ?disambiguation () =
  match parse_zoned_date_time_js x0 ?disambiguation () with
  | v -> v
  | exception Js.Exn.Error e ->
      invalid_arg
        ("parse_zoned_date_time: " ^ Option.value (Js.Exn.message e) ~default:"")

let parse_zoned_date_time_opt x0 ?disambiguation () =
  match parse_zoned_date_time_js x0 ?disambiguation () with
  | v -> Some v
  | exception Js.Exn.Error _ -> None

external reset_local_time_zone : unit -> unit = "resetLocalTimeZone"
[@@mel.module "@internationalized/date"]
(** Resets the time zone identifier for the current user. *)

external set_local_time_zone_js : string -> unit = "setLocalTimeZone"
[@@mel.module "@internationalized/date"]

let set_local_time_zone x0 =
  match set_local_time_zone_js x0 with
  | v -> v
  | exception Js.Exn.Error e ->
      invalid_arg
        ("set_local_time_zone: " ^ Option.value (Js.Exn.message e) ~default:"")

let set_local_time_zone_opt x0 =
  match set_local_time_zone_js x0 with
  | v -> Some v
  | exception Js.Exn.Error _ -> None

external start_of_month : Types.ZonedDateTime.t -> Types.ZonedDateTime.t
  = "startOfMonth"
[@@mel.module "@internationalized/date"]
(** Returns the first date of the month for the given date. *)

external start_of_week :
  Types.ZonedDateTime.t ->
  string ->
  ?first_day_of_week:[ `fri | `mon | `sat | `sun | `thu | `tue | `wed ] ->
  unit ->
  Types.ZonedDateTime.t = "startOfWeek"
[@@mel.module "@internationalized/date"]
(** Returns the first date of the week for the given date and locale. *)

external start_of_year : Types.ZonedDateTime.t -> Types.ZonedDateTime.t
  = "startOfYear"
[@@mel.module "@internationalized/date"]
(** Returns the first day of the year for the given date. *)

external to_calendar : 't -> Types.Calendar.t -> 't = "toCalendar"
[@@mel.module "@internationalized/date"]
(** Converts a date from one calendar system to another. *)

external to_calendar_date :
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  Types.CalendarDate.t = "toCalendarDate"
[@@mel.module "@internationalized/date"]
(** Converts a value with date components such as a `CalendarDateTime` or
    `ZonedDateTime` into a `CalendarDate`. *)

external to_calendar_date_time :
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  ?time:[< `calendar_date_time | `time | `zoned_date_time ] Types.Value.t ->
  unit ->
  Types.CalendarDateTime.t = "toCalendarDateTime"
[@@mel.module "@internationalized/date"]
(** Converts a date value to a `CalendarDateTime`. An optional `Time` value can
    be passed to set the time of the resulting value, otherwise it will default
    to midnight. *)

external to_local_time_zone : Types.ZonedDateTime.t -> Types.ZonedDateTime.t
  = "toLocalTimeZone"
[@@mel.module "@internationalized/date"]
(** Converts the given `ZonedDateTime` into the user's local time zone. *)

external to_time :
  [< `calendar_date_time | `zoned_date_time ] Types.Value.t -> Types.Time.t
  = "toTime"
[@@mel.module "@internationalized/date"]
(** Extracts the time components from a value containing a date and time. *)

external to_time_zone_js :
  Types.ZonedDateTime.t -> string -> Types.ZonedDateTime.t = "toTimeZone"
[@@mel.module "@internationalized/date"]

let to_time_zone x0 x1 =
  match to_time_zone_js x0 x1 with
  | v -> v
  | exception Js.Exn.Error e ->
      invalid_arg
        ("to_time_zone: " ^ Option.value (Js.Exn.message e) ~default:"")

let to_time_zone_opt x0 x1 =
  match to_time_zone_js x0 x1 with
  | v -> Some v
  | exception Js.Exn.Error _ -> None

external to_zoned_js :
  [< `calendar_date | `calendar_date_time | `zoned_date_time ] Types.Value.t ->
  string ->
  ?disambiguation:[ `compatible | `earlier | `later | `reject ] ->
  unit ->
  Types.ZonedDateTime.t = "toZoned"
[@@mel.module "@internationalized/date"]

let to_zoned x0 x1 ?disambiguation () =
  match to_zoned_js x0 x1 ?disambiguation () with
  | v -> v
  | exception Js.Exn.Error e ->
      invalid_arg ("to_zoned: " ^ Option.value (Js.Exn.message e) ~default:"")

let to_zoned_opt x0 x1 ?disambiguation () =
  match to_zoned_js x0 x1 ?disambiguation () with
  | v -> Some v
  | exception Js.Exn.Error _ -> None

external today_js : string -> Types.CalendarDate.t = "today"
[@@mel.module "@internationalized/date"]

let today x0 =
  match today_js x0 with
  | v -> v
  | exception Js.Exn.Error e ->
      invalid_arg ("today: " ^ Option.value (Js.Exn.message e) ~default:"")

let today_opt x0 =
  match today_js x0 with v -> Some v | exception Js.Exn.Error _ -> None
