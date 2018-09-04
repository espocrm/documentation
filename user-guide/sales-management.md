# Sales Management

## Leads

Lead represents a person or an organization that currently is not a customer, but have a potential to be. Creating a lead record usually is a first step of the sale process. As more information about the Lead is gathered it's supposed that lead will be converted into a Account, Contact and Opportunity.

New leads are supposed to be created by the following scenarios:

* Manually by CRM users;
* Through the API (e.g. through the web form);
* Automatically by a Workflow rule.

By utilizing [Workflows](https://github.com/espocrm/documentation/blob/master/administration/workflows.md) administrator can set up the system to apply a specific assignment rule to new leads, i.e. Round-Robin and Least-Busy rules. For more complex business flows it's recommended to utilize [BPM tool](https://github.com/espocrm/documentation/blob/master/administration/bpm.md).

To prevent overlooking of new leads, users can add Lead entity type to the Global Auto-follow list at Preferences. Then they will automatically follow every new lead. 

## Opportunities

Opportunity represents a potential or closed deal. Opportunity with 'Closed Won' stage are taken into account for a sales revenue calculation. 

Following stages are available by default:

* Prospecting;
* Qualification;
* Proposal;
* Negotiation;
* Closed Won;
* Closed Lost.

Administrator can define custom stages depending on business flow of the company: Administration > Entity Manager > Opportunity > Fields > Stage. It's also possible to define custom probabilities for each stage.

## Currency 

Administrator can define available currencies and their rates at Administration > Currency. It's possible to convert currency of existing opportunities from the list view: select needed records and then click Convert Currency in the Actions dropdown.

## Sales analytics

The following charts are available on the dashboard by default:

* Sales by Month;
* Opportunities by Lead Source;
* Opportunities by Stage;
* Sales Pipeline.

By utilizing [Reports tool](https://github.com/espocrm/documentation/blob/master/user-guide/reports.md) it's possible to view sales statistics based on specific criteria. Report charts can be displayed on the dashboard.

### Revenue Forecast

1. Create a new grid report for Opportunity entity type.
2. Add 'MONTH: Close Date' to Group By field. 
3. Add 'SUM: Amount Weighted' to Columns field.
4. Add 'Close Date' to Runtime Filters field.
5. Select 'Bar (vertical)' chart type.

This report will show revenue forecast based on probabilities of opportunities.

Users, who have an access to this report, will be able to add it on their dashboards.

