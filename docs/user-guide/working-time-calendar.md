# Working Time Calendar

*As of v7.3.*

Features:

* Week schedule (weekdays can have different schedule);
* Working day ranges (e.g. working weekends, days with a non-standard schedule);
* Non-working day ranges (leaves, holidays, etc.).

Admin users and regular users that have access to the Working Time Calendar scope (via Roles) can manage working time calendars.

Working Time Calendars can be accessed from:

* Calendar page > top-right dropdown menu > Working Time Calendars;
* Administration > Working Time Calendars (in the Data panel).

A working Time Calendar record can be:

* Selected as a system default (Administration > System > Working Time Calendar);
* Selected for a team (will be applied to user through the *default team*);
* Selected for a specific user.

A Working Time Calendar record defines:

* Time zone;
* Workday schedule (working time ranges);
* Week schedule (what weekdays are working, every weekday can have a different schedule).

A Working Time Range record applies custom working time for a specific day range for specific users or for a whole calendar. It can define non-working days or working days with a custom time schedule.

Examples:

* Holidays for a whole team. Create a range record related to the working time calendar with the type *Non-working*.
* A leave for a specific user (employee). Create a range record related to the user (through the *Users* field) with the type *Non-working*.
* A working Saturday. Create a one-day range with the type *Working*.
* A working day with a shortened time schedule. Create a one-day range with the type *Working*, with a custom *Schedule*.

Non-working days having a different background color:

![Calendar](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/working-time-calendar/1.png)

Non-working timeslots:

![Calendar agenda](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/working-time-calendar/2.png)

Timeline has non-working ranges with a different background color:

![Timeline](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/working-time-calendar/3.png)

## Formula functions

* `ext\workingTime\addWorkingDays(DATE, DAYS)` – adds working days, the result will be a date-time pointing at the beginning of the day  (`00:00`) in a corresponding time zone;
* `ext\workingTime\findClosestWorkingTime(DATE)` – finds the beginning of the next closest working time slot;
* `ext\workingTime\getSummedWorkingHours(FROM, TO)` – get a total number of working hours between two dates;
* `ext\workingTime\getWorkingDays(FROM, TO)` – get a number of working days between two dates;
* `ext\workingTime\hasWorkingTime(FROM, TO)` – whether a date range contains any working time;
* `ext\workingTime\isWorkingDay(DATE_OR_DATETIME)` – whether a date falls into a working day.

Functions can be applied for the default calendar, user calendar or team calendar. The entity type ( `'User'` or `'Team'`) and the entity ID can be passed as last two arguments.
