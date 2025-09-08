# Log

## Default log

By default, log files are created in `{ESPO_ROOT}/data/logs/` directory.

## Parameters

In `data/config-internal.php`:

```
'logger' => [
  'level' => 'NOTICE', // DEBUG, INFO, NOTICE, WARNING, ERROR
  'maxFileNumber' => 30,
  'printTrace' => true, // to print an exception backtrace,
  'sql' => true, // log SQL queries
  'databaseHandler' => true, // the log will be available in the UI
  'databaseHandlerLevel' => 'NOTICE', // overrides the level for the database handler
],
```

## Trace printing

Prints a backtrace when an exception is occurred. Note that in some cases an exception is caught and handled within the application, the trace won't be printed in this case.

!!! warning

    It is not recommended to enable trace printing on the production environment, as it may expose sensitive data to the log.

## Admin UI

*As of v8.3.*

It may be convenient to check the logs right from the application UI. The log is available under: Administration > App Log. By default, it's disabled – no log entries are created.

To make log records available in the admin UI, set the *databaseHandler* parameter to true. 

!!! note

    Some log entries may be not available from the UI. For example, those that happened during upgrade or before database connection was established.

## SQL queries

*As of v7.4.*

!!! note

    Not to be enabled on production.

If the parameter *sql* is set to true, all executed SQL queries will be printed to the log. Requires *INFO* or *DEBUG* level. 

If *sql* is set to true, and the log level is *NOTICE* or higher, than only failed queries will be logged. As of v8.2.

## Handlers

EspoCRM uses [Monolog](https://github.com/Seldaek/monolog) library for logging. The library is shipped with many handlers. Developer can also create custom handlers.

It's possible to configure the list of handlers Espo should use for logging.

In `data/config-internal.php`:

```
'logger' => [
  'level' => 'NOTICE',
  'handlerList' => [
    [
      'className' => 'Espo\\Core\\Log\\Handler\\EspoRotatingFileHandler',
      'params' => [
        'filename' => 'data/logs/espo.log',
      ],
      'level' => 'NOTICE',
      'formatter' => [
        'className' => 'Monolog\\Formatter\\LineFormatter',
        'params' => [
          'dateFormat' => 'Y-m-d H:i:s',
        ],
      ],
    ],
    [
      'loaderClassName' => 'Espo\\Core\\Log\\EspoRotatingFileHandlerLoader',
      'params' => [
        'filename' => 'data/logs/test-warning.log',
      ],
      'level' => 'WARNING',
    ],
  ],
],
```

Handlers can be defined with a handler class name or a loader class name. A loader class instantiates a handler class.
This allows to initialize constructor parameters for a handler. It can be helpful if you need to pass some object to the handler constructor.
A loader class must implement `Espo\Core\Log\HandlerLoader` interface. It's possible to pass dependencies (via DI mechanism) to the loader.

!!! note

    By specifying `handlerList` in the config, the default handler stops from being used.

You can find the list of handlers supported by Monolog [here](https://github.com/Seldaek/monolog/tree/main/src/Monolog/Handler).
