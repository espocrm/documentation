# ORM, Como gerir entidades e executar consultas

O EspoCRM possui o próprio ORM (Mapeamento objeto-relacional). É muito simples criar, atualizar, ler, excluir e pesquisar entidades. Todas estas operações disponíveis através do objeto EntityManager. EntityManager está disponível nos serviços de gravação pelo método `#getEntityManager()`.
```php
$entityManager = $this->getEntityManager();
```

#### Cria uma nova entidade
```php
$account = $entityManager->getEntity('Account')
```
ou
```php
$account = $entityManager->getRepository('Account')->get();
```

#### Fetch existente
```php
$account = $entityManager->getEntity('Account', $accountId);
```
ou
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

#### Definir valor
```php
$account->set('fieldName', 'Test Account');
```

```php
$account->set(array(
  'name' => 'Test Account',
  'assignedUserId' => '1'
));
```

#### Loja
```php
$entityManager->saveEntity($account);
```
ou
```php
$entityManager->getRepository('Account')->save($account);
```

#### Remove
```php
$entityManager->removeEntity($account);
```
ou
```php
$entityManager->getRepository('Account')->remove($account);
```

#### Encontra
```php
$accountList = $entityManager->getRepository('Account')->where([
    'type' => 'Customer'
])->find();
```

Ordem decrescente:

```php
$accountList = $entityManager->getRepository('Account')->limit(0, 10)->order('createdAt', true)->find();
```

Ordem ascendente:
```php
$accountList = $entityManager->getRepository('Account')->limit(0, 10)->order('createdAt')->find();
```

ou:
```php
$accountList = $entityManager->getRepository('Account')->limit(0, 10)->order('createdAt', 'DESC')->find();
```

#### Encontra o primeiro
```php
$account = $entityManager->getRepository('Account')->where([
    'type' => 'Customer',   
])->findOne();
```

#### Encontrar relacionados
```php
$opportunityList = $entityManager->getRepository('Account')->findRelated($account, 'opportunities');
```

#### Relacionar entidades
```php
$entityManager->getRepository('Account')->relate($account, 'opportunities', $opportunity);
```
ou
```php
$entityManager->getRepository('Account')->relate($account, 'opportunities', $opportunityId);
```

#### Entidades não relacionadas
```php
$entityManager->getRepository('Account')->unrelate($account, 'opportunities', $opportunity);
```
ou
```php
$entityManager->getRepository('Account')->unrelate($account, 'opportunities', $opportunityId);
```

### Selecionar Parâmetros de Consulta

#### Cláusula onde

##### Operadores de comparação

Operadores de comparação suportados: `>`, `<`, `>=`, `<=`, `=`, `!=`.

```
$opportunityList = $entityManager->getRepository('Opportunity')->where([
  'amount>=' => 100
])->find();
```

##### IN e NOT IN operadores

```
$opportunityList = $entityManager->getRepository('Opportunity')->where([
  'stage' => ['Closed Lost', 'Closed Won']
 ])->find();
```

```
$opportunityList = $entityManager->getRepository('Opportunity')->where([
  'stage!=' => ['Closed Lost', 'Closed Won']
])->find();
```

##### LIKE operatodores

Operadores suportados: 
* `*` - LIKE,
* `!*` -- NOT LIKE.

```
$opportunityList = $entityManager->getRepository('Opportunity')->where([
  'name*' => '%service%'
])->find();
```

##### OU, E operadores

```
$opportunityList = $entityManager->getRepository('Opportunity')->where([
  [
    'OR' => [
      ['stage' => 'Closed Won'],
      ['stage' => 'Closed Lost']
    ],
    'AND' => [
      'amountConverted>' => 100,
      'amountConverted<=' => 999
    ]
  ]
])->findOne();
```

#### Distito

```
$opportunityList = $entityManager->getRepository('Opportunity')->distinct()->where(...)->find();
```

#### Junta-te

```
$contactList = $entityManager->getRepository('Contact')->distinct()->join('opportunities')->where([
  'opportunities.stage' => 'Closed Won'
])->find();
```

```
$contactList = $entityManager->getRepository('Contact')
->distinct()->leftJoin('opportunities')->where(...)->find();
```

```
$contactList = $entityManager->getRepository('Contact')
->distinct()
->join(['opportunities', 'aliasForJoinedTable'])
->where([
  'aliasForJoinedTable.stage' => 'Closed Won'
])->find();
```

#### Agrupar Por

```
$selectParams = [
  'select' => ['MONTH:closeDate', 'SUM:amountConverted']
  'groupBy' => ['MONTH:closeDate'],
  'whereClause' => [
    'stage' => 'Closed Won'
  ],
  'orderBy' => 1 // ordenar pela primeira coluna
];

// aplicando juntas à esquerda para conversão de moeda
$this->getEntityManager()->getRepository('Opportunity')->handleSelectParams($selectParams);

$pdo = $this->getEntityManager()->getPDO();
$sql = $this->getEntityManager()->getQuery()->createSelectQuery('Opportunity', $selectParams);
$sth = $pdo->prepare($sql);
$sth->execute();

// resultados
$rowList = $sth->fetchAll(\PDO::FETCH_ASSOC); 
```
