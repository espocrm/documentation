# Custom CSS file

Create a file `custom/Espo/Custom/Resources/metadata/app/client.json`.

```json
{
    "cssList": [
        "__APPEND__",
        "path/to/your/file.css"
    ]
}
```

Make sure the CSS file is readable by the webserver. It's recommended to put it in `client/custom/css/` or `client/custom/modules/{module-name}/css/` directory. 

Then clear cache.
