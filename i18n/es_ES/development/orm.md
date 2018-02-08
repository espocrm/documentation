# ORM (Cómo Administrar Entidades)

EspoCRM tiene su propio ORM incorporado (mapeo relacional de objetos). Es muy simple crear, actualizar, leer, eliminar y buscar entidades. Todas estas operaciones están disponibles a través del objeto Administrador de Entidades. Administrador de Entidades está disponible en Servicios de registro por el método `#getEntityManager()`.

```php
$entityManager = $this->getEntityManager();
```

#### Crear nueva entidad
```php
$account = $entityManager->getEntity('Cuenta')
```
o
```php
$account = $entityManager->getRepository('Account')->get();
```

#### Obtener existente
```php
$account = $entityManager->getEntity('Account', $accountId);
```
o
```php
$account = $entityManager->getRepository('Account')->get($accountId);
```

#### Obtener valor
```php
$fieldValue = $account->get('nombreCampo');
```

#### Tiene valor
```php
$fieldNameIsSet = $account->has('nombreCampo'); // verdadero o falso
```

#### Ajustar valor
```php
$account->set('nombreCampo', 'Probar Cuenta');
```

```php
$account->set(array(
  'nmbre' => 'Probar Cuenta',
  'idAsignadoUsuario' => '1'
));
```

#### Almacenar
```php
$entityManager->saveEntity($account);
```
or
```php
$entityManager->getRepository('Account')->save($account);
```

#### Remover
```php
$entityManager->removeEntity($account);
```
or
```php
$entityManager->getRepository('Account')->remove($account);
```

#### Encontrar
```php
$accountList = $entityManager->getRepository('Account')->where(array(
    'tipo' => 'Cliente',    
))->find();
```

Orden descendiente:
```php
$accountList = $entityManager->getRepository('Account')->limit(0, 10)->order('creadoEn', true)->find();
```

Orden ascendente:
```php
$accountList = $entityManager->getRepository('Account')->limit(0, 10)->order('creadoEn')->find();
```

o:
```php
$accountList = $entityManager->getRepository('Account')->limit(0, 10)->order('creadoEn', 'DESC')->find();
```

#### Encontrar el primero
```php
$account = $entityManager->getRepository('Cuenta')->where(array(
    'tipo' => 'Cliente',    
))->findOne();
```

#### Encontrar relacionado
```php
$opportunityList = $entityManager->getRepository('Account')->findRelated($account, 'oportunidades');
```

#### Entidades relacionadas
```php
$entityManager->getRepository('Account')->relate($account, 'oportunidades', $opportunity);
```
or
```php
$entityManager->getRepository('Account')->relate($account, 'oportunidades', $opportunityId);
```

#### Entidades no relacionadas
```php
$entityManager->getRepository('Account')->unrelate($account, 'oportunidades', $opportunity);
```
or
```php
$entityManager->getRepository('Account')->unrelate($account, 'oportunidades', $opportunityId);
```
