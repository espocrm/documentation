# EspoCRM Documentation

### Administration

* Server configuration
  * [Configuration](administration/server-configuration.md)
  * [Apache](administration/apache-server-configuration.md)
  * [Nginx](administration/nginx-server-configuration.md)
  * [IIS](administration/iis-server-configuration.md)
* System
  * Installation
    * [Installation](administration/installation.md)
    * [Installation by script](administration/installation-by-script.md)
    * [Installation with Docker](administration/docker/installation.md)
    * [Installation with Traefik](administration/docker/traefik.md)
    * [Installation with Caddy](administration/docker/caddy.md)
  * [Upgrading](administration/upgrading.md)
  * [Extensions](administration/extensions.md)
  * [Troubleshooting](administration/troubleshooting.md)
  * [Jobs](administration/jobs.md)
  * [Config parameters](administration/config-params.md)
  * [Log](administration/log.md)
  * [Console commands](administration/commands.md)
  * [WebSocket](administration/websocket.md)
  * [Performance tweaking](administration/performance-tweaking.md)
  * [Backup and restore](administration/backup-and-restore.md)
  * [Moving to another server](administration/moving-to-another-server.md)
* Customization
  * [Entity Manager: entities, fields, relationships](administration/entity-manager.md)
  * [Fields](administration/fields.md)
  * [Layouts](administration/layout-manager.md)
  * [Dynamic Logic](administration/dynamic-logic.md)
  * [API Before-Save script](administration/api-before-save-script.md)
* [Users](administration/users-management.md)
* [Roles](administration/roles-management.md)
* [Email administration](administration/emails.md)
* Formula
  * [Formula script](administration/formula.md)
  * [Functions](administration/formula-functions.md)
* [Import](administration/import.md)
* [Portal](administration/portal.md)
* [Web-to-Lead](administration/web-to-lead.md)
* [Currency](administration/currency.md)
* [Dashboards](administration/dashboards.md)
* Authentication
  * [2 factor authentication](administration/2fa.md)
  * [OpenID Connect](administration/oidc.md)
  * LDAP
    * [Authorization](administration/ldap-authorization.md)
    * [Active Directory](administration/ldap-authorization-for-ad.md)
    * [OpenLDAP](administration/ldap-authorization-for-openldap.md)
* Misc
  * [Terms & naming](administration/terms-and-naming.md)  
  * [Webhooks](administration/webhooks.md)
  * [Passwords](administration/passwords.md)
  * [Security](administration/security.md)
  * [Phone numbers](administration/phone-numbers.md)
  * [Addresses](administration/addresses.md)
  * [Maps](administration/maps.md)
  * [B2C mode](administration/b2c.md)
  * [Multiple assigned users](administration/multiple-assigned-users.md)
  * [File storage](administration/file-storage.md)
  * [SMS sending](administration/sms-sending.md)
  * [App secrets](administration/app-secrets.md)

---

### User Guide

* Emails
  * [General guidelines](user-guide/emails.md)
  * [IMAP & SMTP configuration](user-guide/imap-smtp-configuration.md)
  * [Mass Email](user-guide/mass-email.md)
* [Stream](user-guide/stream.md)
* [Sales management: Leads & Opportunities](user-guide/sales-management.md)
* [Case management](user-guide/case-management.md)
* [Activities & Calendar](user-guide/activities-and-calendar.md)
* [Mail Merge (mass snail mailing)](user-guide/mail-merge.md)
* [Knowledge base](user-guide/knowledge-base.md)
* [Documents](user-guide/documents.md)
* [Export](user-guide/export.md)
* [Text search](user-guide/text-search.md)
* [Working time calendar](user-guide/working-time-calendar.md)
* Misc
  * [Shortcut keys](user-guide/shortcuts.md)
  * [Printing to PDF](user-guide/printing-to-pdf.md)
  * [Markdown syntax](user-guide/markdown.md)
  * [Browser support](user-guide/browser-support.md)
  * [Data privacy](user-guide/data-privacy.md)
  * [Complex expressions](user-guide/complex-expressions.md)
  * [Optimistic concurrency control](user-guide/optimistic-concurrency-control.md)

---

### Extensions

* Advanced Pack
  * [Overview](extensions/advanced-pack/overview.md)
  * [Reports](user-guide/reports.md)
  * [Workflows](administration/workflows.md)
  * [Business Process Management (BPM)](administration/bpm.md)
* Sales Pack
  * [Overview](extensions/sales-pack/overview.md)
  * [Products](user-guide/products.md)
  * [Prices](extensions/sales-pack/prices.md)
  * Sales
    * [Quotes](user-guide/quotes.md)
    * [Sales Orders](user-guide/sales-orders.md)
    * [Invoices](user-guide/invoices.md)
    * [Credit Notes](extensions/sales-pack/credit-notes.md)
    * [Delivery Orders](extensions/sales-pack/delivery-orders.md)
    * [Return Orders](extensions/sales-pack/return-orders.md)
  * Purchases
    * [Purchase Orders](extensions/sales-pack/purchase-orders.md)
    * [Receipt Orders](extensions/sales-pack/receipt-orders.md)
    * [Suppliers](extensions/sales-pack/suppliers.md)
  * [Inventory Management](extensions/sales-pack/inventory-management.md)
  * [Payments](extensions/sales-pack/payments.md)
  * [Taxes](extensions/sales-pack/taxes.md)
* Project Management
  * [Projects](extensions/project-management/projects.md)
* Meeting Scheduler
  * [Meeting Scheduler](extensions/meeting-scheduler/index.md)
* Google Integration
  * [Setting-up](extensions/google-integration/setting-up.md)
  * [Calendar](extensions/google-integration/calendar.md)
  * [Contacts](extensions/google-integration/contacts.md)
  * [Gmail](extensions/google-integration/gmail.md)
* Outlook Integration
  * [Setting-up](extensions/outlook-integration/setting-up.md)
  * [Calendar](extensions/outlook-integration/calendar.md)
  * [Contacts](extensions/outlook-integration/contacts.md)
  * [Email](extensions/outlook-integration/email.md)
* VoIP Integration
  * [Overview](extensions/voip-integration/overview.md)
  * [3CX PBX](extensions/voip-integration/3cx-integration-setup.md)
  * [Twilio service](extensions/voip-integration/twilio-integration-setup.md)
  * [Asterisk server](extensions/voip-integration/asterisk-integration-setup.md)
  * [Starface server](extensions/voip-integration/starface-integration-setup.md)
  * [Binotel service](extensions/voip-integration/binotel-integration-setup.md)
  * [IexPBX server](extensions/voip-integration/iexpbx-integration-setup.md)
  * [Docker container](extensions/voip-integration/docker-container.md)
  * [Customization](extensions/voip-integration/customization.md)
  * [Troubleshooting](extensions/voip-integration/troubleshooting.md)
* Zoom Integration
  * [Zoom Integration](extensions/zoom-integration/index.md)
* Stripe Integration
  * [Stripe Integration](extensions/stripe-integration/index.md)
* Export Import
  * [Overview](extensions/export-import/overview.md)
  * [Export](extensions/export-import/export.md)
  * [Import](extensions/export-import/import.md)
  * [Compare](extensions/export-import/compare.md)
  * [Run by code](extensions/export-import/run-by-code.md)
  * [Customization](extensions/export-import/customization.md)

---

### See also

* [Developer documentation](development/index.md)
* [Hints & tips](https://www.espocrm.com/tips/)
