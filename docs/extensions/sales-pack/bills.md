# Bills

*As of Sales Pack v4.0.*

Bills represent invoices from suppliers.

Access to Bills is controlled by Roles.

A bill can be created from a [purchase order](purchase-orders.md). To create a bill from a purchase order, in the purchase order detail view, click on the plus button in the Bills panels.

Outbound payments and [bill credits](bill-credits.md) can be allocated to a bill. To be able to set a bill as paid or cancel an issued bill, you need to zero the amount due by allocating payments or bill credits.

Bill credits can be created from a bill to fully or partially reverse it.

## Automatic numbering

The prefix of the next number, the next number itself and the quantity of digits in the number can be configured at Administration > Entity Manager > Bill > Fields > numberA.

## Locking

A Bill can be locked if it's completed or canceled. When a record is locked, a specific fields become read-only. An administrator can configure the field list at: Administration > Entity Manager > Bill > Edit.

If the settings parameter *Forbid order unlocking* is checked, once a record is locked, it can be unlocked only by an administrator.


