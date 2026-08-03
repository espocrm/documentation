# AI Usage & Quota

## Usage log

The usage of LLM APIs is logged. The log is available under: Administration > Intelligence panel > Usage Log.

What is logged:

- User
- Feature
- Provider
- Model
- Input tokens
- Output tokens

By utilizing the [Reports](../../user-guide/reports.md) feature, it is possible to create grid reports
with usage statistics.

## Quota

The AI Usage Quota feature can be enabled under: Administration > Intelligence panel > Settings.

The Quota feature allows you to limit AI usage for users. Users receive a credit balance.
Once their balance becomes negative, they cannot use AI features until it is replenished.

### Prices

Token prices can be defined for each model. Prices are specified per million tokens.

### Plans

Quota plans can be assigned to users, teams, and the system.

When assigned to a team, users with that team set as default (User > Default Team) will receive quota of the plan.
Plan assigned directly to a user has higher priority than a plan assigned to a team.

A plan assigned to the system governs AI usage by workflows and BPM processes. Consider using a separate plan for this,
with a higher credit amount.

A plan defines:

- Amount – number of credits given to the user per period;
- Interval – day, week or month.

A user's balance is replenished at the start of each period. The plan amount is compared
with the user's current balance, and the difference is added so that the user's balance matches
the credit amount defined by the plan.

### Replenishment

Balance replenishment is controlled by the scheduled job 'AI Usage Quota Replenishment'.

An admin can manually replenish the balance for a specific user:
the User detail view > top-right menu > Intelligence > Replenish.
To replenish the balance for the system user, follow:
Administration > Intelligence panel > Ledger > top-right menu > System User Balance > Replenish.

You can initiate quota replenishment for all users without waiting for the scheduled job. For this, follow:
Administration > Intelligence panel > Plans > top-right menu > Process Replenishment.

### Ledger

Credits are controlled by a ledger. There are three types of ledger entries:

- Usage – negative amount, created automatically;
- Replenishment – positive amount, created automatically;
- Adjustment – arbitrary amount, created manually by an admin.

A user's current balance is the sum of their ledger entries.

### Balance

A user can check their balance under: the User detail view > top-right menu > Intelligence. The user can also
add the Intelligence dashlet to their dashboard.

An admin can check the system user balance under:
Administration > Intelligence panel > Ledger > top-right menu > System User Balance.

By utilizing the [Reports](../../user-guide/reports.md) feature, it is possible to create a grid report
with user balances.
