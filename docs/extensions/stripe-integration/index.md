# Stripe Integration

The integration allows your customers to make one-time payments using Stripe. Available in [extension](https://www.espocrm.com/extensions/stripe-integration/).

The Stripe integration requires:

- [Sales Pack](https://www.espocrm.com/extensions/sales-pack/) extension
- EspoCRM v9.1 or greater

Check this [article](../sales-pack/payments.md) to learn about the payments feature in Sales Pack.

## Setting up

!!! important

    The integration relies on Stripe's webhooks. Your Espo instance must be accessible to Stripe.

### Create webhooks in Stripe

Go to Stripe Dashboard > Developers > Webhooks.

Click *Add destination*.

Select all the following Checkout events:

* checkout.session.async_payment_failed
* checkout.session.async_payment_succeeded
* checkout.session.completed
* checkout.session.expired

Then, choose the Webhook endpoint, as we are creating a webhook.

Specify the following endpoint URL: `https://your-host/api/v1/Stripe/webhook`. You can obtain the proper URL in Espo under Administration > Payment Channels > Create Payment Channel.

### Create payment channel in Espo

Create a Payment Channel under Administration > Payment Channels, and select *Stripe* in the Provider field. Enter your Stripe keys and the webhook key, which you can obtain from the Stripe Dashboard.

You may name the payment channel *Stripe*.

### Create payment method in Espo

Create a Payment Channel under Administration > Payment Methods, and select the previously created channel. You may name the method *Stripe*.

## Trying out

1. Create a Payment Request, select the created Stripe method, and enter the amount. Set the status to *Pending*.
2. After the request is created, the payment URL will be generated. You can send this URL to your customer so that they can pay via Stripe.
3. Once the customer paid, the status of the Payment Request will automatically change to *Paid*.
4. A Payment entry related to the Payment Request will be created with the status *In Progress*, and will automatically change to *Paid* shortly after (by cron).

## Testing in local environment

As webhooks require your Espo instance being accessible to Stripe, testing the integration in a local environment may need a few tweaks. To test the integration in a local environment, you can use Stripe CLI or a tunnel service (e.g., ngrok).

### Using Stripe CLI

Stripe CLI allows to forward Stripe events to your local webserver. You don't need to create webhooks in the Stripe Dashboard for this (though you will need to create them for production).

Download the [Stripe CLI](https://docs.stripe.com/stripe-cli) tool and run it in the terminal.

Run the command:

```
stripe listen --forward-to localhost/api/v1/Stripe/webhook
```

Where *localhost* should be replaced with the actual local address of your Espo instance.

It will print the webhook secret key. Specify this key in the payment channel record in Espo.

Keep the process running while you are testing the integration.
