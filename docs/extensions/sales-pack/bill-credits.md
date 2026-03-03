# Bill Credits

*As of Sales Pack v4.0.*

Bill credits are reversal transactions for bills – the same as credit notes to invoices.

Access to Bill Credits is controlled by Roles.

A bill credit can be created from a bill.

A bill credit can be allocated to a bill or multiple bills. Inbound payments can be allocated to a bill credit.

A bill credit should be used to cancel an issued bill if the issuance locking in enabled in the system. Bill credits can be used to reduce the payable outstanding amount.

## Automatic numbering

The prefix of the next number, the next number itself and the quantity of digits in the number can be configured at Administration > Entity Manager > Bill Credit > Fields > numberA.

## Locking

A Bill Credit can be locked if it's resolved or canceled. When a record is locked, a specific fields become read-only. An administrator can configure the field list at: Administration > Entity Manager > Bill Credit > Edit.

If the settings parameter *Forbid order unlocking* is checked, once a record is locked, it can be unlocked only by an administrator.
