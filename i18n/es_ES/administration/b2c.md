# Configurando EspoCRM para B2C (Business-to-Client)

Por defecto EspoCRM esta configurado para usarlo como B2B (Business-to-Bussiness). Pero tu puedes facilmente configurarlo para B2C.

* Cambie `b2cMode` a 'true' en tu archivo de configuración `data/config.php`. Desde la version 4.3.0 puede ser configurado desde Administration > Seetings.
* Elimine la pestaña *Account* desde el menú ne navegación. (Administration > User Interface).
* Elimine los campos *Account* de tus diseños (Administation > Layout Manager).
* Deshabilite el acceso a *Account* para todos tus Roles (Administration > Roles).
* Elimine la cuenta desde las listas de selección de todos los campos principales (Administration > Entity Manager > {Meeting/Call/Task/Email} > Fields > Parent).
