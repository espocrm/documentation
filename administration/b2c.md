#Configuring EspoCRM for B2C (Business-to-Client)

By default EspoCRM is configured to use for B2B business. But you can easily setup it for B2C.

* Change `b2cMode` to true in your config file `data/config.php`. Since version 4.3.0 it can be configured at Administration > Seetings.
* Remove *Account* tab from the navigation menu (Administration > User Interface).
* Remove *Account* fields from your layouts (Administation > Layout Manager).
* Disable an access to *Account* scope for all your roles (Administration > Roles).
* Remove Account from picklists of all parent fields (Administration > Entity Manager > {Meeting/Call/Task/Email} > Fields > Parent).
