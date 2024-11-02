# Configuring EspoCRM for B2C (Business-to-Client)

By default, EspoCRM is configured for use in B2B business. It's possible to set it up for solely B2C.

* Check *B2C Mode* at Administration > Settings.
* Remove the *Account* tab from the navigation menu: Administration > User Interface.
* Remove the *Account* fields from your layouts: Administration > Layout Manager.
* Disable access to the *Account* scope in Rroles if you allowed it before.
* Remove the *Account* from picklists of all parent fields: Administration > Entity Manager > {Meeting/Call/Task/Email} > Fields > Parent.
