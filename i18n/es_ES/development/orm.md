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
$account = $entityManager->getRepository('Cuenta')->get();
```

#### Obtener existente
```php
$account = $entityManager->getEntity('Cuenta', $accountId);
```
o
```php
$account = $entityManager->getRepository('Cuenta')->get($accountId);
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
$entityManager->getRepository('Cuenta')->save($account);
```

#### Remover
```php
$entityManager->removeEntity($account);
```
or
```php
$entityManager->getRepository('Cuenta')->remove($account);
```

#### Encontrar
```php
$accountList = $entityManager->getRepository('Cuenta')->where(array(
    'tipo' => 'Cliente',    
))->find();
```

Orden descendiente:
```php
$accountList = $entityManager->getRepository('Cuenta')->limit(0, 10)->order('creadoEn', true)->find();
```

Orden ascendente:
```php
$accountList = $entityManager->getRepository('Cuenta')->limit(0, 10)->order('creadoEn')->find();
```

o:
```php
$accountList = $entityManager->getRepository('Cuenta')->limit(0, 10)->order('creadoEn', 'DESC')->find();
```

#### Encontrar el primero
```php
$account = $entityManager->getRepository('Cuenta')->where(array(
    'tipo' => 'Cliente',    
))->findOne();
```

#### Encontrar relacionado
```php
$opportunityList = $entityManager->getRepository('Cuenta')->findRelated($account, 'oportunidades');
```

#### Entidades relacionadas
```php
$entityManager->getRepository('Cuenta')->relate($account, 'oportunidades', $opportunity);
```
or
```php
$entityManager->getRepository('Cuenta')->relate($account, 'oportunidades', $opportunityId);
```

#### Entidades no relacionadas
```php
$entityManager->getRepository('Cuenta')->unrelate($account, 'oportunidades', $opportunity);
```
or
```php
$entityManager->getRepository('Cuenta')->unrelate($account, 'oportunidades', $opportunityId);
```
