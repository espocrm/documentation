# app > cleanup

A Key-Value map. Defines cleaning up classes. Fired by the *Cleanup* job.

Example:

```json

{
    "someName": {
        "className": "Espo\\SomeImplementation"
    }
}
```

A class name should implement `Espo\Core\Cleanup\Cleanup` interface.
