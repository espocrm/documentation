# Campos com Cálculos (Fórmulas)

No gestor de entidades é possível definir um script (fórmula) para entidades de tipos específicos. Esse script será executado todas as vezes antes do registro ser salvo. 
Ele garante a capacidade de automaticamente definir campos específicos (atributos) com valores derivados dos cálculos.

Para editar uma fórmula siga Administração > Gestor de Entidades > Menu deslizante à direita na linha da entidade desejada > Fórmula.

Tu também podes precisar de definir campos, que são supostamente para serem calculados, Somente de Leitura através do Gestor de Entidades.


## Sintaxe

A fórmula em EspoCRM é escrita numa única linguagem designada especificamente para esta característica.

Há operadores, atributos de funções e valores que podem ser usados nas fórmulas. Expressões separadas devem ser delimitadas por caracteres ';'.

### Operadores

* `=` - designação.
* `||` - é o OU lógico,
* `&&` - é o  E lógico,
* `!` - é o NÃO lógico,
* `+`- soma numérica,
* `-` - subtração numérica,
* `*` - multiplicação numérica,
* `/` - divisão numérica,
* `%` - módulo numérico,
* `==` - comparação de igualdade,
* `!=` - comparação de diferença,
* `>` - comparação de maior que,
* `<` - comparação de menor que,
* `>=` - comparação de maior que ou igual a,
* `<=` - comparação de menor que ou igual a.

Priority of operators:
* `=`;
* `||`, `&&`;
* `==`, `!=`, `>`, `<`, `>=`, `<=`;
* `+`, `-`;
* `*`, `/`, `%`.

### Atributos

Atributos representam campos de valores da entidade visada. Podes inserir atributos disponíveis ao clicar no botão mais.

É possível acessar atributos de entidades relacionadas com o formato seguinte: `linkName.attributeName`. 


### Funções

Formato de uso das funções: `groupName\functionName(argument1, argument2, ..., argumentN)`.

Funções fora-da-caixa estão listadas abaixo.

#### ifThenElse
`ifThenElse(CONDITION, CONSEQUENT, ALTERNATIVE)` Se a CONDITION está satisfeita, então faça CONSEQUENT. Se não está -- então faz ALTERNATIVE.

#### ifThen
`ifThen(CONDITION, CONSEQUENT)` Se a CONDITION está satisfeita, então faz CONSEQUENT. Se não está -- não faças nada.

#### string\concatenate(
`string\concatenate(STRING_1, STRING_2)` Concatena duas ou mais sequências de caracteres.

#### string\substring
`string\substring(STRING, START, LENGTH)`  Extrai os caracteres da STRING na posição START e LENGTH.

Se LENGTH for omitida, será retornada a subsequência de caracteres iniciada em START até o fim da STRING.

Se LENGTH for negativo, então aquela quantidade de caracteres serão omitidos do final da STRING.

#### string\\trim
`string\trim(STRING)` Retira espaço em branco do início e do fim da STRING.

#### string\\lowerCase
`string\lowerCase(STRING)` Converte as letras para minúsculas. (desde a versão 5.0.0)

#### string\\upperCase
`string\upperCase(STRING)` Converte as letras para maiúsculas. (desde a versão 5.0.0)

#### datetime\\today
`datetime\today()` Retorna a data de hoje.

#### datetime\now
`datetime\now()` Retorna a data e hora atual.

#### datetime\format
`datetime\format(VALUE, [TIMEZONE], [FORMAT])` Converte a data ou data e hora VALUE em uma sequência de caracteres formatada de acordo com as configurações do aplicativo. TIMEZONE e FORMAT podem ser omitidos. Se o TIMEZONE for omitida, então o fuso horário padrão será usado. Se o FORMAT for omitido, então o formato padrão será usado.

#### datetime\date
`datetime\date(VALUE, [TIMEZONE])` Retorna a data do mês (1-31). `0` se VALUE estiver vazio. Se o TIMEZONE for omitido, então o fuso horário do sistema é usado. (desde a versão 4.7.0)

#### datetime\month
`datetime\month(VALUE, [TIMEZONE])` Retorna o mês (1-12). `0` se VALUE estiver vazio. Se o TIMEZONE for omitido, então o fuso horário do sistema é usado. (desde a versão 4.7.0)

