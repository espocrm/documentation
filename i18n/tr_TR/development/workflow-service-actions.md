# İş Akışı için özel hizmet işlemi eklemek

İş akışları, özel hizmet eylemleri oluşturmanıza olanak tanımaktadır. Bu örnekte, bunun bir Arama öğesi için nasıl yapılacağı gösterilecektir.

## 1. Adım: Hizmet Sınıfı Oluşturun

```php
<?php
 
namespace Espo\Custom\Services;
 
use \Espo\ORM\Entity;
 
class TestService extends \Espo\Core\Services\Base
{
    public function testServiceAction($workflowId, Entity $entity, $additionalParameters = null)
    {
        // your code here
    }
}
```

## 2. Adım: Meta verilerde çalışma hizmeti yöntemini tanımlayın

Dosyayı oluştur/düzenle `custom/Espo/Custom/Resources/metadata/entityDefs/Workflow.json`

```json
{
    "serviceActions": {
        "Call":{
            "testServiceAction": {
                "serviceName": "TestService",
                "methodName": "testServiceAction"
            }
        }
    }
}
```
Not: Meta veri dosyası olan Workflow.json dosyasını modül dizininizde de oluşturabilirsiniz.

## 3. Adım: Etiket Eklemek

Dosyayı ekleyin veya (varsa) düzenleyin `custom/Espo/Custom/Resources/i18n/en_US/Workflow.json`.

```json
{
    "serviceActions": {
        "testServiceAction": "Label for TestServiceAction"
    }
}
```
Ya da birkaç varlık türü için aynı yöntem adına sahipseniz, onlar için farklı çeviri tanımlayabilirsiniz.

```json
{
    "serviceActions": {
        "CallTestServiceAction": "Label for Call TestServiceAction",
        "TaskTestServiceAction": "Label for Task TestServiceAction"
    }
}
```
Not: Modül dizininizde dil dosyası olarak Workflow.json dosyası da oluşturabilirsiniz.

## 4. Adım: Kullanım ipuçları ekleyin (isteğe bağlı)

Dosyayı ekle veya düzenle `custom/Espo/Custom/Resources/i18n/en_US/Workflow.json`.

```json
{
    "serviceActionsHelp": {
        "testServiceAction": "This is a description of testServiceAction action"
    }
}
```
Veya birkaç varlık türü için aynı yöntem adına sahipseniz, onlar için farklı ipuçları tanımlayabilirsiniz.

```json
{
    "serviceActionsHelp": {
        "CallTestServiceAction": "This is a description of TestServiceAction for Call entity",
        "TaskTestServiceAction": "This is a description of TestServiceAction for Task entity"
    }
}
```

## 5. Adım: Önbelleği Temizle

Yönetim paneli>Önbelleği Temizle. Artık, hizmet eylemi, Hizmet Çalıştırma İşlemi formunda İş Akışları için kullanılabilir.
