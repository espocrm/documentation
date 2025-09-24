# Payments

*As of Sales Pack v3.0.*

*Compatible with EspoCRM v9.1 or greater.*

In this article:

* [Payment entries](#payment-entries)
* [Payment methods](#payment-methods)
* [Payment channels](#payment-channels)
* [Payment requests](#payment-requests)

## Payment entries

A Payment record captures a single payment transaction, either inbound or outbound.

Access to Payments is controlled by Roles. Payments can be created from the Payments list view. Payments can also be created from the Invoice and Credit Note detail views.

An inbound payment can be allocated to one or more Invoices. An outbound payment can be allocated to one or more Credit Notes.

When a payment amount is received, the payment record is supposed to be set to the *Paid* status. After the payment amount is fully allocated, it has to be set to *Completed*.

When the payment amount is received, the status of the Payment record should be set to *Paid*. Once the full amount has been allocated, the status has to be updated to *Completed*.

If a payment exceeds the invoices' outstanding amount, the surplus can be allocated later to future invoices of the customer.

## Payment methods

A Payment Method must be specified for each Payment record.

Only an administrator can manage Payment Methods. Regular users can read payment methods if their Role grants access.

By default, there's no any payment method in the system. An administrator needs to create them.

Some payment method examples: Wire Transfer, Cash, Stripe.

You can add text instructions for a specific payment method. These instructions will appear on the payment link page.

Multiple payment methods can be associated with a single Invoice, with one designated as primary.

Multiple payment methods can be associated with an Account, with one designated as primary. When an Invoice is created for an Account, the account's payment methods are carried over to the invoice.

## Payment channels

A payment method can be associated with a specific Payment Channel, which encapsulates the credentials and settings for a particular payment provider.

Only an administrator can manage payment channels. Regular users cannot view payment channel records.

Out of the box, the following providers are available:

* Wire Transfer
* SEPA Credit Transfer
* SEPA Direct Debit

### Wire Transfer

A generic bank credit transfer. The payment channel record stores bank credentials, which can be presented to a customer on a payment link page.

The credentials are included in an E-invoice if the payment method is set for the invoice.

### SEPA Credit Transfer

The payment channel record stores bank credentials, which can be presented to a customer on a payment link page.

The credentials are included in an E-invoice if the payment method is set for the invoice.

### SEPA Direct Debit

The payment channel record stores bank credentials and the creditor identifier.

A Direct Debit Mandate can be created for an Account.

To generate a payment XML file, you need to create a Payment Request with the method set to *SEPA Direct Debit*. Then, the button will be available on the Payment Request detail view.

When *SEPA Direct Debit* is selected as the Invoice's payment method, the generated E-invoice file includes the bank credentials and mandate data.

## Payment requests

Payment Requests can be used to create unique payment links. Payment links can be send to customers. No Espo user account is required to access these links.

Payment instructions and bank credentials can be displayed on the payment link page. In the case of an automated payment channel like Stripe, the customer can make a payment from the payment link.

Payment requests can be created from an Invoice.

Access to payment requests is controlled by Roles.

### Sending in email

To send a payment link in an email, click *Send in Email* from the dropdown next to the *Edit* button on the Payment Request detail view.

An administrator can select the default email template for payment requests: Administration > Sales Pack Settings > Email Templates > Payment Request Email Template.

Use the placeholder `{PaymentRequest.paymentUrl}` in the email template for a link. Note that the link will automatically appended to the email body if there's no URL placeholder in the email template.

Note that you can also access the payment URL from a Formula script.

It is also possible to include payment links when sending an invoice in email. Use the following code in the email template:

```
<p>
  {{#each paymentRequests}}
    {{#if (equal status 'Pending') }}
      <a href="{{paymentUrl}}">Payment Link {{number}}</a><br>
    {{/if}}
  {{/each}}
</p>
```
