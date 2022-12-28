# app > rebuild

## actionClassNameList

*class-string<Espo\Core\Rebuild\RebuildAction>*

Array of class names. Actions being processed when the application is being rebuilt. Must implement `Espo\Core\Rebuild\RebuildAction` interface.

**Important**: Use `"__APPEND__"` item in the beginning of the array when extening.
