# Log

## Default Espo log

By default log files are created in `{ESPO_ROOT}/data/logs/` directory.

## Handlers

Actual as of v6.1.

EspoCRM uses [Monolog](https://github.com/Seldaek/monolog) library for logging.
The library is shipped with the set of handlers.
There is the ability to specify which handlers to use in Espo.

In config:

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

It's possible to specify either a handler class name or loader class name.
A loader class instantiates a handler class. 
This allows to initialize constructor parameters for a handler. It can be helpful if you need to pass some object to the handler constructor.
It's possible to pass dependencies to a loader class.

Note: By specifying `handlerList` in the config, the default handler stops from being used.
