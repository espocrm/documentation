# Sales and Purchase Reports

*As of Sales Pack v4.0.*

!!! warning

    The Sales Pack reports are integrated with the Reports feature of the Advanced Pack. You need the Advanced Pack extension installed to be able to use the reports.
  
To create a report, follow: Reports tab > top-right menu > Create Internal Report. Select the needed report, after that you can to tweak the report's parameters and run preview. After the report is saved, it will be available in the system as a regular report record. You can assign the report to a specific team for access control purposes.

All reports use the base currency (which is the company's local currency). If you change the base currency in the system, the report will not show the result for previous transactions (which use the previous local currency).

## Customer balances

Displays opening balance, debits, credits, and closing balance for each customer. The Date and Accounts filters are available. By clicking a customer, you can view Invoices, Credit Notes, Payments, and Allocations that affect the balance for the selected date range.

You can configure the report to include customers with a zero balance or not.

## Customer aging

The report shows outstanding customer balances grouped by how long they have been overdue. The following date brackets are used: Current, 1-30 days, 31-60 days, 61-90 days, and 91+ days.

The basis for the report be set to one of the following values:

- Date Due
- Installment Date Due
- Date Invoiced

You click on a customer and on a date bracket to view the invoices that affect the balance for a particular row or column.

## Supplier balances

Displays opening balance, debits, credits, and closing balance for each supplier. The Date and Accounts filters are available. By clicking a supplier, you can view Bills, Bill Credits, Payments, and Allocations that affect the balance for the selected date range.

You can configure the report to include supplier with a zero balance or not.

## Sales tax summary

Displays a summary of taxes related to invoices and credit notes. The report can be used for VAT and sales tax report preparation.

In the report parameters, you need to select tax codes and the basis: Accrual or Cash. The report will show summary for each tax codes: the Base and the Tax amount.

## Purchase tax summary

Displays a summary of taxes related to bills and bill credits. The report can be used for VAT and sales tax report preparation.

In the report parameters, you need to select tax codes and the basis: Accrual or Cash. The report will show summary for each tax codes: the Base and the Tax amount. 

In the result table, clicking a tax code displays the tax items that contribute to the result.

## Sales list by tax code

This report can be used for EU Sales List report preparation.

The report displays the following columns:

- Account – a customer
- Tax Code
- Country – stored in the tax code record
- Tax Number – VAT number, stored in the account record
- Item Type – Goods or Service
- Amount – total amount of sales

In the report parameters you need to select tax codes and an item type for each tax code (goods or service).

In the result table, clicking an account and tax code displays the invoices and credit notes that contribute to the result. 

## Sales revenue

Breaks down revenue by date. The following date grouping options are available: Month, Quarter, Year, Week, Fiscal Quarter, Fiscal Year. The shipping amount can be optionally included in results.

In the result table, clicking a group displays the invoices and credit notes that contribute to the result. 

## Sales by customer

Breaks down revenue by customer.

## Sales by product

Breaks down revenue by product. Product categories can be selected in the report parameters.

## Sales by category

Breaks down revenue by product category.

## Purchase expenditure

Breaks down purchases by date. The following date grouping options are available: Month, Quarter, Year, Week, Fiscal Quarter, Fiscal Year. The shipping amount can be optionally included in results.

In the result table, clicking a group displays the bills and bill credits that contribute to the result.

## Purchases by product

Breaks down purchase expenditure by product. Product categories can be selected in the report parameters.

