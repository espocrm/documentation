# ORM (Cum să gestionați Entități)

EspoCRM are propriul ORM (Object-relational mapping). Este ușor de creat, actualizat, citit, șters și pentru a căuta entități. Toate aceste operații sunt disponibile prin obiectul Managerului de Entități. Managerul de Entități este disponibil în înregistrările Servicilor prin metoda `#getEntityManager()`.

```php
$entityManager = $this->getEntityManager();
```

#### Creați o nouă entitate
```php
$account = $entityManager->getEntity('Account')
```
sau
```php
$account = $entityManager->getRepository('Account')->get();
```

#### Fetch cea existentî
```php
$account = $entityManager->getEntity('Account', $accountId);
```
sau
```php
$account = $entityManager->getRepository('Account')->get($accountId);
```

#### Obține valoare
```php
$fieldValue = $account->get('fieldName');
```

#### Are valoare
```php
$fieldNameIsSet = $account->has('fieldName'); // true or false
```

#### Setare valoare
```php
$account->set('fieldName', 'Test Account');
```

```php
$account->set(array(
  'name' => 'Test Account',
  'assignedUserId' => '1'
));
```

#### Stocare
```php
$entityManager->saveEntity($account);
```
sau
```php
$entityManager->getRepository('Account')->save($account);
```

#### Remove
```php
$entityManager->removeEntity($account);
```
sau
```php
$entityManager->getRepository('Account')->remove($account);
```

#### Găsește
```php
$accountList = $entityManager->getRepository('Account')->where(array(
    'type' => 'Customer',    
))->find();
```

Ordine descendentă:

```php
$accountList = $entityManager->getRepository('Account')->limit(0, 10)->order('createdAt', true)->find();
```

Ordine acendentă:
```php
$accountList = $entityManager->getRepository('Account')->limit(0, 10)->order('createdAt')->find();
```

sau:
```php
$accountList = $entityManager->getRepository('Account')->limit(0, 10)->order('createdAt', 'DESC')->find();
```

#### Găsește primul
```php
$account = $entityManager->getRepository('Account')->where(array(
    'type' => 'Customer',    
))->findOne();
```

#### Găsește asemnănător
```php
$opportunityList = $entityManager->getRepository('Account')->findRelated($account, 'opportunities');
```

#### Înlocuiește entitate
```php
$entityManager->getRepository('Account')->relate($account, 'opportunities', $opportunity);
```
sau
```php
$entityManager->getRepository('Account')->relate($account, 'opportunities', $opportunityId);
```

#### Entități neasemănătoare
```php
$entityManager->getRepository('Account')->unrelate($account, 'opportunities', $opportunity);
```
sau
```php
$entityManager->getRepository('Account')->unrelate($account, 'opportunities', $opportunityId);
```

