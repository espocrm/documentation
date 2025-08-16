# Container Services

Console command that prints all available container services with their implementing classes:

```
bin/command app-info --container
```

Most often used services are listed below.

## entityManager

Class: `Espo\ORM\EntityManager`

A central access point to [ORM](orm.md) functionality.

## metadata

Class: `Espo\Core\Utils\Metadata`

Application [metadata](metadata.md).

## config

Class: `Espo\Core\Utils\Config`

A main application config.

## ormDefs

*As of v7.0.*

Class: `Espo\ORM\Defs\Defs`

Entity definitions (fields, attributes, relations).

## fileManager

Class: `Espo\Core\Utils\File\Manager`

Provides functions for reading and storing files.

## applicationState

Class: `Espo\Core\ApplicationState`

Provides information about an application, current user, portal.

## log

Class: `Espo\Core\Utils\Log`

A logger. Messages are written into `data/log`.

## user

Class: `Espo\Entities\User`

A current user. If an application does not require an authentication, then the *system* user is substituted.

## preferences

Class: `Espo\Entities\Preferences`

Preferences of a current user.

## aclManager

Class: `Espo\Core\AclManager`

Provides access checking functions for any user.

## acl

Class: `Espo\Core\Acl`

Provides access checking functions for a current user. A wrapper for *aclManager*.

## fieldUtil

Class: `Espo\Core\Utils\FieldUtil`

An utility class for obtaining information about fields.

## dateTime

Class: `Espo\Core\Utils\DateTime`

Date-time utility functions.

## number

Class: `Espo\Core\Utils\NumberUtil`

Number utility functions.

## fileStorageManager

Class: `Espo\Core\FileStorage\Manager`

Stores and reads attachment entities.

## language

Class: `Espo\Core\Utils\Language`

Language util of a current user.

## defaultLanguage

Class: `Espo\Core\Utils\Language`

A util for a default language of the system.

## baseLanguage

Class: `Espo\Core\Utils\Language`

A util for *en_US* language.

## formulaManager

Class: `Espo\Core\Formula\Manager`

To run Formula scripts.

## streamService

Class: `Espo\Tools\Stream\Service`

## applicationConfig

*As of v9.1.*

Class: `Espo\Core\Utils\Config\ApplicationConfig`

## systemConfig

*As of v9.1.*

Class: `Espo\Core\Utils\Config\SystemConfig`
