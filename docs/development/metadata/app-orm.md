# app > orm

Path: metadata > app > orm.

Definitions for [ORM](../orm.md).

Example:

```json
{
    "functionConverterClassNameMap_Mysql": {
        "ABS": "Espo\\Core\\ORM\\QueryComposer\\Part\\FunctionConverters\\Abs"
    },
    "queryComposerClassNameMap": {
        "Mysql": "Espo\\ORM\\QueryComposer\\MysqlQueryComposer"
    },
    "pdoFactoryClassNameMap": {
        "Mysql": "Espo\\ORM\\PDO\\MysqlPDOFactory"
    }
}
```


## queryComposerClassNameMap

*Object.<string, class-string<Espo\ORM\QueryComposer\QueryComposer\>\>*

Query composers for platforms.


PDO factories for platforms.

## pdoFactoryClassNameMap

*Object.<string, class-string<Espo\ORM\PDO\PDOFactory\>\>*


*As of v7.4.*

PDO factories for platforms.

## functionConverterClassNameMap_{platform}

*Object.<string, class-string<Espo\ORM\QueryComposer\Part\FunctionConverter\>\>*

[Complex expression](../../user-guide/complex-expressions.md) function converters. Use it to define custom complex expression functons.
