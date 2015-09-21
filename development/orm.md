# ORM (How to Manage Entities)

EspoCRM has built-in own ORM (Object-relational mapping). It’s very simple to create, update, read, delete and search entities. All these operations available through EntityManager object. EntityManager is available in record Services by method `#getEntityManager()`.

```php
$entityManager = $this->getEntityManager();
```

#### Create new entity
```php
$account = $entityManager->getEntity('Account')
```
or
```php
$account = $entityManager->getRepository('Account')->get();
```

#### Fetch existing
```php
$account = $entityManager->getEntity('Account', $accountId);
```
or
```php
$account = $entityManager->getRepository('Account')->get($accountId);
```

#### Store
```php
$entityManager->saveEntity($account);
```
or
```php
$entityManager->getRepository('Account')->save($account);
```

#### Remove
```php
$entityManager->removeEntity($account);
```
or
```php
$entityManager->getRepository('Account')->remove($account);
```

#### Find
```php
$entityManager->getRepository('Account')->where(array(
    'type' => 'Customer',    
))->find();
```
```php
$entityManager->getRepository('Account')->limit(0, 10)->order('createdAt', 'DESC')->find();
```

#### Find the first one
```php
$entityManager->getRepository('Account')->where(array(
    'type' => 'Customer',    
))->findOne();
```

#### Find related
```php
$entityManager->getRepository('Account')->findRelated($account, 'opportunities');
```

#### Relate entities
```php
$entityManager->getRepository('Account')->relate($account, 'opportunities', $opportunity);
```
or
```php
$entityManager->getRepository('Account')->relate($account, 'opportunities', $opportunityId);
```

#### Unrelate entities
```php
$entityManager->getRepository('Account')->unrelate($account, 'opportunities', $opportunity);
```
or
```php
$entityManager->getRepository('Account')->unrelate($account, 'opportunities', $opportunityId);
```

