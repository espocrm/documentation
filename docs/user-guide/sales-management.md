# Sales Management

In this article:

* [Leads](#leads)
* [Opportunities](#opportunities)
* [Currency](#currency)
* [Sales analytics](#sales-analytics)

## Leads

A Lead represents a person or organization that currently is not a customer, but has a potential to be. Creating a new lead record usually is a first step of the sale process. As more information about the lead is gathered it's supposed that lead will be converted into a Account, Contact and Opportunity.

New leads are supposed to be created by the following scenarios:

* Manually by CRM users;
* Through the API (e.g. through the web form);
* Automatically by a Workflow rule.

By utilizing [Workflows](../administration/workflows.md), administrator can set up the system to apply a specific assignment rule to new leads, i.e. *Round-Robin* and *Least-Busy* rules. For more complex business flows it's recommended to utilize [BPM tool](../administration/bpm.md).

To prevent overlooking of new leads, users can add *Lead* entity type to the *Global Auto-follow* list at Preferences. Then they will automatically follow every new lead.

### Converting

To convert the lead, you need to click *Convert* button on the lead detail view. Then you can check to what record types you want to convert: Account, Contact, Opportunity.

Converted lead won't be removed from the system. It will have status *Converted*, records it was converted to, will be available on *Converted To* panel on the right.

## Opportunities

An opportunity represents a potential or closed deal. Opportunity with *Closed Won* stage are taken into account in sales revenue calculation (dashlets & reports).

### Stage

Following opportunity stages are available by default:

* Prospecting
* Qualification
* Proposal
* Negotiation
* Closed Won
* Closed Lost

Administrator can define custom stages depending on business flow of the company: Administration > Entity Manager > Opportunity > Fields > Stage. It's also possible to define custom probabilities for each stage.

### Probability

Opportunity probability is an estimated percentage chance that the sale will be won. *Closed Won* status has 100% probability, *Closed Lost* – zero. Other stages has their default probabilities. Probabilities can be utilized in revenue forecasting.

## Currency

Administrator can define available currencies and their rates at Administration > Currency.

It's possible to convert currency of existing opportunities:

* on the list view: select needed records and then click *Convert Currency* in the *Actions* dropdown,
* on the detail view: click the dropdown next to the *Edit* button, then *Convert Currency*.

## Sales analytics

The following charts are available on the dashboard by default:

* Sales by Month
* Opportunities by Lead Source
* Opportunities by Stage
* Sales Pipeline

By utilizing [Reports tool](reports.md) it's possible to view sales statistics based on specific criteria. Report charts can be displayed on the dashboard.

### Revenue forecast

Available with Reports from Advanced Pack.

1. Create a new grid report for Opportunity entity type.
2. Add 'MONTH: Close Date' to Group By field.
3. Add 'SUM: Amount Weighted' to Columns field.
4. Add 'Close Date' to Runtime Filters field.
5. Select 'Bar (vertical)' chart type.

This report will show revenue forecast based on probabilities of opportunities.

Users, who have an access to this report, will be able to add it on their dashboards.

## See also

* [Who are leads? Lead conversion in 3 steps](https://www.espocrm.com/tips/lead-conversion/)
