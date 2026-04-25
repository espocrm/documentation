# Campaigns

Campaigns help you create and manage various marketing initiatives, including email, newsletters, web, radio, television, and direct mail.

The *Type* field in a campaign record has the following options:

- Email. Mass email marketing.
- Newsletter. Mass newsletter email.
- Information Email. Mass email of non-marketing nature, for example, information about a license update.
- Web
- Television
- Radio
- Mail. Direct mail.

Leads, Opportunities, Accounts, and Contacts can be associated with a campaign. When a lead is created for a specific campaign, a *Lead Created* entry is added to the campaign log.

A [Lead Capture](../administration/web-to-lead.md) can be associated with a specific campaign. All generated leads will then be linked to that campaign.

See also:

- [Mass email](mass-email.md)
- [Mail merge](mail-merge.md)
- [Campaigns quick tour](https://app.supademo.com/demo/cmnim3kjr01wvwn0j4g5jug04)

## Target lists

Target lists can be specified for campaigns Email, Newsletter, Information Email, and Mail campaigns. The *Target Lists* field defines the target audience, while the *Excluding Target Lists* field specifies who to exclude. Contacts in the excluding list are excluded, even if they appear in the campaign's target list.

## Log

Log entries display activity history of the campaign. The following events are logged:

- Sent. An email is sent (mass email).
- Opened. A recipient opened an email (mass email).
- Opted Out. A recipient unsubscribed (mass email).
- Opted In. A recipient subscribed back (mass email).
- Bounced. An email is bounced (mass email). Can be hard and soft bounced.
- Clicked. A recipient clicked a tracking URL (mass email).
- Lead Created. Anew lead associated with the campaign is created.

## Statistics

The Statistics panel in a campaign displays the following metrics:

- Sent. The total number of emails sent within the campaign (mass email).
- Clicked. The total number of clicks on tracking URLs within the campaign.
- Opted Out. The total number of recipients who opted out and percentage.
- Bounced. The total number of bounced emails and percentage.
- Lead Created. The total number of created leads.
- Opted In. The total number of recipients who opted in back and percentage.
- Revenue. Calculated by summing up all associated *Closed Won* opportunities.
