# BPM Gateways

Gateways diverge and converge flows. Depicted as a yellow diamond. They can be used to determine a path in which the flow will go depending on specific conditions. They can split a flow into multiple parallel flows and join parallel flows into a single one.

Whether a gateway is diverging or converging is defined by the number of incoming and outgoing flows. A diverging gateway has one incoming flow and multiple outgoing flows. A converging gateway has multiple incoming flows and one outgoing flow.

When you added a gateway that is meant to be diverging, you also need to add all elements it should diverge to, then use the Connect tool to connect the gateway to each element. After the elements are connected, you can define conditions by clicking the gateway (conditions can be defined only for Exclusive and Inclusive gateways).

Gateways:

* [Exclusive](#exclusive-gateway)
* [Inclusive](#inclusive-gateway)
* [Parallel](#parallel-gateway)
* [Event Based](#event-based-gateway)

| Type | Can produce parallel flows? | Description |
| :--- | :--- | :--- |
| Exclusive | No | Chooses one path. |
| Inclusive | Yes | Chooses one or multiple paths |
| Parallel | Yes | Splits the flow into multiple paths. |
| Event Based | No | Chooses one path based on an event triggered first. |

----

## Exclusive Gateway

Can diverge or converge flows.

This is the most common type of gateway, used to implement basic conditional logic.

In case of diverging, it directs to a single flow (path), chosen based on the path's criteria. Each path has defined condition. The first met condition determines the flow, subsequent conditions are skipped. Conditions are evaluated according to the defined order.

There is the ability to specify the default flow. The default flow is chosen when no conditions are met. The default flow is marked with a slash sign.

!!! important

    There must be at least two outgoing flows to be able to specify diverging criteria.

![exclusive gateway divergent](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/gateway-exclusive-divergent.png)

In case of converging, it just directs the flow to the outgoing element. It does not block the flow, hence parallel flows won't be merged into a single flow.

![exclusive gateway convergent](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/gateway-exclusive-convergent.png)

----

## Inclusive Gateway

Can diverge or converge flows.

In case of diverging, it can direct to one or multiple parallel flows (paths) based on the accomplishment of each path's criteria. In other words, all conditions that are met determine the outgoing flows.

There is the ability to specify the default flow. The default flow is chosen when no conditions are met. The default flow is marked with a slash sign.

!!! important

    There must be at least two outgoing flows to be able to specify diverging criteria.

![inclusive gateway](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/gateway-inclusive.png)

If there is a necessity to merge parallel flows produced by a diverging inclusive gateway, you need to use a converging inclusive gateway. It will wait for all incoming flows and only then will continue to the outgoing element.



!!! note

    Diverging and converging gateways must be balanced. The number of flows outgoing from a diverging gateway should equal the number of flows incoming to a converging gateway. If between these gateways one of flows splits into nested parallel flows, these nested flows must be converged before the outer converging gateway. And so on.

!!! note

    If one of parallel flows has been ended for some reason, then the diverging converging will never be processed. The process will be blocked. Avoid the flowchart design that can bring about such a situation.

----

## Parallel Gateway

Can diverge or converge flows.

In case of diverging, it splits the flow into multiple parallel flows. There are no parameters (no conditions) for this gateway type.

In case of converging, it waits until all incoming flows come and only then continues to the next outgoing element.

![parallel gateway](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/gateway-parallel.png)

!!! note

    Diverging and converging gateways must be balanced. The number of flows outgoing from a diverging gateway should equal the number of flows incoming to a converging gateway. If between these gateways one of flows splits into nested parallel flows, these nested flows must be converged before the outer converging gateway. And so on.

!!! note

    If one of parallel flows has been ended for some reason, then diverging gateway will never be processed. The process will be blocked. Avoid the flowchart design that can bring about such a situation.

----

## Event Based Gateway

Can only diverge flows.

It suspends the flow until any of the outgoing events is triggered. The triggered event determines the path forward, while all other outgoing events are rejected. In other words, the first wins.

Only intermediate events can be on the other end of outgoing sequence flows.

![event based gateway](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/gateway-event-based.png)
