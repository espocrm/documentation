# app > orm

Path: metadata > app > orm.

Definitions for [ORM](../orm.md).

Example:

```json
{
    "platforms": {
        "Mysql": {
            "queryComposerClassName": "Espo\\ORM\\QueryComposer\\MysqlQueryComposer",
            "pdoFactoryClassName": "Espo\\ORM\\PDO\\MysqlPDOFactory",
            "functionConverterClassNameMap": {
                "ABS": "Espo\\Core\\ORM\\QueryComposer\\Part\\FunctionConverters\\Abs"
            }
        }
    }
}
```

## platforms

*As of v7.5.*

Definitions for database platforms.

### queryComposerClassName

class-string<Espo\ORM\QueryComposer\QueryComposer\>

A query composer.

### pdoFactoryClassName

class-string<Espo\ORM\PDO\PDOFactory\>

A PDO factory.

### functionConverterClassNameMap

*Object.<string, class-string<Espo\ORM\QueryComposer\Part\FunctionConverter\>\>*

[Complex expression](../../user-guide/complex-expressions.md) function converters. Use it to define custom complex expression functions.
