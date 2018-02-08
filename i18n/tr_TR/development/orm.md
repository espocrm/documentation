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

#### Get value
```php
$fieldValue = $account->get('fieldName');
```

#### Has value
```php
$fieldNameIsSet = $account->has('fieldName'); // true or false
```

#### Set value
```php
$account->set('fieldName', 'Test Account');
```

```php
$account->set(array(
  'name' => 'Test Account',
  'assignedUserId' => '1'
));
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
$accountList = $entityManager->getRepository('Account')->where(array(
    'type' => 'Customer',    
))->find();
```

Descending order:

```php
$accountList = $entityManager->getRepository('Account')->limit(0, 10)->order('createdAt', true)->find();
```

Ascending order:
```php
$accountList = $entityManager->getRepository('Account')->limit(0, 10)->order('createdAt')->find();
```

or:
```php
$accountList = $entityManager->getRepository('Account')->limit(0, 10)->order('createdAt', 'DESC')->find();
```

#### Find the first one
```php
$account = $entityManager->getRepository('Account')->where(array(
    'type' => 'Customer',    
))->findOne();
```

#### Find related
```php
$opportunityList = $entityManager->getRepository('Account')->findRelated($account, 'opportunities');
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

