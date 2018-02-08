# Business Process Management

A ferramenta Business Process Management (BPM) dá a habilidade de modelar e automatizar os processos de negócios eno EspoCRM. É um motor que executa processos de negócios descrito no BPMN 2.0 padrão. A ferramenta BPM está disponível na extenção [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).

![BPM example](../_static/images/administration/bpm/bpm-1.png)

### Diferença da ferramenta Workflows

A ferramenta Workflows está destinada para automação de regras simples de negócios, sem fluxo sequencial de itens, quando não há necessidade de mostrar o fluxo em gráficos.

A ferramenta BPM é destinada a fluxos de negócios mais complexos, onde pode haver fluxos divergindo e convergindo, atrasos na execução, interações do usuário. Um fluxograma faz os processos do negócio mais compreensivos para um humano, um log permite ver como o processo foi mantido.

## Fluxogramas dos Processos

O link para os fluxogramas dos processos está disponível no painel de administração. Isso também pode ser adicionado como uma aba no painel de navegação.

Fluxogramas são destinados para a modelagem de processos de negócios. Administradores podem criar e editar fluxogramas. Usuários comuns podem somente ver os fluxogramas.

Cada fluxograma tem seu tipo de entidade específica (campo Target Type). O fluxograma determina a execução de instâncias de processos futuros. Ele consite de elementos do fluxograma e conexões entre elementos.

Se os processos do fluxograma tem o campo 'Is Active' desmarcado, ele não iniciará as instâncias dos processos.

Para mostrar detalhes e parâmetros de certo elemento do fluxograma, você precisa clicar nele. Em modo de edição você é capaz de editar parâmetros.

## Processos

Os processos estão disponíveis no painel de administração. O link também pode ser adicionado à aba no painel de navegação.

Os processos representam instâncias de processos de negócios. Quando ele é iniciado, seu estado para a ser 'Started'. Quando o processo é finalizado, seu estado passa a ser 'Ended'. O processo pode também ser parado manualmente por um usuário que tenha acesso à edição de processos. Se ele é parado manualmente, seu estado passa a ser 'Stopped'.

O processo é executado de acordo com o fluxograma. O processo de fluxograma não pode ser mudado depois que o processo é iniciado.

O processo obrigatoriamente está relacionado a um único registro alvo.

Os processos podem ser iniciados automaticamente (sob condições específicas ou através de agendamento) ou manualmente (onde há pelo menos um 'Iniciar Evento' no fluxograma). Para começar processos manualmente o usuário precisa clicar no botão 'Iniciar Processo' na lista de processos.

## Elementos dos Fluxogramas

### Eventos

Eventos são mostrados nos fluxogramas como círculos.

#### Iniciar Evento

Não tem parâmetros. É um ponto de início do processo. Iniciar Evento pode ser iniciado manualmente por um usuário que tenha acesso para criar processos. O usuário precisa clicar no botão 'Iniciar Processo' na lista de processos.

#### Iniciar Evento Condicional

Um ponto de início do processo. É suposto para ser acionado automaticamente quando condições específicas são atendidas. Há dois tipos de acionamentos: 'Depois de um registro criado', 'Depois de um registro salvo'.

#### Iniciar Processo Agendado

Um ponto de início do processo. Isso inicia processos por agendamento. Você precisa especificar a lista de reporte que retorna registros para iniciar processos e agendar na notação do crontab.

#### Evento Intermediário Condicional

Esse evento para o fluxo até que critérios específicos sejam atendidos.

#### Evento Intermediário Agendado

Esse evento para o fluxo e esperar o quanto for especificado pelos parâmetros dos eventos.

Para agendamentos mais complexos você pode utilizar [fórmula](formula.md). Scripts de fórmula devem retornar um valor Data-Tempo (em fuso horário UTC). Uma vez que esse tempo chega, o fluxo procederá para o próximo elemento.

Através da utilização da função de fórmula datetime\closest, é possível definir o relógio para uma hora específica no futuro, por exemplo, o início do próximo dia de trabalho.  

#### Fim de Evento

Finaliza o fluxo atual. Ele não finaliza fluxos sendo executados em paralelo. Quando o fluxo chega ao fim do evento e não há qualquer coisa executando em paralelo, o processo finaliza.

#### Fim de Evento Conclusivo

Finaliza todos os fluxos. Processo é subsequentemente finalizado.

### Entradas

Entradas são mostrados como diamantes.

#### Entrada Exclusiva

Pode divergir ou convergir fluxos.

No caso de divergência, ela define um único fluxo (caminho) que será escolhido de acordo com critérios específicos. A primeira condição atendida determina o fluxo, próximas condições são omitidas. Há uma habilidade de especificar fluxo padrão. O fluxo padrão é escolhido se não existem quaisquer condições atendidas. O fluxo padrão está marcado com um sinal de barra.

