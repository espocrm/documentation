# Custom Entity Type

This article gives information about how to create custom entity types manually (without using the UI).

In the example, the entity type will be defined in the `custom/Espo/Modules/MyModule` directory which corresponds to the `Espo\Modules\MyModule` namespace. You can also define in `custom/Espo/Custom` directory which corresponds to the `Espo\Custom` namespace.

The entity type name created in the example is `MyEntity`.

After all needed files are created, you need to run rebuild (Administration > Rebuild). It will clear cache and create a database tables.

## Metadata

### entityDefs

[Reference](metadata/entity-defs.md)

File: `custom/Espo/Modules/MyModule/Resources/metadata/entityDefs/MyEntity.json`

Defines entity definitions: fields, links, indexes and parameters.

Example:

```json
{
    "fields": {
        "name": {
            "type": "varchar",
            "maxLength": 100,
            "required": true
        },
        "status": {
            "type": "enum",
            "maxLength": 9,
            "options": [
                "Draft",
                "Started",
                "Completed",
                "Canceled"
            ],
            "default": "Draft",
            "style": {
                "Started": "primary",
                "Completed": "success",
                "Canceled": "info"
            }
        },
        "assignedUser": {
            "type": "link"
        },
        "teams": {
            "type": "linkMultiple"
        },
        "createdAt": {
            "type": "datetime",
            "readOnly": true
        }
    },
    "links": {
        "assignedUser": {
            "type": "belongsTo",
            "entity": "User"
        },
        "teams": {
            "type": "hasMany",
            "entity": "Team",
            "relationName": "entityTeam"
        }
    },
    "indexes": {
        "name": {
            "columns": ["name"]
        }
    },
    "collection": {
        "textFilterFields": ["name"],
        "orderBy": "createdAt",
        "order": "desc"
    }
}
```

### scopes

[Reference](metadata/scopes.md)

File: `custom/Espo/Modules/MyModule/Resources/metadata/scopes/MyEntity.json`

Defines scope parameters.

Example:

```json
{
    "entity": true,
    "object": true,
    "acl": true,
    "tab": true,
    "importable": true
}
```

### clientDefs

[Reference](metadata/client-defs.md)

File: `custom/Espo/Modules/MyModule/Resources/metadata/clientDefs/MyEntity.json`

Defines entity type parameters for the frontend.

Example:

```json
{
    "controller": "controllers/record"
}
```

Without the *controller* parameter the entity type won't be available in the frontend. *controllers/record* is a build-in standard CRUD controller in the frontend.

## Entity class

File: `custom/Espo/Modules/MyModule/Entities/MyEntity.php`

Example:

```php
<?php
namespace Espo\Modules\MyModule\Entities;

use Espo\Core\ORM\Entity;
use Espo\Core\Field\LinkMultiple;
use Espo\Core\Field\DateTime;

class MyEntity extends Entity
{
    // Highly recommended to define the name in the ENTITY_TYPE constant.
    public const ENTITY_TYPE = 'MyEntity';

    // Not necessary but may be useful for business logic code.
    public const STATUS_DRAFT = 'Draft';
    public const STATUS_STARTED = 'Started';
    public const STATUS_COMPLETED = 'Completed';
    public const STATUS_CANCELED = 'Canceled';

    // Getter and setters are not necessary
    // but may be useful for business logic code.

    public function getName(): string
    {
        return $this->get('name');
    }

    public function setName(string $name): self
    {
        $this->set('name', $name);

        return $this;
    }

    public function getStatus(): string
    {
        return $this->get('status');
    }

    public function setStatus(string $status): self
    {
        $this->set('status', $status);

        return $this;
    }

    public function getAssignedUserId(): ?string
    {
        $this->get('assignedUserId');

        return $this;
    }

    public function setAssignedUserId(?string $assignedUserId): self
    {
        $this->set('assignedUserId', $assignedUserId);

        return $this;
    }

    public function getTeams(): LinkMultiple
    {
        /** @var LinkMultiple */
        return $this->getValueObject('teams');
    }

    public function setTeams(LinkMultiple $teams): self
    {
        $this->setValueObject('teams', $teams);

        return $this;
    }

    public function getCreatedAt(): DateTime
    {
        /** @var DateTime */
        $this->getValueObject('createdAt');

        return $this;
    }
}
```

## Controller class

File: `custom/Espo/Modules/MyModule/Controllers/MyEntity.php`

A Controller class is needed if you need to have CRUD operations available via the API. That includes the frontend, as the frontend communicates with the backend via the API.

Example:

```php
<?php
namespace Espo\Modules\MyModule\Controllers;

use Espo\Core\Controllers\Record;

// Just extend the standard CRUD controller.
// No more methods are needed.
class MyEntity extends Record
{}
```

## Layouts

Location: `custom/Espo/Modules/MyModule/Resources/layouts/MyEntity`

### detail

File: `custom/Espo/Modules/MyModule/Resources/layouts/MyEntity/detail.json`

Example:

```json
[
    {
        "rows": [
            [
                {"name": "name"}, {"name": "status"}
            ]
        ]
    },
]
```

The same for *detailSmall.json*.

### list

File: `custom/Espo/Modules/MyModule/Resources/layouts/MyEntity/list.json`

Example:

```json
[
    {"name": "name", "link": true},
    {"name": "status", "width": 40}
]
```

The same for *listSmall.json*.

### filters

File: `custom/Espo/Modules/MyModule/Resources/layouts/MyEntity/filters.json`

Example:

```json
[
    "status",
    "assignedUser",
    "teams"
]
```

## Translations

### Global

File: `custom/Espo/Modules/MyModule/Resources/i18n/en_US/Global.json`

```json
{
    "scopeNames": {
        "MyEntity": "My Entity"
    },
    "scopeNamesPlural": {
        "MyEntity": "My Entities"
    }
}
```

### Entity

File: `custom/Espo/Modules/MyModule/Resources/i18n/en_US/MyEntity.json`

```json
{
    "labels": {
        "Create MyEntity": "Create My Entity"
    },
    "fields": {
        "name": "Name",
        "status": "Status",
        "assignedUser": "Assigned User",
        "teams": "Teams",
        "createdAt": "Created At"
    },
    "links": {
        "assignedUser": "Assigned User",
        "teams": "Teams"
    },
    "options": {
        "status": {
            "Draft": "Draft",
            "Started": "Started",
            "Completed": "Completed",
            "Canceled": "Canceled"
        }
    }
}
```
