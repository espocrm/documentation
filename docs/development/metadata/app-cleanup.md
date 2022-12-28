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

## className

*class-string<Espo\Core\Cleanup\Cleanup\>*

An implementation class. Should implement `Espo\Core\Cleanup\Cleanup` interface.
