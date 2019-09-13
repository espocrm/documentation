# Custom CSS file

Create a file `custom/Espo/Custom/Resources/metadata/app/client.json`.

```json
{
    "cssList": [
        "path/to/your/file.css"
    ]
}
```

Make sure the css file is readable by a webserver. It's recommended to put it in `client/custom/css/` or `client/modules{module_name}/css/` directoty. 

Then clear cache.
