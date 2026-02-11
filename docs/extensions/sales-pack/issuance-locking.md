# Issuance locking

*As of Sales Pack v4.0.*

The issuance locking mode enforces stricter rules on transaction behavior. You may need to have it enabled for a compliance purpose, or if you want to Espo as a billing software. Without locking enabled, balance reports cannot guarantee correct results.

!!! note

    Not to be confused with the record locking.

The issuance locking can be enabled at Administration > Sales Pack Settings.

Issuance locking affects the following document transactions:

- Invoice
- Credit Note
- Bill
- Bill Credit

And the following settlement transactions:

- Payment
- Write-off

Transaction issuance implies changing status from Draft to any other status except Canceled. Upon issuance, the boolean field *Issued* becomes true.

Issued document transactions affect the balance regardless of their status. Issued settlement transactions (payments and write-offs) affect the balance unless their status is canceled.

With the issuance locking mode enabled, an issued transaction:

- Cannot be unissued or removed.
- Has certain fields locked for editing.
- Cannot be completed if not cleared.
- Cannot be canceled if not cleared (except for Payment and Write-off).

For document transactions, clearance implies that the Amount Due is zeroed. For settlement transactions, clearance implies that the Unallocated Amount is zeroed.

If a transaction was issued by a mistake, it's not possible to just remove it. To cancel a document transaction, you need to negate it with an opposite transaction first.

How transactions can be negated for cancellation:

- Invoice can be negated with Credit Notes.
- Credit Note can be negated by allocating it to an Invoice (often, it should be a Debit Note).
- Bill can be negated with a Bill Credit.
- Bill Credit can be negated by allocating it to a Bill.
- Payment and Write-off can be canceled if they don't have allocations. If there are allocations, you need to remove them first.

As issued transactions are not fully protected from editing, it's reasonable to use the regular locking once the transaction is completed. The system will automatically lock the record once it is completed.

## System-level parameter

To disallow admin users to disable the issuance locking, set `salesForceIssuanceLocking` to true in the config file. Doing so may be necessary for a compliance purpose.

