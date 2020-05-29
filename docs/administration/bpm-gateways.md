# BPM Gateways

Gateways are displayed as diamonds.

* [Exclusive](#exclusive-gateway)
* [Inclusive](#inclusive-gateway)
* [Parallel](#parallel-gateway)
* [Event Based](#event-based-gateway)

----

## Exclusive Gateway

Can diverge or converge flows.

In case of diverging it defines a single flow (path) that will be chosen according specified criteria. The first met condition determines the flow, next conditions are omitted. There is an ability to specify default flow. Default flow is chosen if there are no met conditions. Default flow is marked with a slash sign. There must be at least two outgoing flows to be able to specify diverging criteria.

In case of converging it just directs the flow to the outgoing element. It doesn't get blocked after the flow come though, so parallel flows won't be merged into the single flow.

![exclusive gateway divergent](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/gateway-exclusive-divergent.png)

![exclusive gateway convergent](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/gateway-exclusive-convergent.png)

----

## Inclusive Gateway

Can diverge or converge flows.

In case of diverging, it can direct to one or multiple parallel flows (paths), depending on accomplishment of criteria of each flow. Default flow is chosen if there are no met conditions. Default flow is marked with a slash sign. There must be at least two outgoing flows to be able to specify diverging criteria.

If there is a necessity to merge parallel flows produced by a diverging inclusive gateway you need to use a converging inclusive gateway. It will wait for all incoming flows and then continue to the outgoing element.

![inclusive gateway](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/gateway-inclusive.png)

Note: Diverging and converging gateways must be balanced.

Note: If one of parallel flows has been ended for some reason, then diverging gateway will never be processed. The process will be blocked. Avoid a flowchart design that can bring about such a situation.

----

## Parallel Gateway

Can diverge or converge flows.

In case of diverging it splits flow into multiple parallel flows. There are no parameters for this gateway type.

In case of converging it waits until all incoming flows come and then continues to the next outgoing element.

![parallel gateway](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/gateway-parallel.png)

Note: Diverging and converging gateways must be balanced.

Note: If one of parallel flows has been ended for some reason, then diverging gateway will never be processed. The process will be blocked. Avoid a flowchart design that can bring about such a situation.

----

## Event Based Gateway

Can only diverge flows.

It stops the flow until any of outgoing events gets triggered. Triggered event determines the single flow. Other outgoing events get rejected.

Only intermediate events can be on the other end of outgoing sequence flows.

![event based gateway](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/gateway-event-based.png)
