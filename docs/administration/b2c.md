# Configuring EspoCRM for B2C (Business-to-Client)

By default, EspoCRM is configured for use in B2B business. But you can easily setup it for B2C.

* Check 'B2C Mode' at Administration > Settings.
* Remove *Account* tab from the navigation menu (Administration > User Interface).
* Remove *Account* fields from your layouts (Administration > Layout Manager).
* Disable access to *Account* scope for all your roles (Administration > Roles).
* Remove Account from picklists of all parent fields (Administration > Entity Manager > {Meeting/Call/Task/Email} > Fields > Parent).