No caso de convergência, ela apenas direciona o fluxo para o elemento de saída. Ela não é bloqueada após o fluxo passar através, então fluxos paralelos não serão unidos em um único fluxo.

![exclusive gateway divergent](../_static/images/administration/bpm/gateway-exclusive-divergent.png)

![exclusive gateway convergent](../_static/images/administration/bpm/gateway-exclusive-convergent.png)

#### Entrada Inclusiva

Pode divergir ou convergir fluxos.

No caso de divergência, ela pode direcionar um ou múltiplos fluxos paralelos (caminhos), dependendo do atendimento de critérios de cada fluxo. O fluxo padrão é escolhido se não existem quaisquer condições atendidas. O fluxo padrão está marcado com um sinal de barra.

Se há necessidade de unir fluxos paralelos produzidos por uma entrada inclusiva divergente, você precisa usar uma entrada inclusiva convergente. Ela vai esperar for todos os fluxos de entrada e então seguir para o elemento de saída.

![inclusive gateway](../_static/images/administration/bpm/gateway-inclusive.png)

Nota: Entradas divergentes e convergentes devem ser balanceadas.

Nota: Se um dos fluxos paralelos foi finalizado por algum motivo então a entrada divergente nunca será processada. O processo será bloqueado. Evite um design de fluxograma que possa trazer tal situação.

#### Parallel Gateway

Pode divergir ou convergir fluxos.

In case of diverging it splits flow into multiple parallel flows. There are no parameters for this gateway type.

In case of converging it waits until all incoming flows come and then continues to the next outgoing element.

![parallel gateway](../_static/images/administration/bpm/gateway-parallel.png)

Nota: Entradas divergentes e convergentes devem ser balanceadas.

Nota: Se um dos fluxos paralelos foi finalizado por algum motivo então a entrada divergente nunca será processada. O processo será bloqueado. Evite um design de fluxograma que possa trazer tal situação.

#### Event Based Gateway

Can only diverge flows.

It stops the flow until any of outgoing events gets triggered. Triggered event determines the single flow. Other outgoing events get rejected.

Only intermediate events can be on the other end of outgoing sequence flows.

![event based gateway](../_static/images/administration/bpm/gateway-event-based.png)

### Activities

Activities are displayed as rounded rectangles.

#### Task

Task can execute following the actions:

* Create Record - creates new record of any entity type;
* Create Related Record - creates new record related to the target record;
* Update Target Record;
* Update Related Record - updates the record or records related to the target record;
* Update Created Record - updates specific field of any record created in the current process;
* Update Process Record - can be used to assign the process to specific user or team;
* Link to Another Record - links the target record with a specified record;
* Unlink from Another Record - unlinks the target record from the specified record;
* Apply Assignment Rule - assigns the target record, the process record or any record created by the process according to the specific rule;
* Create Notification - creates in-app notification for specific users;
* Make Followed - makes specific users follow the target record, the process record or any record created by the process;
* Run Service Action - runs custom service actions implemented by developers.

Actions available for task are almost the same as in Workflow feature. See more details about [workflow's actions](workflows.md#actions).

#### Send Message Task

Sends email message to specific recipient.

#### User Task

Provides a flexible ability of user interaction. It stops execution until the user (specified explicitly or by assignment rule) resolves the task. Process User Task record will be created in the system. By default there are three action types: Approve, Review, Accomplish.

* Approve type requires the user to chose between 'Approved' and 'Declined'.
* Review type gives only one option: 'Reviewed'.
* Accomplish type has two options: 'Completed' and 'Failed'.


The user assigned to the created Process User Task record will receive in-app notification. Administrator can also enable email notifications.

Users can also add Process User Tasks dashlet on their dashboard to see their actual process user tasks.

It's possible to read the resolution of the passed user task within diverging gateways or conditional events, making ramification in the process flow.

#### Script Task

Executes the script in [espo-formula](formula.md) language. All set variables (`$variableName`) will be stored and available within the process.

### Flows

#### Sequence Flow

Represented as a solid arrow. Indicates the order in which process elements will be executed.

## Conditions

Conditional events, exclusive and inclusive diverging gateways have conditions that determine the flow of the process.

Through UI there is an ability to check conditions for the following records:

* Target record;
* Records related to the target through many-to-one and children-to-parent relationships;
* Records created by the process via tasks;
* User task records, which allows checking the resolution.

It's also possible to define conditions in [Espo-formula](formula.md) language.

Conditions in BPM tool are the same as in Workflow feature. See more details about [workflow's conditions](workflows.md#conditions).

## Examples

### Example 1

![Example 1](../_static/images/administration/bpm/example-1.png)

### Example 2

![Example 2](../_static/images/administration/bpm/example-2.png)

### Example 3

![Example 3](../_static/images/administration/bpm/example-3.png)
