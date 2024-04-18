# File Storage

By default, all uploaded files (attachments) are stored in `data/upload` directory. EspoCRM is shipped with AWS S3 support.
Developers can add other providers by implementing `Espo\Core\FileStorage\Storage` interface.

When switching to an external file storage, it's recommended to disable caching for image thumbs by setting in `data/config.php`:

```
'thumbImageCacheDisabled' => true,
```

## AWS S3

Parameters need to be set in `data/config-internal.php`:

```
  'awsS3Storage' => [
    'bucketName' => 'BUCKET_NAME',
    'path' => 'OPTIONAL_PATH_WHERE_FILES_WILL_BE_STORED',
    'credentials' => [
      'key' => 'KEY',
      'secret' => 'SECRET',
    ],
    'region' => 'YOUR_REGION',
  ],
```

In `data/config.php`:

```
  'defaultFileStorage' => 'AwsS3',
```

Credentials can be omitted, then they will be read from the environment.

It's possible to use non-AWS S3 endpoints with the `endpoint` parameter (as of v8.1). Then, for some providers, you also need to add the parameter `pathStyleEndpoint` set to *true* to use path styled endpoints. The `sendChunkedBody` boolean parameter set to *false* may be needed for some providers that do not support splitting content in chunks.

## Moving existing attachments

After setting up a file storage, all existing attachments will still be stored locally in `data/upload` directory. You can move them manually to the storage and then execute the following SQL query:

```sql
UPDATE `attachment` SET `storage` = '{StorageName}'
```

where *{StorageName}* is a name of the storage, e.g. `AwsS3`.
