# Attachments

## Attachment entity

Attachments are records that represent stored files. These files can be attachments in a stream notes, email attachments, documents, etc.

Example:

```php
<?php
namespace Espo\Modules\MyModule;

use Espo\ORM\EntityManager;
use Espo\Core\Exceptions\NotFound;
use Espo\Entities\Attachment;

class MyService
{
    public function __construct(
        private EntityManager $entityManager,
    ) {}

    public function process(string $id): void
    {
        $attachment = $this->entityManager
            ->getRDBRepositoryByClass(Attachment::class)
            ->getById($id);

        if (!$attachment) {
            throw new NotFound();
        }

        $name = $attachment->getName();
        $size = $attachment->getSize();
        $type = $attachment->getType();
    }
}
```

### Fields

* name – a file name;
* size – a size;
* type – a mime type;
* parent – a linked record an attachment is related to; used for Attachment-Multiple fields;
* related – a linked record an attachment is related to; used for File, Image fields, for inline attachments;
* field – a field an attachment is related through;
* role – a role, e.g. Attachment, Inline Attachment, Export File.
* sourceId – an original attachment reference; multiple attachments can refer to one file.

## File Storage Manager

The class: `Espo\Core\FileStorage\Manager`.

An access point for file storing and fetching. Files are represented as Attachment entities. Note that different attachments can be stored in different storages (for example, in local folder, AWS S3). The Manager abstracts away
how the file is stored.

Usage example:

```php
<?php
namespace Espo\Modules\MyModule;

use Espo\ORM\EntityManager;
use Espo\Core\FileStorage\Manager;
use Espo\Core\Exceptions\NotFound;
use Espo\Entities\Attachment;

class MyService
{
    public function __construct(
        private EntityManager $entityManager,
        private Manager $fileStorageManager,
    ) {}

    public function read(string $id): string
    {
        $attachment = $this->entityManager
            ->getRDBRepositoryByClass(Attachment::class)
            ->getById($id);

        if (!$attachment) {
            throw new NotFound();
        }

        return $this->fileStorageManager->getContents($attachment);
    }

    public function store(string $contents): string
    {
        $attachment = $this->entityManager
            ->getRDBRepositoryByClass(Attachment::class)
            ->getNew();

        $attachment->setName('file.txt');
        $attachment->setType('text/plain');

        $this->entityManager->saveEntity($attachment);
        $this->fileStorageManager->putContents($attachment, $contents);

        return $attachment->getId();
    }
}
```

Available methods:

* exists – check whether a file exists;
* getSize – get a file size;
* getContents – get a string;
* getStream – get a PSR-7 stream;
* putContents – put a PSR-7 stream;
* putStream – put a string;
* unlink – remove from a storage.
