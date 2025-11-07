# Sales Management

In this article:

* [Leads](#leads)
* [Opportunities](#opportunities)
* [Currency](#currency)
* [Sales analytics](#sales-analytics)
* [See also](#see-also)

## Leads

A Lead represents a person or organization that  is not currently a customer but has the potential to be. Creating a new Lead record is usually the first step in the sale process. As more information about the Lead is gathered,  the Lead is expected to be converted into an Account, Contact, and/or Opportunity.

New Leads are typically created in the following scenarios:

* manually by CRM users;
* through the API (e.g. through a web form);
* automatically by a Workflow rule.

By utilizing the [Workflows](../administration/workflows.md) tool, an administrator can set up the system to apply a specific assignment rule to new Leads. *Round-Robin* and *Least-Busy* rules are available. For more complex business flows, it's recommended to utilize the [BPM tool](../administration/bpm.md).

Users can also create a Lead from an Email – from the top-right dropdown menu.

To prevent overlooking of new Leads, users can add the *Lead* entity type to the *Global Auto-follow* list in Preferences. Then, they will automatically follow every new Lead created in the system they have access to.

It may be useful to enable the Kanban view for Leads. It can be enabled under: Administration > Entity Manager > Lead > Edit > Kanban View.

### Converting

To convert a Lead, you need to click *Convert* button on the Lead detail view. Then, you can check to what record types you want to convert: Account, Contact, and/or Opportunity.

A converted Lead won't be removed from the system. It will have status *Converted*, records it was converted to, will be available in the *Converted To* panel on the right.

## Opportunities

An Opportunity represents a potential deal or closed sale.

!!! note

    Opportunities with the *Closed Won* stage are taken into account in the default sales dashlets. Using Opportunities to calculate revenue is an option that may be suitable for small businesses.

For Opportunities, the Kanban view is enabled by default. Users can switch between the List and Kanban views.

### Stage

The following opportunity stages are available by default:

* Prospecting
* Qualification
* Proposal
* Negotiation
* Closed Won
* Closed Lost

An administrator can define custom stages depending on the business workflow of the company: Administration > Entity Manager > Opportunity > Fields > Stage. It's also possible to define custom probability values for each stage.

### Probability

The Opportunity probability is an estimated percentage chance that the sale will be won. The *Closed Won* status has a 100% probability, the *Closed Lost* – zero. Other stages has their specific probabilities between 0% and 100%. The probabilities can be modified in the Entity Manager.

!!! note

    Probabilities can be utilized in revenue forecasting.

## Currency

An administrator can define available currencies and their rates at Administration > Currency.

It's possible to convert currency of existing Opportunities:

* on the list view: select needed records and then click *Convert Currency* in the *Actions* dropdown;
* on the detail view: click the dropdown next to the *Edit* button, then *Convert Currency*.

## Sales analytics

The following charts are available on the dashboard by default:

* Sales by Month
* Opportunities by Lead Source
* Opportunities by Stage
* Sales Pipeline

By utilizing the [Reports tool](reports.md), it's possible to view sales statistics based on specific criteria. Report charts can be displayed on the dashboard.

### Revenue forecast

Available with Reports from Advanced Pack.

1. Create a new grid report for Opportunity entity type.
2. Add 'MONTH: Close Date' to Group By field.
3. Add 'SUM: Amount Weighted' to Columns field.
4. Add 'Close Date' to Runtime Filters field.
5. Select 'Bar (vertical)' chart type.

This report will show the revenue forecast based on probabilities of Opportunities.

Users who have access to this report will be able to add it on their dashboards.

## See also

* [Quick tour on Leads](https://app.supademo.com/demo/cmhc0w8ns14v6fatilwlycmjn)
* [Quick tour on Opportunities](https://app.supademo.com/demo/cmhkj43rn1k3xu1hm0zxfmhb6)
* [Who are leads? Lead conversion in 3 steps](https://www.espocrm.com/tips/lead-conversion/)
