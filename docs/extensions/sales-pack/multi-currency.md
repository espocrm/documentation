# Multi-currency

*As of Sales Pack v4.0.*

Multi-currency is activated when you have more than one currency set in the *Currency List* settings parameter. Currencies are configured at: Administration > Currency. Here you can specify which currencies to have available in the system, as well as the base, and the default currency. Here, you can also set currency rates.

The base currency is the company's local currency. Tax, sales and purchase reports use the base currency.

The default currency is pre-selected by default when documents and transactions are created. It can be the same as the base currency.

## Transaction currency

Invoices, Credit Notes, Bills, Bill Credits, and Payments have the *Currency Rate* field.
Amounts (including tax amounts) are stored in both the document currency and the local currency.

Allocations, Tax Line Items, and Tax Total Items store amounts in both currencies as well.

For a document with different local and document currencies, you can view total amounts in the local currency by clicking *View in Local Currency* from the menu next to the Edit button.

The currency rate is set to the today's exchange rate. If you change the document date (Date Invoiced or Date Paid) to an earlier date, if the exchange rate for that day differs, the system will suggest to set that rate.

When a Credit Note is created from an Invoice, it inherits its currency rate. The same applies for Bill Credits.

## FX gain/loss

If the exchange rates used for an invoice and its payment differ, a foreign exchange gain or loss arises. You can view the FX gain/loss amount for a particular allocation: the Invoice detail view > Allocations panel > click View for an allocation.

The same applies for Bills and Bill Credits.
