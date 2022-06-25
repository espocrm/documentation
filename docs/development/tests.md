# Tests

Before running tests, you need to build for testing:

```
grunt test
```

This will build an inctance for integration tests and install phpunit (from require-dev).

## Unit tests

Command to run:

```
vendor/bin/phpunit
```

## Integration tests

Create a database for testing.

Create a config file  `tests/integration/config.php`:

```php
<?php
return [
    'database' => [
        'driver' => 'pdo_mysql',
        'host' => 'localhost',
        'port' => '',
        'charset' => 'utf8mb4',
        'dbname' => 'TEST_DATABASE_NAME',
        'user' => 'DATABASE_USER',
        'password' => 'DATABASE_PASSWORD',
    ],
];
```

This config will be used for test instances that are built for each test.

Command to run:
```
vendor/bin/phpunit tests/integration
```

## Static analysys

Command to run:

```
vendor/bin/phpstan
```