#### datetime\year
`datetime\year(VALUE, [TIMEZONE])` Retorna o ano. `0` se VALUE estiver vazio. Se o TIMEZONE for omitido, então o fuso horário do sistema é usado. (desde a versão 4.7.0)

#### datetime\hour
`datetime\hour(VALUE, [TIMEZONE])` Retorna a hora (0-23). `-1` se VALUE estiver vazio. Se o TIMEZONE for omitido, então o fuso horário do sistema é usado. (desde a versão 4.7.0)

#### datetime\minute
`datetime\minute(VALUE, [TIMEZONE])` Retorna os minutos (0-59). `-1` se VALUE estiver vazio. Se o TIMEZONE for omitido, então o fuso horário do sistema é usado. (desde a versão 4.7.0)

#### datetime\dayOfWeek
`datetime\dayOfWeek(VALUE, [TIMEZONE])` Retorna o dia da semana (0-6). `-1` se VALUE estiver vazio. `0` - para domingo. Se o TIMEZONE for omitido, então o fuso horário do sistema é usado. (since version 4.7.3)

#### datetime\diff
`datetime\diff(VALUE_1, VALUE_2, INTERVAL_TYPE)` Retorna a diferença entre duas datas ou datas e horas. INTERVAL_TYPE pode ser 'anos', 'meses', 'dias', 'horas', 'minutos'. Retorna `nulo` se falhar. O resultado será negativo se VALUE_1 < VALUE_2.

#### datetime\addMinutes
`datetime\addMinutes(VALUE, MINUTES)` Adiciona MINUTES à data e hora VALUE. MINUTES podem ser negativo.

#### datetime\addHours
`datetime\addHours(VALUE, HOURS)` Adiciona HOURS à data e hora VALUE. HOURS pode ser negativo.

#### datetime\addDays
`datetime\addDays(VALUE, DAYS)` Adiciona DAYS à data ou data e hora VALUE. DAYS pode ser negativo.

#### datetime\addWeeks
`datetime\addWeeks(VALUE, WEEKS)` Adiciona WEEKS à data ou data e hora VALUE. WEEKS pode ser negativo.

#### datetime\addMonths
`datetime\addMonths(VALUE, MONTHS)` Adiciona MONTHS à data ou data e hora VALUE. MONTHS pode ser negativo.

#### datetime\addYears
`datetime\addYears(VALUE, YEARS)` Adiciona YEARS à data ou data e hora VALUE. YEARS pode ser negativo.

#### datetime\closest
`datetime\closest(VALUE, TYPE, TARGET, [IS_PAST], [TIMEZONE])` Retorna a data ou data e hora mais próxima do VALUE baseada nos argumentos passados. (desde a versão 5.0.0)

TYPE pode ser one dos seguintes valores: 'horário', 'minuto', 'hora', 'data', 'mês', 'diaDaSemana'. TARGET é um valor inteiro ou uma sequência de caracteres. IS_PAST significa achar o mais próximo no passado. Se TIMEZONE for omitida, então o fuso horário padrão é usado.

Exemplos:

`datetime\closest(datetime\now(), 'time', '20:00')` Retornará o valor  de data e hora mais próximo no futuro com o horário 20:00.

`datetime\closest('2017-11-20', 'date', 1, true)` Retornará `2017-11-01`, o primeiro dia do mês. 

`datetime\closest(datetime\now(), 'dayOfWeek', 1)` Retornará a próxima segunda-feira (o início do dia). 

#### number\format
`number\format(VALUE, [DECIMALS], [DECIMAL_MARK], [THOUSAND_SEPARATOR])` Converte VALUE numérico em sequência de caracteres formatada de acordo com um formato específico ou configurações do aplicativo padrão. Se DECIMALS, DECIMAL_MARK OR THOUSAND_SEPARATOR então os padrões do sistema serão usados.

Exemplos:

`number\format(2.666667, 2)` - resultará 2.67;

`number\format(1000, 2)` - resultará 1,000.00;

`number\format(10.1, 0)` - resultará 10.


#### number\abs
`number\abs(VALUE)` Valor absoluto. Retorna nulo se VALUE não é numérico.

