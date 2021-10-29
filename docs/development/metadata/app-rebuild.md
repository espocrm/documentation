# app > rebuild

## actionClassNameList

Array of class names. Actions being processed when the application is being rebuilt. Must implement `Espo\Core\Rebuild\RebuildAction` interface.

**Important**: Need to have `"__APPEND__"` item in the beginning of the array when extening.
