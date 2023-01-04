# app > database

Path: metadata > app > database.

## dbalConnectionFactoryClassNameMap

*Object.<string, class-string<Espo\Core\Utils\Database\DBAL\ConnectionFactory\>\>*

*As of v7.4.*

DBAL connection factories for platforms.

```json
{
    "dbalConnectionFactoryClassNameMap": {
        "Mysql": "Espo\\Core\\Utils\\Database\\DBAL\\Factories\\MysqlConnectionFactory",
        "Postgresql": "Espo\\Core\\Utils\\Database\\DBAL\\Factories\\PostgresqlConnectionFactory"
    }
}
```
