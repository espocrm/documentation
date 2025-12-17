# Working Time Calendar

*As of v7.3.*

The Working Time feature allows to define working and non-working days for users, teams, and the entire organization. It provides a weekly schedule with customizable hours per weekday, supports exceptions for special working days (such as weekends or days with adjusted hours), and allows marking holidays or leaves.

Features:

* Week schedule (weekdays can have different schedule);
* Working day exceptions (e.g. working weekends, days with a non-standard schedule);
* Non-working day exceptions (leaves, holidays, etc.).

Admin users and regular users who have access to the Working Time Calendar scope can manage Working Time Calendars.

Working Time Calendars can be accessed under:

* Calendar page > top-right dropdown menu > Working Time Calendars;
* Administration > Working Time Calendars (in the Data panel).

A working Time Calendar record can be:

* Selected as a system default (Administration > System > Working Time Calendar);
* Selected for a team – will apply to users who have that team set in the *Default Team*;
* Selected for a specific user.

A Working Time Calendar record defines:

* Time zone;
* Workday schedule (working time ranges);
* Week schedule (what weekdays are working, every weekday can have a different schedule).

A Working Time Exception record applies custom working time for a specific day range for specific users or for a whole calendar. It can define non-working days or working days with a custom time schedule.

!!! note

    In Exceptions, the Date End is inclusive.

Examples:

* Holidays for a whole team. Create an Exception record related to the Working Time Calendar with the type *Non-working*.
* A leave for a specific user (employee). Create an Exception record related to the User (through the *Users* field) with the type *Non-working*.
* A working Saturday. Create a one-day Exception with the type *Working*.
* A working day with a shortened time schedule. Create a one-day Exception with the type *Working*, with a custom *Schedule*.

Non-working days have a different background color on the Calendar:

![Calendar](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/working-time-calendar/1.png)

Non-working timeslots:

![Calendar agenda](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/working-time-calendar/2.png)

The Timeline displays non-working ranges with a different background color:

![Timeline](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/working-time-calendar/3.png)

## Formula functions

The following formula functions are available.

* `ext\workingTime\addWorkingDays(DATE, DAYS)` – adds working days, the result will be a date-time pointing at the beginning of the day  (`00:00`) in a corresponding time zone;
* `ext\workingTime\findClosestWorkingTime(DATE)` – finds the beginning of the next closest working time slot;
* `ext\workingTime\getSummedWorkingHours(FROM, TO)` – get a total number of working hours between two dates;
* `ext\workingTime\getWorkingDays(FROM, TO)` – get a number of working days between two dates;
* `ext\workingTime\hasWorkingTime(FROM, TO)` – whether a date range contains any working time;
* `ext\workingTime\isWorkingDay(DATE_OR_DATETIME)` – whether a date falls into a working day.

Functions can be applied for the default calendar, user calendar, or team calendar. An entity type ( `'User'` or `'Team'`) and an entity ID can be passed to all workingTime functions as the last two arguments. For example, `ext\workingTime\isWorkingDay(dateStart', 'User', assignedUserId)`.
