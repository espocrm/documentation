# Log

## Default log

By default log files are created in `{ESPO_ROOT}/data/logs/` directory.

## Parameters

In `data/config.php` (or `data/config-internal.php`):

```
  'logger' => [
    'level' => 'NOTICE', // DEBUG, INFO, NOTICE, WARNING, ERROR
    'maxFileNumber' => 30,
    'printTrace' => true, // to print an exception backtrace
  ],
```

## Handlers

Actual as of v6.1.

EspoCRM uses [Monolog](https://github.com/Seldaek/monolog) library for logging.
The library is shipped with the set of handlers.
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

Note: By specifying `handlerList` in the config, the default handler stops from being used.

You can find the list of handlers supported by Monolog [here](https://github.com/Seldaek/monolog/tree/main/src/Monolog/Handler).
