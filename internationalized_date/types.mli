(* The values @internationalized/date makes and takes, each a module: a
   CalendarDate, a CalendarDateTime, a Time and a ZonedDateTime are each a
   kind of Value, so a function that takes several takes any of them as it
   is. Generated from the declarations of @internationalized/date 3.12.4
   by generate/internationalized_date.ts; never edited by hand. *)

(* Members of different JavaScript kinds, each as it is. *)
type ('a, 'b) either
type 'k t_value
type t_resolved_date_time_format_options
type t_date_formatter
type t_calendar
type t_zoned_date_time = [ `zoned_date_time ] t_value
type t_calendar_date = [ `calendar_date ] t_value
type t_calendar_date_time = [ `calendar_date_time ] t_value
type t_required_date_time_duration
type t_time = [ `time ] t_value
type t_date_time_format_part
type t_date_range_format_part
type t_date_time_format_options
type t_date_time_duration
type t_zoned_date_time_set
type t_cycle_time_options
type t_date_duration
type t_date_fields
type t_cycle_options
type t_time_duration
type t_time_fields

module Either : sig
  type ('a, 'b) t = ('a, 'b) either

  external left : 'a -> ('a, 'b) t = "%identity"
  external right : 'b -> ('a, 'b) t = "%identity"
end

(* A value of one of CalendarDate, CalendarDateTime, Time, ZonedDateTime, its kind
   the class it is of: what a union of them, or an interface they
   satisfy, takes, as the kinds it names. *)
module Value : sig
  type 'k t = 'k t_value
end

