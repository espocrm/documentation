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
  ],
```

## Trace printing

Prints a backtrace when an exception is occurred. Note that in some cases an exception is caught and handled within the application, the trace won't be printed in this case.

!!! warning

    It is not recommended to enable trace printing on the production environment, as it may expose sensitive data to the log. In PHP 8.2 this problem is supposed to be solved.

## SQL queries

*As of v7.4.*

!!! note

    Not to be enabled on production.

If the parameter *sql* is set to true, all executed SQL queries will be printed to the log. Requires *INFO* or *DEBUG* level. 

If *sql* is set to true, and the log level is *NOTICE* or higher, than only failed queries will be logged. As of v8.2.

## Handlers

*As of v6.1.*

EspoCRM uses [Monolog](https://github.com/Seldaek/monolog) library for logging.
The library is shipped with a set of handlers.
There is the ability to specify which handlers to use in Espo.

In `data/config.php`:

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

Note that it's possible to have multiple handlers.

It's possible to specify either a handler class name or loader class name.
A loader class instantiates a handler class. 
This allows to initialize constructor parameters for a handler. It can be helpful if you need to pass some object to the handler constructor.
A loader class must implement `Espo\Core\Log\HandlerLoader` interface. It's possible to pass dependencies (via DI mechanism) to a loader class.

!!! note

    By specifying `handlerList` in the config, the default handler stops from being used.

You can find the list of handlers supported by Monolog [here](https://github.com/Seldaek/monolog/tree/main/src/Monolog/Handler).
