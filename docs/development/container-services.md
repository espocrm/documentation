# Container Services

Console command that prints all available container services with their implementing classes:

```
php command.php app-info --container
```

Most often used services are listed below.

## entityManager

Class: `Espo\Core\ORM\EntityManager`

A central access point to [ORM](orm.md) functionality.

## metadata

Class: `Espo\Core\Utils\Metadata`

Access to [metadata](metadata.md).

## config

Class: `Espo\Core\Utils\Config`

A main application config.

## fileManager

Class: `Espo\Core\Utils\File\Manager`

Privides functions for reading and storing files.

## applicationState

Class: `Espo\Core\ApplicationState`

Provides information about an application, current user, portal.

## log

Class: `Espo\Core\Utils\Log`

For logging. Messages are written into `data/log`.

## user

Class: `Espo\Enities\User`

A current user. If an application does not require an authentication, then *system* is substituted.

## preferences

Class: `Espo\Enities\Preferences`

Preferences of a current user.

## aclManager

Class: `Espo\Core\AclManager`

Provides access checking functions for any user.

## acl

Class: `Espo\Core\Acl`

Provides access checking functions for a current user. A wrapper for *aclManager*.

## serviceFactory

Class: `Espo\Core\ServiceFactory`

For creation of [service](services.md) instances .

## selectManagerFactory

Class: `Espo\Core\Select\SelectManagerFactory`

For creation of [select manager](select-manager.md) instances.

## fieldUtil

Class: `Espo\Core\Utils\FieldUtil`

## dateTime

Class: `Espo\Core\Utils\DateTime`

Date-time functions.

## number

Class: `Espo\Core\Utils\NumberUtil`

Number functions.

## fileStorageManager

Class: `Espo\Core\FileStorage\Manager`

## language

Class: `Espo\Core\Utils\Language`

Language util of a current user.

## defaultLangage

Class: `Espo\Core\Utils\Language`

A util for a default language of the system.

## baseLanguage

Class: `Espo\Core\Utils\Language`

A util for *en_US* language.