(* The standard library's ResolvedDateTimeFormatOptions, opaque. *)
module ResolvedDateTimeFormatOptions : sig
  type t = t_resolved_date_time_format_options
end

(** A wrapper around Intl.DateTimeFormat that fixes various browser bugs, and polyfills new features. *)
module DateFormatter : sig
  type t = t_date_formatter
  external format : t -> Js.Date.t -> string = "format" [@@mel.send]
  external format_to_parts : t -> Js.Date.t -> t_date_time_format_part array = "formatToParts" [@@mel.send]
  external format_range : t -> Js.Date.t -> Js.Date.t -> string = "formatRange" [@@mel.send]
  external format_range_to_parts : t -> Js.Date.t -> Js.Date.t -> t_date_range_format_part array = "formatRangeToParts" [@@mel.send]
  external resolved_options : t -> unit -> t_resolved_date_time_format_options = "resolvedOptions" [@@mel.send]
  external make : string -> ?options:t_date_time_format_options -> unit -> t = "DateFormatter" [@@mel.new] [@@mel.module "@internationalized/date"]
end

(** The Calendar interface represents a calendar system, including information
    about how days, months, years, and eras are organized, and methods to perform
    arithmetic on dates. *)
module Calendar : sig
  type t = t_calendar
  (** A string identifier for the calendar, as defined by Unicode CLDR. See
      \[MDN\](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types). *)
  external identifier : t -> string = "identifier" [@@mel.get]
  external from_julian_day : t -> int -> t_calendar_date = "fromJulianDay" [@@mel.send]
  external to_julian_day : t -> [< `calendar_date | `calendar_date_time | `zoned_date_time ] t_value -> int = "toJulianDay" [@@mel.send]
  external get_days_in_month : t -> [< `calendar_date | `calendar_date_time | `zoned_date_time ] t_value -> int = "getDaysInMonth" [@@mel.send]
  external get_months_in_year : t -> [< `calendar_date | `calendar_date_time | `zoned_date_time ] t_value -> int = "getMonthsInYear" [@@mel.send]
  external get_years_in_era : t -> [< `calendar_date | `calendar_date_time | `zoned_date_time ] t_value -> int = "getYearsInEra" [@@mel.send]
  external get_eras : t -> unit -> string array = "getEras" [@@mel.send]
  external get_maximum_months_in_year : t -> unit -> int = "getMaximumMonthsInYear" [@@mel.send]
  external get_maximum_days_in_month : t -> unit -> int = "getMaximumDaysInMonth" [@@mel.send]
end

(** A ZonedDateTime represents a date and time in a specific time zone and calendar system. *)
module ZonedDateTime : sig
  type t = t_zoned_date_time
  (** The calendar system associated with this date, e.g. Gregorian. *)
  external calendar : t -> t_calendar = "calendar" [@@mel.get]
  (** The calendar era for this date, e.g. "BC" or "AD". *)
  external era : t -> string = "era" [@@mel.get]
  (** The year of this date within the era. *)
  external year : t -> int = "year" [@@mel.get]
  (** The month number within the year. Note that some calendar systems such as Hebrew
      may have a variable number of months per year. Therefore, month numbers may not
      always correspond to the same month names in different years. *)
  external month : t -> int = "month" [@@mel.get]
  (** The day number within the month. *)
  external day : t -> int = "day" [@@mel.get]
  (** The hour in the day, numbered from 0 to 23. *)
  external hour : t -> int = "hour" [@@mel.get]
  (** The minute in the hour. *)
  external minute : t -> int = "minute" [@@mel.get]
  (** The second in the minute. *)
  external second : t -> int = "second" [@@mel.get]
  (** The millisecond in the second. *)
  external millisecond : t -> int = "millisecond" [@@mel.get]
  (** The IANA time zone identifier that this date and time is represented in. *)
  external time_zone : t -> string = "timeZone" [@@mel.get]
  (** The UTC offset for this time, in milliseconds. *)
  external offset : t -> int = "offset" [@@mel.get]
  external copy : t -> unit -> t_zoned_date_time = "copy" [@@mel.send]
  external add : t -> t_date_time_duration -> t_zoned_date_time = "add" [@@mel.send]
  external subtract : t -> t_date_time_duration -> t_zoned_date_time = "subtract" [@@mel.send]
  (** Returns a new `ZonedDateTime` with the given fields set to the provided values. Other fields
      will be constrained accordingly.
      
      Raises [Invalid_argument] with \@internationalized/date's message, where it throws. *)
  val set : t -> t_zoned_date_time_set -> ?disambiguation:[ `compatible | `earlier | `later | `reject ] -> unit -> t_zoned_date_time
  val set_opt : t -> t_zoned_date_time_set -> ?disambiguation:[ `compatible | `earlier | `later | `reject ] -> unit -> t_zoned_date_time option
  external cycle : t -> [ `era | `year | `month | `day | `hour | `minute | `second | `millisecond ] -> int -> ?options:t_cycle_time_options -> unit -> t_zoned_date_time = "cycle" [@@mel.send]
  external to_date : t -> unit -> Js.Date.t = "toDate" [@@mel.send]
  external to_string : t -> unit -> string = "toString" [@@mel.send]
  external to_absolute_string : t -> unit -> string = "toAbsoluteString" [@@mel.send]
  external compare : t -> [< `calendar_date | `calendar_date_time | `zoned_date_time ] t_value -> float = "compare" [@@mel.send]
  external make : int -> int -> int -> string -> int -> ?hour:int -> ?minute:int -> ?second:int -> ?millisecond:int -> unit -> t = "ZonedDateTime" [@@mel.new] [@@mel.module "@internationalized/date"]
end

(** A CalendarDate represents a date without any time components in a specific calendar system. *)
module CalendarDate : sig
  type t = t_calendar_date
  (** The calendar system associated with this date, e.g. Gregorian. *)
  external calendar : t -> t_calendar = "calendar" [@@mel.get]
  (** The calendar era for this date, e.g. "BC" or "AD". *)
  external era : t -> string = "era" [@@mel.get]
  (** The year of this date within the era. *)
  external year : t -> int = "year" [@@mel.get]
  (** The month number within the year. Note that some calendar systems such as Hebrew
      may have a variable number of months per year. Therefore, month numbers may not
      always correspond to the same month names in different years. *)
  external month : t -> int = "month" [@@mel.get]
  (** The day number within the month. *)
  external day : t -> int = "day" [@@mel.get]
  external copy : t -> unit -> t_calendar_date = "copy" [@@mel.send]
  external add : t -> t_date_duration -> t_calendar_date = "add" [@@mel.send]
  external subtract : t -> t_date_duration -> t_calendar_date = "subtract" [@@mel.send]
  external set : t -> t_date_fields -> t_calendar_date = "set" [@@mel.send]
  external cycle : t -> [ `era | `year | `month | `day ] -> int -> ?options:t_cycle_options -> unit -> t_calendar_date = "cycle" [@@mel.send]
  (** Converts the date to a native JavaScript Date object, with the time set to midnight in the
      given time zone.
      
      Raises [Invalid_argument] with \@internationalized/date's message, where it throws. *)
  val to_date : t -> string -> Js.Date.t
  val to_date_opt : t -> string -> Js.Date.t option
  external to_string : t -> unit -> string = "toString" [@@mel.send]
  external compare : t -> [< `calendar_date | `calendar_date_time | `zoned_date_time ] t_value -> float = "compare" [@@mel.send]
  external make : int -> int -> int -> t = "CalendarDate" [@@mel.new] [@@mel.module "@internationalized/date"]
end

(** A CalendarDateTime represents a date and time without a time zone, in a specific calendar system. *)
module CalendarDateTime : sig
  type t = t_calendar_date_time
  (** The calendar system associated with this date, e.g. Gregorian. *)
  external calendar : t -> t_calendar = "calendar" [@@mel.get]
  (** The calendar era for this date, e.g. "BC" or "AD". *)
  external era : t -> string = "era" [@@mel.get]
  (** The year of this date within the era. *)
  external year : t -> int = "year" [@@mel.get]
  (** The month number within the year. Note that some calendar systems such as Hebrew
      may have a variable number of months per year. Therefore, month numbers may not
      always correspond to the same month names in different years. *)
  external month : t -> int = "month" [@@mel.get]
  (** The day number within the month. *)
  external day : t -> int = "day" [@@mel.get]
  (** The hour in the day, numbered from 0 to 23. *)
  external hour : t -> int = "hour" [@@mel.get]
  (** The minute in the hour. *)
  external minute : t -> int = "minute" [@@mel.get]
  (** The second in the minute. *)
  external second : t -> int = "second" [@@mel.get]
  (** The millisecond in the second. *)
  external millisecond : t -> int = "millisecond" [@@mel.get]
  external copy : t -> unit -> t_calendar_date_time = "copy" [@@mel.send]
  external add : t -> t_date_time_duration -> t_calendar_date_time = "add" [@@mel.send]
  external subtract : t -> t_date_time_duration -> t_calendar_date_time = "subtract" [@@mel.send]
  external set : t -> t_zoned_date_time_set -> t_calendar_date_time = "set" [@@mel.send]
  external cycle : t -> [ `era | `year | `month | `day | `hour | `minute | `second | `millisecond ] -> int -> ?options:t_cycle_time_options -> unit -> t_calendar_date_time = "cycle" [@@mel.send]
  (** Converts the date to a native JavaScript Date object in the given time zone.
      
      Raises [Invalid_argument] with \@internationalized/date's message, where it throws. *)
  val to_date : t -> string -> ?disambiguation:[ `compatible | `earlier | `later | `reject ] -> unit -> Js.Date.t
  val to_date_opt : t -> string -> ?disambiguation:[ `compatible | `earlier | `later | `reject ] -> unit -> Js.Date.t option
  external to_string : t -> unit -> string = "toString" [@@mel.send]
  external compare : t -> [< `calendar_date | `calendar_date_time | `zoned_date_time ] t_value -> float = "compare" [@@mel.send]
  external make : int -> int -> int -> ?hour:int -> ?minute:int -> ?second:int -> ?millisecond:int -> unit -> t = "CalendarDateTime" [@@mel.new] [@@mel.module "@internationalized/date"]
end

module RequiredDateTimeDuration : sig
  type t = t_required_date_time_duration
  (** The number of years to add or subtract. *)
  external years : t -> int = "years" [@@mel.get]
  (** The number of months to add or subtract. *)
  external months : t -> int = "months" [@@mel.get]
  (** The number of weeks to add or subtract. *)
  external weeks : t -> int = "weeks" [@@mel.get]
  (** The number of days to add or subtract. *)
  external days : t -> int = "days" [@@mel.get]
  (** The number of hours to add or subtract. *)
  external hours : t -> int = "hours" [@@mel.get]
  (** The number of minutes to add or subtract. *)
  external minutes : t -> int = "minutes" [@@mel.get]
  (** The number of seconds to add or subtract. *)
  external seconds : t -> int = "seconds" [@@mel.get]
  (** The number of milliseconds to add or subtract. *)
  external milliseconds : t -> int = "milliseconds" [@@mel.get]
  external make : years:(int [@mel.as "years"]) -> months:(int [@mel.as "months"]) -> weeks:(int [@mel.as "weeks"]) -> days:(int [@mel.as "days"]) -> hours:(int [@mel.as "hours"]) -> minutes:(int [@mel.as "minutes"]) -> seconds:(int [@mel.as "seconds"]) -> milliseconds:(int [@mel.as "milliseconds"]) -> unit -> t = "" [@@mel.obj]
end

(** A Time represents a clock time without any date components. *)
module Time : sig
  type t = t_time
  (** The hour, numbered from 0 to 23. *)
  external hour : t -> int = "hour" [@@mel.get]
  (** The minute in the hour. *)
  external minute : t -> int = "minute" [@@mel.get]
  (** The second in the minute. *)
  external second : t -> int = "second" [@@mel.get]
  (** The millisecond in the second. *)
  external millisecond : t -> int = "millisecond" [@@mel.get]
  external copy : t -> unit -> t_time = "copy" [@@mel.send]
  external add : t -> t_time_duration -> t_time = "add" [@@mel.send]
  external subtract : t -> t_time_duration -> t_time = "subtract" [@@mel.send]
  external set : t -> t_time_fields -> t_time = "set" [@@mel.send]
  external cycle : t -> [ `hour | `minute | `second | `millisecond ] -> int -> ?options:t_cycle_time_options -> unit -> t_time = "cycle" [@@mel.send]
  external to_string : t -> unit -> string = "toString" [@@mel.send]
  external compare : t -> [< `calendar_date_time | `time | `zoned_date_time ] t_value -> float = "compare" [@@mel.send]
  external make : ?hour:int -> ?minute:int -> ?second:int -> ?millisecond:int -> unit -> t = "Time" [@@mel.new] [@@mel.module "@internationalized/date"]
end

module DateTimeFormatPart : sig
  type t = t_date_time_format_part
  external type_ : t -> [ `era | `year | `month | `day | `hour | `minute | `second | `dayPeriod | `literal | `timeZoneName | `weekday | `unknown | `fractionalSecond ] = "type" [@@mel.get]
  external value : t -> string = "value" [@@mel.get]
  external make : type_:([ `era | `year | `month | `day | `hour | `minute | `second | `dayPeriod | `literal | `timeZoneName | `weekday | `unknown | `fractionalSecond ] [@mel.as "type"]) -> value:(string [@mel.as "value"]) -> unit -> t = "" [@@mel.obj]
end

module DateRangeFormatPart : sig
  type t = t_date_range_format_part
  external source : t -> [ `startRange | `endRange | `shared ] = "source" [@@mel.get]
  external type_ : t -> [ `era | `year | `month | `day | `hour | `minute | `second | `dayPeriod | `literal | `timeZoneName | `weekday | `unknown | `fractionalSecond ] = "type" [@@mel.get]
  external value : t -> string = "value" [@@mel.get]
  external make : source:([ `startRange | `endRange | `shared ] [@mel.as "source"]) -> type_:([ `era | `year | `month | `day | `hour | `minute | `second | `dayPeriod | `literal | `timeZoneName | `weekday | `unknown | `fractionalSecond ] [@mel.as "type"]) -> value:(string [@mel.as "value"]) -> unit -> t = "" [@@mel.obj]
end

module DateTimeFormatOptions : sig
  type t = t_date_time_format_options
  external locale_matcher : t -> string option = "localeMatcher" [@@mel.get]
  external weekday : t -> [ `long | `short | `narrow ] option = "weekday" [@@mel.get]
  external era : t -> [ `long | `short | `narrow ] option = "era" [@@mel.get]
  external year : t -> string option = "year" [@@mel.get]
  external month : t -> string option = "month" [@@mel.get]
  external day : t -> string option = "day" [@@mel.get]
  external hour : t -> string option = "hour" [@@mel.get]
  external minute : t -> string option = "minute" [@@mel.get]
  external second : t -> string option = "second" [@@mel.get]
  external time_zone_name : t -> [ `long | `short | `shortOffset | `longOffset | `shortGeneric | `longGeneric ] option = "timeZoneName" [@@mel.get]
  external format_matcher : t -> string option = "formatMatcher" [@@mel.get]
  external hour12 : t -> bool option = "hour12" [@@mel.get]
  external time_zone : t -> string option = "timeZone" [@@mel.get]
  external calendar : t -> string option = "calendar" [@@mel.get]
  external day_period : t -> [ `long | `short | `narrow ] option = "dayPeriod" [@@mel.get]
  external numbering_system : t -> string option = "numberingSystem" [@@mel.get]
  external date_style : t -> [ `long | `short | `full | `medium ] option = "dateStyle" [@@mel.get]
  external time_style : t -> [ `long | `short | `full | `medium ] option = "timeStyle" [@@mel.get]
  external hour_cycle : t -> [ `h11 | `h12 | `h23 | `h24 ] option = "hourCycle" [@@mel.get]
  external fractional_second_digits : t -> int option = "fractionalSecondDigits" [@@mel.get]
  external make : ?locale_matcher:(string [@mel.as "localeMatcher"]) -> ?weekday:([ `long | `short | `narrow ] [@mel.as "weekday"]) -> ?era:([ `long | `short | `narrow ] [@mel.as "era"]) -> ?year:(string [@mel.as "year"]) -> ?month:(string [@mel.as "month"]) -> ?day:(string [@mel.as "day"]) -> ?hour:(string [@mel.as "hour"]) -> ?minute:(string [@mel.as "minute"]) -> ?second:(string [@mel.as "second"]) -> ?time_zone_name:([ `long | `short | `shortOffset | `longOffset | `shortGeneric | `longGeneric ] [@mel.as "timeZoneName"]) -> ?format_matcher:(string [@mel.as "formatMatcher"]) -> ?hour12:(bool [@mel.as "hour12"]) -> ?time_zone:(string [@mel.as "timeZone"]) -> ?calendar:(string [@mel.as "calendar"]) -> ?day_period:([ `long | `short | `narrow ] [@mel.as "dayPeriod"]) -> ?numbering_system:(string [@mel.as "numberingSystem"]) -> ?date_style:([ `long | `short | `full | `medium ] [@mel.as "dateStyle"]) -> ?time_style:([ `long | `short | `full | `medium ] [@mel.as "timeStyle"]) -> ?hour_cycle:([ `h11 | `h12 | `h23 | `h24 ] [@mel.as "hourCycle"]) -> ?fractional_second_digits:(int [@mel.as "fractionalSecondDigits"]) -> unit -> t = "" [@@mel.obj]
end

(** Represents an amount of time with both date and time components, for use when performing
    arithmetic. *)
module DateTimeDuration : sig
  type t = t_date_time_duration
  (** The number of years to add or subtract. *)
  external years : t -> int option = "years" [@@mel.get]
  (** The number of months to add or subtract. *)
  external months : t -> int option = "months" [@@mel.get]
  (** The number of weeks to add or subtract. *)
  external weeks : t -> int option = "weeks" [@@mel.get]
  (** The number of days to add or subtract. *)
  external days : t -> int option = "days" [@@mel.get]
  (** The number of hours to add or subtract. *)
  external hours : t -> int option = "hours" [@@mel.get]
  (** The number of minutes to add or subtract. *)
  external minutes : t -> int option = "minutes" [@@mel.get]
  (** The number of seconds to add or subtract. *)
  external seconds : t -> int option = "seconds" [@@mel.get]
  (** The number of milliseconds to add or subtract. *)
  external milliseconds : t -> int option = "milliseconds" [@@mel.get]
  external make : ?years:(int [@mel.as "years"]) -> ?months:(int [@mel.as "months"]) -> ?weeks:(int [@mel.as "weeks"]) -> ?days:(int [@mel.as "days"]) -> ?hours:(int [@mel.as "hours"]) -> ?minutes:(int [@mel.as "minutes"]) -> ?seconds:(int [@mel.as "seconds"]) -> ?milliseconds:(int [@mel.as "milliseconds"]) -> unit -> t = "" [@@mel.obj]
end

module ZonedDateTime_Set : sig
  type t = t_zoned_date_time_set
  external era : t -> string option = "era" [@@mel.get]
  external year : t -> int option = "year" [@@mel.get]
  external month : t -> int option = "month" [@@mel.get]
  external day : t -> int option = "day" [@@mel.get]
  external hour : t -> int option = "hour" [@@mel.get]
  external minute : t -> int option = "minute" [@@mel.get]
  external second : t -> int option = "second" [@@mel.get]
  external millisecond : t -> int option = "millisecond" [@@mel.get]
  external make : ?era:(string [@mel.as "era"]) -> ?year:(int [@mel.as "year"]) -> ?month:(int [@mel.as "month"]) -> ?day:(int [@mel.as "day"]) -> ?hour:(int [@mel.as "hour"]) -> ?minute:(int [@mel.as "minute"]) -> ?second:(int [@mel.as "second"]) -> ?millisecond:(int [@mel.as "millisecond"]) -> unit -> t = "" [@@mel.obj]
end

module CycleTimeOptions : sig
  type t = t_cycle_time_options
  (** Whether to use 12 or 24 hour time. If 12 hour time is chosen, the resulting value
      will remain in the same day period as the original value (e.g. if the value is AM,
      the resulting value also be AM). *)
  external hour_cycle : t -> int option = "hourCycle" [@@mel.get]
  (** Whether to round the field value to the nearest interval of the amount. *)
  external round : t -> bool option = "round" [@@mel.get]
  external make : ?hour_cycle:(int [@mel.as "hourCycle"]) -> ?round:(bool [@mel.as "round"]) -> unit -> t = "" [@@mel.obj]
end

(** Represents an amount of time in calendar-specific units, for use when performing arithmetic. *)
module DateDuration : sig
  type t = t_date_duration
  (** The number of years to add or subtract. *)
  external years : t -> int option = "years" [@@mel.get]
  (** The number of months to add or subtract. *)
  external months : t -> int option = "months" [@@mel.get]
  (** The number of weeks to add or subtract. *)
  external weeks : t -> int option = "weeks" [@@mel.get]
  (** The number of days to add or subtract. *)
  external days : t -> int option = "days" [@@mel.get]
  external make : ?years:(int [@mel.as "years"]) -> ?months:(int [@mel.as "months"]) -> ?weeks:(int [@mel.as "weeks"]) -> ?days:(int [@mel.as "days"]) -> unit -> t = "" [@@mel.obj]
end

module DateFields : sig
  type t = t_date_fields
  external era : t -> string option = "era" [@@mel.get]
  external year : t -> int option = "year" [@@mel.get]
  external month : t -> int option = "month" [@@mel.get]
  external day : t -> int option = "day" [@@mel.get]
  external make : ?era:(string [@mel.as "era"]) -> ?year:(int [@mel.as "year"]) -> ?month:(int [@mel.as "month"]) -> ?day:(int [@mel.as "day"]) -> unit -> t = "" [@@mel.obj]
end

module CycleOptions : sig
  type t = t_cycle_options
  (** Whether to round the field value to the nearest interval of the amount. *)
  external round : t -> bool option = "round" [@@mel.get]
  external make : ?round:(bool [@mel.as "round"]) -> unit -> t = "" [@@mel.obj]
end

(** Represents an amount of time, for use whe performing arithmetic. *)
module TimeDuration : sig
  type t = t_time_duration
  (** The number of hours to add or subtract. *)
  external hours : t -> int option = "hours" [@@mel.get]
  (** The number of minutes to add or subtract. *)
  external minutes : t -> int option = "minutes" [@@mel.get]
  (** The number of seconds to add or subtract. *)
  external seconds : t -> int option = "seconds" [@@mel.get]
  (** The number of milliseconds to add or subtract. *)
  external milliseconds : t -> int option = "milliseconds" [@@mel.get]
  external make : ?hours:(int [@mel.as "hours"]) -> ?minutes:(int [@mel.as "minutes"]) -> ?seconds:(int [@mel.as "seconds"]) -> ?milliseconds:(int [@mel.as "milliseconds"]) -> unit -> t = "" [@@mel.obj]
end

module TimeFields : sig
  type t = t_time_fields
  external hour : t -> int option = "hour" [@@mel.get]
  external minute : t -> int option = "minute" [@@mel.get]
  external second : t -> int option = "second" [@@mel.get]
  external millisecond : t -> int option = "millisecond" [@@mel.get]
  external make : ?hour:(int [@mel.as "hour"]) -> ?minute:(int [@mel.as "minute"]) -> ?second:(int [@mel.as "second"]) -> ?millisecond:(int [@mel.as "millisecond"]) -> unit -> t = "" [@@mel.obj]
end
