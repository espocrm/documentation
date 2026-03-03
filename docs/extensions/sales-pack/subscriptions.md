# Subscriptions

*As of Sales Pack v4.0.*

The Subscription feature provides the ability to invoice customers on a recurring basis.

In this article:

- [Subscription records](#subscription-records)
- [Billing plans](#billing-plans)
- [Periods](#periods)
- [Subscription templates](#subscription-templates)
- [Updates and proration](#updates-and-proration)

Access to Subscriptions is controlled by Roles.

The life cycle of subscriptions is controlled by the scheduled job *Control Subscriptions*. Make sure you have this job active at Administration > Scheduled Jobs.

Terms:

- Charge period. Defines the period used to calculate the subscription price For example, 1 Month or 1 Year.
- Billing period. A period the customer is invoiced for. A billing period can include multiple charge periods. For example, a subscription with a 1-month charge period may be billed every 12 such periods, resulting in a single annual charge covering 12 months.
- Grace period. A period during which the subscription remains active despite being unpaid.
- Alignment period. An additional period used to align the subscription billing cycle to a specific day of the month. It is always shorter than one month and may be charged or free, depending on configuration.
- Trial period. A free period at the start of the subscription.
- Pause period. A period during which the subscription is suspended.

## Subscription records

A Subscription entry represents one subscription.

### Status

A subscription can be in one of the following statuses:

- Draft
- Trial
- Active
- Paused
- Stopped

A subscription that is processed automatically can be in one of the following statuses: Trial, Active, and Paused. The system automatically transitions the subscription between these three statuses depending on the current period and billing conditions. The system changes the status to Stopped when the subscription reaches its End Date or remains unpaid after the grace period. When a subscription reaches the Stopped status, the system stops controlling its state – user intervention is required to reactivate it.

A subscription status is automatically changed to Paused when it reaches a *Pause* period. A user can create such periods to temporarily suspend the subscription.

A user can stop a subscription manually by setting the status to Stopped.

### Billing state

A subscription can be in one of the following billing states:

- Clear. No action required.
- Due. When there is a period with billing status *Invoiced*. The customer needs to pay.
- Past Due. Same as Due, but the invoice is overdue.

The system updates billing states automatically depending on current conditions.

### Billing plan

The subscription billing plan defines billing-related parameters for the subscription. See more about billing plans below.

### Line items

A subscription can have one or multiple line items. Each line item specifies a product, quantity and unit price. Only products marked as *Subscribable* can be added to a subscription. The product of the first line item is designated as a primary product of the subscription.

When the system generates an invoice for a billing period, it carries over the line items from the subscription. While the quantity is preserved, the unit price is adjusted based on the billing period.

### Tax profile

A subscription must be associated with a Tax Profile. This tax profile will be applied for invoices.

### Payment method

The selected payment method will be applied for invoices. The payment method of the related Account is automatically pre-selected when a subscription is created.

### Price book

Subscriptions can be linked to a Price Book which enables customer-specific pricing. The price book of the related Account is automatically pre-selected.

## Billing plans

A Billing Plan encapsulates parameters for subscriptions. Each subscription is associated with a single billing plan, while a billing plan can be used by multiple subscriptions.

Access to Subscription Billing Plans is controlled by Roles. Billing plans are available under: Subscriptions tab > top-right menu > Billing Plans.

### Parameters

#### Charge period

An interval that defines how the subscription is charged and identifies which price book prices apply to the subscription plan. For example, if the period is set to 1 Month, the subscription will use product prices defined specifically for the '1 Month' period.

The list of charge periods available for billing plans and product prices is defined system-wide. An administrator can configure it under: Administration > Subscription Intervals. Interval values are defined by a number and unit. The following units are available: Day, Week, Month, and Year.

#### Billing cycle length

Number of charge periods within a billing cycle. For example, if the cycle length is set to 12 and the charge period is 1 month, the customer will receive one invoice per year.

#### Grace period days

How many days an unpaid subscription remains active after the invoice is overdue.

#### Invoice due period days

Defines how the invoice date due is calculated. The specified number of days is added to the invoice date (the day the invoice is issued).

#### Invoice lead time days

How many days in advance of the next billing cycle an invoice is created. If it is set to 0, the invoice will be issued on the first day of the next billing cycle.

#### Alignment

Enables billing cycle alignment. The following alignment options are available:

- Immediate. A prorated period is created first to align the billing cycle. The following period is a normal billing period.
- Delayed. A normal billing period is created first. The following period is prorated to align the billing cycle.

#### Alignment days

Available if the alignment is enabled and the charge period unit is a month or a year.

Defines month days the subscription will be aligned to. For example, if it is set to 1, subscriptions billing cycles will be aligned to the first day of month. If it is set to 31, then – to the last day of month. Multiple alignment days can be selected, for example 1 and 15 to align subscriptions to the beginning and the middle of the month.

#### Alignment weekdays

Available if the alignment is enabled and the charge period unit is a week.

Defines week days the subscription will be aligned to. Multiple days can be selected.

#### Alignment proration policy

Available if the alignment is enabled.

Controls whether alignment prorated periods are charged. Available options:

- No Charge. The alignment period will be always free for the customer.
- Charge. The alignment period will be proportionally charged if the length exceeds the specified threshold.

#### Alignment charge min. days

Available if the alignment is enabled and the proration policy is set to *Charge*.

Alignment prorated periods shorter than the specified number of days won't be charged. If the value is not specified, then the alignment period will always be charged.

#### Create payment requests

If enabled, payment requests will be automatically created upon invoice creation.

#### Send payment request

If enabled, then created payment requests will be also sent to customers in email.

#### Send invoices

Created invoices will be also automatically sent to customers.

## Periods

A Period entry represents a billing, trial, alignment, or pause period. A sequence of periods defines the subscription's life cycle. A period has Date Start and Date End. Periods cannot overlap. The end date is exclusive – the end date of the previous period becomes a start date of the next period.

The system automatically creates next periods, automatically controls the life cycle of periods, and creates invoices and payments for active periods. A user can create and edit periods manually when needed. A user can also initiate invoice and payment creation manually by clicking *Process Billing* for a particular period.

!!! note

    Payments can be automatically created only if the subscription or the related account has at least one payment method specified.

Periods of a subscription are available in the subscription's detail view in a bottom panel.

### Fields

#### Type

There are the following period types:

- Regular. The subscription is active during this period.
- Pause. The subscription is suspended during this period.
- Trial. The subscription is in trial status during this period.

#### Status

Period statuses:

- Scheduled. The period is not yet started. The system creates scheduled periods automatically beforehand.
- Active. The current active period.
- Ended. The period has ended.
- Canceled. The system can cancel a period in certain error situations. Or a user may set this status to cancel a period manually.

#### Billing status

Billing statuses:

- Pending. Used when a paid period is created but an invoice has not yet been created.
- Invoiced. An invoice is created for the period.
- Settled. The invoice is paid or the period is free of charge.
- Canceled. Can be used for canceled periods.

#### Invoice automatically

If checked, an invoice for the period will be created automatically according the billing plan parameters. The parameter is available only if the billing status is Pending.

#### Activate only if paid

If unchecked, the subscription always switches to Active at the start of the period. If checked, switching to Active also requires the billing status to be Settled.

When a subscription created from a template, this parameter is automatically checked for the first paid period. This means that the subscription won't be set to Active until the period's billing status is settled (usually meaning that the customer has paid). Following periods will have this parameter disabled.

## Subscription templates

Subscription templates simplify subscription creation by defining reusable configuration parameters.

Access to Subscription Templates is controlled by Roles. Subscription templates are available under: Subscriptions tab > top-right menu > Subscription Templates.

### Parameters

#### Billings plans

The field defines which billings plans will be available for selection. For example, you can offer to select either a 1 month or 1 year billing plan.

#### Trial period

If enabled, created subscriptions will have a trial period at the start.

#### Trial period days

The length of the trial period in days.

#### Fixed term

If enabled, created subscriptions will have a fixed duration. The duration is determined by a unit (month, year, week, or day) and a number.

#### Items

A template must have at least one product added in a line item. Only products marked as *Subscribable* are allowed. 

Each line item specifies a quantity. If *Fixed Qty* is checked for a line item, the exact same quantity will be used in a created subscription.

If *Fixed Qty* is not checked, then the line item quantity defined in the template will be multiplied by the quantity set upon subscription creation. For example, if the line item quantity is set to 10 and upon subscription creation the user set a quantity of 3, the result quantity for the item line will be 30. Use case example: A 10 GB storage is given per each seat.

### Template usage

To use a subscription template, go to Subscriptions > top-right menu > Create with Template. Then, select the needed template. After this, the following fields will be shown:

- Billing Plan. Pre-filled if the template has only one plan.
- Start Date. Pre-filled with the today's date.
- Trial period. Pre-checked if the template has the trial period is checked for the template.
- Quantity. Defines quantities of the subscription line items.
- Currency. If multiple currencies are available in the system.

After filling the form, the page will be redirected to the subscription creation form with pre-filled values. Here, you need to select an Account the subscription is created for. Then, you can save the subscription.

## Updates and proration

To update the line items of an existing subscription, a user can either edit the subscription directly or use the built-in update mechanism. In the latter case, the system automatically creates an invoice, a credit note, or both to prorate the change. The proration will be processed only if there is a Regular period entry with status *Invoiced* or *Completed* and this period is not yet ended.

!!! note

    If a Regular period is completed without an invoice (for example, the company decided to provide the service for free for that period), the proration mechanism is still activated by default. In such cases, avoid issuing an invoice and credit note by setting the update status right away to Completed, or edit the subscription directly bypassing the update process. 
    
    You may still want to prorate the amount in cases when the net amount of the proration is a positive value but avoid crediting the customer when the net amount is negative (to avoid crediting the customer for a service they did not pay for). For this, use the update process but do not issue the credit note if the pre-calculated net amount is negative.

To initiate an update process, in the subscription's detail view, click the plus icon in the Updates panel.

The *Date* field value is pre-set with the today's date. Pick another date if needed. This date is used for proration calculation. The portion of the billed period that falls after this date will be prorated.

Specify the *Billing Action*: Draft or Issue. This defines the status of the invoice and credit note which will be created. If you select Issue, then the following checkboxes will show up:

- Create Payment Request. The system will create the payment request with the amount due.
- Send Payment Request. The system will send the payment request to the customer.
- Send Invoice. The system will send the issued invoice to the customer.

Modify the line items of the subscription.

The system previews the three amount values: To Invoice, To Credit, and Net Amount.

Once the update record is saved, the subscription line items are immediately changed according to the line items specified in the update. The line items of the created update cannot be edited. To modify the subscription items again, you need to create a new update.

### Update billing status

The billing status of an update record affects the life cycle of the subscription. An overdue invoice will switch the subscription to the Due billing state and will stop the subscription after the grace period.

