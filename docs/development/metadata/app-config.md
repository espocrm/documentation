# app > config

Path: metadata > app > config.

Application config definitions.

## params

*Object.<string, Object\>\>*

Parameters. A name => params map.

Example:

```json
{

    "params": {
        "myParam": {
            "level": "default",
            "readOnly": true
        }
        "smtpPassword": {
            "level": "internal"
        },
        "awsS3Storage": {
            "level": "system"
        }
    }
}
```

### level

*string*

Defines availability of the config parameter in the front-end. Possible values:

* `default` – available for logged-in users (applied by default) (as of v7.4);
* `global` – available even before logging in (value is exposed to the world);
* `system` – never available;
* `internal` – never available for read, admin can write (useful for passwords, secrets) (as of v7.3);
* `admin` – available only for admin;
* `superAdmin` – available only for super-admin.

### readOnly

*boolean*

*As of v7.4.*

Disables the ability to change a parameter value for admin users. Useful for parameters that are supposed to be set either manually by writting into the config file or automatically by the application. 

## entityTypeListParamList

*string[]*

A list of config parameters values of which are arrays of entity types. Needed to let the application know what params need to be filtered to remove entity types not available for a user.
