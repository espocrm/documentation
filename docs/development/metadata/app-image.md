# app > image

Path: metadata > app > image.

## allowedFileTypeList

*string[]*

A list of allowed image mime types. Use `__APPEND__` for extending.

## resizableFileTypeList

*string[]*

A list of image mime types that can be resized to be served in a smaller size. Use `__APPEND__` for extending.

## fixOrientationFileTypeList

*string[]*

A list of image mime types orientation of which can be fixed using exif data.

## previewFileTypeList

*string[]*

A list of image mime types that can be previewed in the File or Attachment-Multiple fields.

## sizes

*Object*

Size dimensions.

Example:

```json
{
    "sizes": {
        "xxx-small": [18, 18],
        "xx-small": [32, 32],
        "x-small": [64, 64],
        "small": [128, 128],
        "medium": [256, 256],
        "large": [512, 512],
        "x-large": [864, 864],
        "xx-large": [1024, 1024],
        "small-logo": [181, 44]
    }
}
```
