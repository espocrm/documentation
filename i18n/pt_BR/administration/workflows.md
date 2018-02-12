# Fluxos de Trabalho

O recurso Fluxos de Trabalho está disponível em [Pacote Avançado](https://www.espocrm.com/extensions/advanced-pack/).

Fluxos de Trabalho automatiza seus processos de negócios de uma forma fácil. Você pode achá-la no painel de Administração. Para criar uma regra de fluxos de trabalho, você precisa definir:

* Entidade Alvo - a qual tipo de entidade o fluxos de trabalho é aplicado;
* Tipo de Acionamento - quando o fluxo de trabalho será acionado;
* Condições - condições precisam ser satisfeitas para acionar o fluxo de trabalho;
* Ações - o que fazer se o fluxo de trabalho é acionado.


## Tipos de Acionamentos

### Após criar um registro 

Acionado apenas quando um novo registro é criado. Se as condições específicas forem satisfeitas, então as ações serão executadas.

### Após salvar um registro

Acionado quando um novo registro é criado ou um registro existente é atualizado. Se as condições específicas forem satisfeitas, então as ações serão executadas.

Para as regras de fluxos de trabalho com esse tipo de acionamento, é uma prática comum ter uma condição que verifica se algum campo 'mudou'. Ex: Se o estado de Caso mudou, então execute algumas ações.

### Agendamento

Acionado de acordo com a agenda definida. Você pode configurá-lo para executar todo dia, toda semana, etc. Ações serão aplicadas para registros retornados por uma lista relatório especificada. Então você precisa também criar uma lista relatório.

Agendar está especificado em uma notação crontab.

```
* * * * * *
| | | | | | 
| | | | | +-- Ano              (amplitude: 1900-3000)
| | | | +---- Dia da Semana   (amplitude: 1-7, 1 significa Segunda-feira)
| | | +------ Mês do Ano (amplitude: 1-12)
| | +-------- Dia do Mês  (amplitude: 1-31)
| +---------- Hora              (amplitude: 0-23)
+------------ Minuto            (amplitude: 0-59)
```

### Sequencial

Raramente usado. Deveria ser executado por outro fluxo de trabalho. Gera uma capacidade de fazer uma lógica complexa. 

Nota: Para fluxos de trabalho sequenciais, é recomendado utilizar a [ferramenta BPM](bpm.md) em vez do recurso Fluxos de Trabalho.

## Condições

Você pode especificar condições que devem ser satisfeitas para acionar o fluxo de trabalho. Existem duas maneiras como as condições podem ser especificadas: com o construtor de condições UI e com fórmula.

### Construtor de condições UI

Alguns tipos de condições disponíveis:

* _iguais_ - o campo é igual a um valor específico ou um valor de outro campo;
* _era_igual_ - o campo era igual a um valor específico antes do fluxo de trabalho ser acionado;
* _nao_igual_ - o campo não é igual a um valor específico ou um valor de outro campo;
* _nao_era_igual_ - O campo não era igual a um valor específico antes do fluxo de trabalho ser acionado;
* _vazio_ - o valor do campo está vazio;
* _nao vazio_ - o valor do campo não está vazio;
* _alterado_ - o campo foi alterado;
* _nao alterado_ - o campo não foi alterado.

### Condições para Fórmulas

As fórmulas dão a capacidade de definir condições de qualquer complexidade. Para ler sobre a sintaxe de fórmulas, veja [esse artigo](formula.md). 

Nota: Não deve haver qualquer delimitador ';' usado no código da fórmula quando ela determina uma condição.

## Ações

### Enviar Email

O sistema vai enviar um email usando um modelo de email específico. Um endereço de email do destinatário pode ser pego do registro visado, qualquer registro relacionado, do usuário atual, seguidores, time de usuários ou especificado. Os emails podem ser enviados imediatamente ou atrasados por um intervalo específico.

### Criar Registro

O sistema vai criar o novo registro de qualquer tipo de entidade. Se existe um relacionamento entre o registro alvo e o registro sendo criado, é possível relacionar os registros. 

Há uma capacidade para definir fórmula para calcular campos.

### Criar Registro Relacionado

O sistema vai criar o registro relacionado ao registro visado. É possível definir fórmula para calcular campos.

### Atualizar Registro Alvo

Permite alteração de um campo específico do registro visado. É possível definir fórmula para calcular campos. 

Se você precisa adicionar novos itens para o campo Link-Múltiplo sem perder os dados existentes (ex: Times), você precisa utilizar a função fórmula entity\addLinkMultipleId. Exemplo: `entity\addLinkMultipleId('teams', 'teamId')`.

### Atualizar Registro Relacionado

Permite alteração de campos específicos do registro ou registros relacionados. É possível definir fórmula para calcular campos.

### Vincular com Outro Registro

Relaciona a entidade visada com outra entidade específica. Ex: adiciona um time específico para o registro.

### Desvincular com Outro Registro

Acaba com a relação da entidade visada e outra entidade específica. Ex: remove um time específico do registro.

### Aplicar Regra de Atribuição

Atribui o registro alvo ao usuário pela função de distribuição. Existem duas regras disponíveis: Um-por-Turno e Menos-Ocupado.

* Um-por-Turno - os usuários são escolhidos de uma lista (time) do início ao fim e então começa novamente.
* Menos-Ocupado - o usuário que tem menos registros de atribuições será escolhido para a atribuição.

_Lista Relatório_ - Para a distribuição Menos-Ocupado, determina quais registros serão levados em consideração para calcular o número de registros atribuídos. Ex: para os Casos nós precisamos pegar somente registros com o estado ativo.

### Criar Notificação

Notificar usuários específicos com a mensagem. É possível usar espaços reservados nas mensagens modelo: {entidade} - registro visado, {usuário} - usuário atual.

### Fazer Seguido

Força usuários específicos a seguir a entidade alvo ou uma entidade relacionada.

### Acionar Outro Fluxo de Trabalho

Permite fazer fluxos de trabalho sequenciais. É possível remificar fluxo de trabalho por condição: você pode configurar o fluxo de trabalho para acionar dois fluxos de trabalho com diferentes condições definidas naqueles fluxos de trabalho.

É possível atrasar a execução de fluxo de trabalho sequencial. Em fluxo de trabalho sequencial, você pode definir a condição que verifica se campos específicos foram alterados desde o fluxo de trabalho superior foi acionado ao usar os tipos de condição _Alterado_ e _Era Igual_.

Nota: Para fluxos de trabalho sequenciais, é recomendado utilizar a [ferramenta BPM](bpm.md) em vez do recurso Fluxos de Trabalho.

### Execute a Ação de Serviço

Permite executar scripts de serviços específicos. Por padrão existem as seguintes ações disponíveis:

* Mandar Convite - para Reuniões/Chamadas;
* Adicionar Itens Citados - para Citações.

Os desenvolvedores podem escrever suas próprias ações de serviço. Veja [mais detalhes](../development/workflow-service-actions.md).

## Usando Fórmula em Ações

É possível definir fórmula para calcular campos para Criar Registro, Atualizar Registro Alvo, Criar Registro Relacionado, Atualizar Registro Relacionado. Para os últimos dois, para acessar os atributos da entidade alvo, você deve usar a função `targetEntity\attribute`. Para acessar atributos da entidade alvo que foi definida antes do fluxo de trabalho, `targetEntity\attributeFetched`.

Exemplo:
```
name = string\concatenate(targetEntity\attribute('name'), ' ', datetime\today());
```
