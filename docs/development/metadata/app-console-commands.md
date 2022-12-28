# app > consoleCommands

Path: metadata > app > consoleCommands.

Console [commands](../../administration/commands.md). A command-name => defs map.

Example:

```json
{
    "myCommand": {
        "className": "Espo\\Modules\\MyModule\\Classes\\ConsoleCommands\\MyCommand",
        "listed": true
    }
}

```

## className

*class-string<Espo\Core\Console\Command>*

A command class. Should implement `Espo\Core\Console\Command` interface.

## listed

*boolean*

Whether the command is listed when running `bin/command`.