#### number\round
`number\round(VALUE, PRECISION)` Retorna um valor arredondado de VALUE a uma PRECISION especificada (o número de dígitos depois do ponto decimal). PRECISION também pode ser negativo ou zero (padrão).

#### number\floor
`number\floor(VALUE)` Retorna o próximo inteiro de menor valor através do arredondamento para baixo, se necessário. (desde a versão 4.9.0)

#### number\ceil
`number\ceil(VALUE)` Retorna o próximo inteiro de maior valor através do arredondamento para cima, se necessário. (desde a versão 4.9.0)

#### entity\isNew
`entity\isNew()` Retorna TRUE se a entidade é nova (está sendo criada) e FALSE se não está (está sendo atualizada).

#### entity\\isAttributeChanged
`entity\isAttributeChanged(ATTRIBUTE)` Retorna TRUE se o ATTRIBUTE da entidade mudou.

Exemplo:

`entity\isAttributeChanged('status')`

#### entity\isAttributeNotChanged
`entity\isAttributeNotChanged(ATTRIBUTE)` Retorna TRUE se o ATTRIBUTE da entidade não obteve mudanças.

#### entity\attributeFetched
`entity\attributeFetched(ATTRIBUTE)` Atributo que foi definido quando a entidade visada foi buscada na base de dados. Antes dela ser modificada.

Exemplo:

`entity\isAttributeChanged('assignedUserId')`

#### entity\addLinkMultipleId
`entity\addLinkMultipleId(LINK, ID)` Adiciona ID para o campo Links Múltiplos. Por exemplo, adiciona 'someTeamId' ao campo 'teams'. 

`entity\addLinkMultipleId(LINK, ID_LIST)` Adiciona a lista de IDs. (desde a versão 4.8.3)

#### entity\hasLinkMultipleId
`entity\hasLinkMultipleId(LINK, ID)` Verifica se o campo Links Múltiplos tem um ID específico.

#### entity\removeLinkMultipleId
`entity\removeLinkMultipleId(LINK, ID)` Remove um ID específico do campo Links Múltiplos.

#### entity\isRelated
`entity\isRelated(LINK, ID)` Verifica se a entidade visada está relacionada com outra entidade representada por LINK e ID.

#### env\userAttribute
`env\userAttribute(ATTRIBUTE)` Retorna o ATTRIBUTE do utilizador atual.

#### list
`list(VALUE-1, ... VALUE-N)` Retorna arranjo. (desde a versão 4.7.0)

#### array\includes
`array\includes(LIST, VALUE)` Retorna verdadeiro se LIST contêm VALUE. Pode ser usado pelos campos Arranjo e Multi-enum. (desde a versão 4.7.0)

#### array\push
`array\push(LIST, VALUE1 [, VALUE2 ...])` Adiciona um ou mais elementos no final de um arranjo e retorna o novo arranjo. (desde a versão 5.0.0)

#### array\length
`array\length(LIST)` Retorna a contagem dos elementos em LIST. (desde a versão 4.8.1)


### Valores

* Sequências de caracteres. Ex: 'uma sequência de caracteres qualquer';
* Números inteiros. Ex: 1, 100, 40300.
* Números decimais. Ex: 5.2.

### Variáveis

É possível definir variáveis padronizadas nas fórmulas.
```
$someVariableName = 'Test';
description = $test;
```


## Exemplos

```
ifThen(
  entity\isNew() && assignedUserId == null,
  assignedUserId = 'managerId'
);

ifThen(
  entity\isNew() && closeDate == null && stage == 'Closed Won',
  datetime\today()
);
```

```
amount = product.listPrice - (product.listPriceConverted * discount / 100.0);
amountCurrency = 'USD';
```

```
someField = string\concatenate(firstName, " '", middleName, "' ", lastName);
```

```
ifThenElse(
  entity\isNew() && status == 'Planned' && dateStart == null,
  dateStart = datetime\addDays(datetime\now(), 10),
  ifThen(
    status == 'Held' && dateStart == null,
    dateStart = datetime\now()
  )
);

```

## Usando fórmulas em Fluxos de Trabalho

Podes utilizar fórmulas nas condições e ações dos fluxos de trabalhos. Vê [documentação dos fluxos de trabalho](workflows.md) para mais informações.
