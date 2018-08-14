# REST API

EspoCRM é um aplicativo de página única para que um frontend use a API REST para se conectar a um backend.
Todas as operações que você executa usando UI você pode implementar através de chamadas de API usando seu idioma de programação.
Você pode aprender como funciona a API se você rastrear o que está acontecendo na guia de rede no console do navegador.

A maioria das funções api retorna JSON. As chamadas POST, PATCH geralmente precisam de alguns dados JSON na carga útil.

O URL básico da API EspoCRM é: `api/v1/`. Você precisa compará-lo com as expressões nesta referência. Exemplo:

`OBTER http://your_domain/api/v1/Contact/55643ca033f7ab4c5`.

## Autenticação

A API do EspoCRM usa [Autenticação Básica](http://en.wikipedia.org/wiki/Basic_access_authentication). Nome de usuário e senha/token são passados pelo cabeçalho 'Autorização' codificado em base64.

`"Autorização: Básico " + base64Encode(usuário  + ':' + senha)`

É melhor usar o token de autenticação em vez da senha quando você trabalha com api. Neste caso, você precisará fornecer nome de usuário e senha/token no cabeçalho `Espo-Autorization`.
```
"Espo-Authorization: " + base64Encode(username  + ':' + passwordOrToken)
```
1. Obter token de acesso pela solicitação 'OBTER App/usuário' com nome de usuário e senha passados no cabeçalho `Espo-Autorization`.
2. Use este token em vez de senha no cabeçalho `Espo-Authorization` para todas as solicitações adicionais.
3. Se o erro do pedido retornar 403 significa que o nome de usuário/senha é errado ou o token já não é válido.

#### Token de Autenticação / Dados Específicos do Usuário

`OBTER App/usuário`

Retorna:

* `token` - token de acesso para usar;
* `acl` - informações sobre acesso de usuários;
* `preferências` - preferências de usuário;
* `usuário` - atributos de registro de usuário.


## CRUD Operações

#### Entidades de Lista

`OBTER {entidadeTipo}`

OBTER parâmetros:

* `offset` - (int) offset;
* `maxSize` - (int) tamanho máximo;
* `onde` - (array) filtros;
* `sortBy` - (string) campo para classificar por;
* `asc` - (bool) direção de classificação.

_Exemplo_
`OBTER Conta?offset=0&maxSize=20``

Retorna:
```
{
  "lista": [... variedade de registros...],
  "total": {totalCountOfRecords}
}
```

#### Ler Entidade

`OBTER {entidadeTipo}/{id}`

Retorna atributos no objeto JSON.

_Exemplo_

`OBTER Conta/5564764442a6d024c`

#### Criar Entidade

`POST {entidadeTipo}`

Carga útil: atributos de objeto de entidade.

Retorna os atributos da entidade no objeto JSON.

_Exemplo_

`POST Conta`

Carga útil:
```
{
  "nome": "Teste",
  "assignedUserId": "1"
}
```

#### Entidade de atualização

`REMENDO {entityType}/{id}`

ou

`COLOCAR {entidadeTipo}/{id}`

Carga útil: os atributos do objeto de entidade precisam ser alterados.

Retorna atributos no objeto JSON.

_Exemplo_

`REMENDO Conta/5564764442a6d024c`

Carga útil:
```
{
  "assignedUserId": "1"
}
```

#### Eliminar Entidade

`Eliminar {entidadeTipo}/{id}`

_Exemplo_

`ELIMINAR Conta/5564764442a6d024c`


## Entidades Relacionadas

#### Entidades Relacionadas à Lista

`OBTER {entidadeTipo}/{id}/{link}`

* `offset` - (int) offset;
* `maxSize` - (int) tamanho máximo;
* `onde` - (array) filtros;
* `ordenarPor` - (string) campo para classificar por;
* `asc` - (bool) direção de classificação.

_Exemplo_

`OBTER Conta/5564764442a6d024c/oportunidades`

Retorna:
```
{
  "lista": [... variedade de registros...],
  "total": {totalCountOfRecords}
}
```

#### Link Entidade

`POST {entidadeTipo}/{id}/{link}`

Carga útil:

1. `id` atributo.
2. `ids` atributo de matriz.
3. `"massRelate": verdade` e `"onde": {...}` relacionar registros múltiplos por critérios de pesquisa.

_Exemplo_

`POST Conta/5564764442a6d024c/oportunidades`

Carga útil:
```
{
  "id": "55646fd85955c28c5"
}
```

#### Entidade Desvinculada

`EXCLUIR {entidadeTipo}/{id}/{link}`

Carga útil:

1. JSON with `id` attribute.
2. JSON with `ids` array attribute.

_Exemplo_

`EXCLUIR Conta/5564764442a6d024c/oportunidades`

Carga útil:
```
{
  "id": "55646fd85955c28c5"
}
```

## Stream

#### Lista de entradas de Stream luxo para o usuário atual

`OBTER Stream`

OBTER parâmetros:

* `offset` - (int) offset;
* `maxSize` - (int) tamanho máximo;

#### Lista de entradas de Stream relacionadas a uma gravação específica

`OBTER {entidadeTipo}/{id}/stream`

OBTER parâmetros:

* `offset` - (int) offset;
* `maxSize` - (int) tamanho máximo;

#### Acompanhe o registro

`COLOCA {entidadeTipo}/{id}/inscrição`

#### Desativar registro

`ELIMINAR {entidadeTipo}/{id}/inscrição`



