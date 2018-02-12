# Business Process Management

A ferramenta Business Process Management (BPM) dá a habilidade de modelar e automatizar os processos de negócios no EspoCRM. É um motor que executa processos de negócios descrito no BPMN 2.0 padrão. A ferramenta BPM está disponível na extensão [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).

![BPM example](../_static/images/administration/bpm/bpm-1.png)

### Diferença da ferramenta Workflows

A ferramenta Workflows está destinada para automação de regras simples de negócios, sem fluxo sequencial de itens, quando não há necessidade de mostrar o fluxo em gráficos.

A ferramenta BPM é destinada a fluxos de negócios mais complexos, onde pode haver fluxos divergindo e convergindo, atrasos na execução, interações do utilizador. Um fluxograma faz os processos do negócio mais compreensivos para um humano, um log permite ver como o processo foi mantido.

## Fluxogramas dos Processos

O link para os fluxogramas dos processos está disponível no painel de administração. Isso também pode ser adicionado como uma aba no painel de navegação.

Fluxogramas são destinados para a modelagem de processos de negócios. Administradores podem criar e editar fluxogramas. Utilizadores comuns podem somente ver os fluxogramas.

Cada fluxograma tem um tipo de entidade específica (campo Target Type). O fluxograma determina a execução de instâncias de processos futuros. Ele consiste em elementos do fluxograma e conexões entre elementos.

Se os processos do fluxograma têm o campo 'Is Active' desmarcado, ele não iniciará as instâncias dos processos.

Para mostrar detalhes e parâmetros de certo elemento do fluxograma, precisas de clicar nele. Em modo de edição tu és capaz de editar os parâmetros.

## Processos

Os processos estão disponíveis no painel de administração. O link também pode ser adicionado à aba no painel de navegação.

Os processos representam instâncias de processos de negócios. Quando ele é iniciado, o seu estado para a ser 'Started'. Quando o processo é finalizado, o seu estado passa a ser 'Ended'. O processo pode também ser parado manualmente por um utilizador que tenha acesso à edição de processos. Se ele é parado manualmente, o seu estado passa a ser 'Stopped'.

O processo é executado de acordo com o fluxograma. O processo de fluxograma não pode ser mudado depois que o processo é iniciado.

O processo está relacionado obrigatoriamente a um único registro alvo.

Os processos podem ser iniciados automaticamente (sob condições específicas ou através de agendamento) ou manualmente (onde há pelo menos um 'Iniciar Evento' no fluxograma). Para começar processos manualmente o utilizador precisa de clicar no botão 'Iniciar Processo' na lista de processos.

## Elementos dos Fluxogramas

### Eventos

Eventos são mostrados nos fluxogramas como círculos.

#### Iniciar Evento

Não tem parâmetros. É um ponto de início do processo. Iniciar Evento pode ser iniciado manualmente por um utilizador que tenha acesso para criar processos. O usuário precisa clicar no botão 'Iniciar Processo' na lista de processos.

#### Iniciar Evento Condicional

Um ponto de início do processo. É suposto para ser acionado automaticamente quando as condições específicas são atendidas. Há dois tipos de acionamentos: 'Depois de um registro criado', 'Depois de um registro salvo'.

#### Iniciar Processo Agendado

Um ponto de início do processo. Isso inicia processos por agendamento. Precisas especificar a lista de reporte que retorna registros para iniciar processos e agendar na notação do crontab.

#### Evento Intermediário Condicional

Este evento para o fluxo até que critérios específicos sejam atendidos.

#### Evento Intermediário Agendado

Este evento para o fluxo e esperar o quanto for especificado pelos parâmetros dos eventos.

Para agendamentos mais complexos podes utilizar [fórmula](formula.md). Scripts de fórmula devem retornar um valor Data-Tempo (em fuso horário UTC). Uma vez que esse tempo chega, o fluxo procederá para o próximo elemento.

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

Se há necessidade de unir fluxos paralelos produzidos por uma entrada inclusiva divergente, tu precisas usar uma entrada inclusiva convergente. Ela vai esperar for todos os fluxos de entrada e então seguir para o elemento de saída.

![inclusive gateway](../_static/images/administration/bpm/gateway-inclusive.png)

Nota: Entradas divergentes e convergentes devem ser balanceadas.

Nota: Se um dos fluxos paralelos foi finalizado por algum motivo então a entrada divergente nunca será processada. O processo será bloqueado. Evita um design de fluxograma que possa trazer tal situação.

#### Entrada Paralela

Pode divergir ou convergir fluxos.

Em caso de divergência, ela divide o fluxo em múltiplos fluxos paralelos. Não há parâmetros para esse tipo de entrada.

Em caso de convergência, ela espera até todos os fluxos de entrada venham e então continua para o próximo elemento de saída.

![parallel gateway](../_static/images/administration/bpm/gateway-parallel.png)

Nota: Entradas divergentes e convergentes devem ser balanceadas.

Nota: Se um dos fluxos paralelos foi finalizado por algum motivo então a entrada divergente nunca será processada. O processo será bloqueado. Evita um design de fluxograma que possa trazer tal situação.

#### Entrada Baseada em Evento

Pode somente divergir fluxos.

Ela para o fluxo até qualquer dos eventos de saída seja disparado. O evento disparado determina o único fluxo. Outros eventos de saída são rejeitados.

Somente eventos intermediários podem estar na outra saído do fluxo de sequência de saída.

![event based gateway](../_static/images/administration/bpm/gateway-event-based.png)

### Atividades

Atividades são mostradas como retângulos arredondados.

#### Tarefas

Tarefas podem executar as ações seguintes:

* Criar Registro - cria um novo registro de qualquer tipo de entidade;
* Criar Registro Relacionado - cria um novo registro relacionado ao registro alvo;
* Atualizar Registro Alvo;
* Atualizar Registro Relacionado - atualiza o registro ou registros relacionados ao registro alvo;
* Atualizar Registro Criado - atualiza um campo específico de qualquer registro criado no processo atual;
* Atualizar Processo de Registro - pode ser usado para designar o processo a um utilizador ou equipa específico;
* Ligar a Outro Registro - liga o registro alvo com um registro específico;
* Romper Ligação de Outro Registro - rompe a ligação do registro alvo do registro especificado;
* Aplicar Regra de Designação - designa o registro alvo, o registro do processo ou qualquer registro criado pelo processo de acordo com a regra específica;
* Criar Notificação - cria notificação dentro do aplicativo para usuários específicos;
* Fazer Seguido - faz um usuário específico seguir o registro alvo, o registro do processo ou qualquer registro criado pelo processo;
* Executar Ação de Serviço - executa ações de serviços personalizados implementados por desenvolvedores.

Ações disponíveis para tarefas são quase as mesmas como na característica Fluxo de Trabalho. Veja mais detalhes sobre [ações de fluxo de trabalho](workflows.md#actions).

#### Enviar Mensagem de Tarefa

Envia mensagem por email para um receptor específico.

#### Tarefa de Utilizador

Providencia uma habilidade flexível de interação de utilizador. Ela para a execução até que o usuário (explicitamente especificado ou por regra de designação) conclua a tarefa. O registro da Tarefa do Processo do Usuário será criado no sistema. Por padrão, existem três tipos de ações: Aprovar, Rever e Concluir.

* As do tipo Aprovar exige que o usuário escolha entre 'Aprovada' ou 'Recusada'.
* As do tipo Revisar somente dão uma opção: 'Revisado'.
* As do tipo Concluir possuem duas opções: 'Completada' e 'Falhada'.


O usuário designado a criar o registro da Tarefa do Processo do Usuário receberá uma notificação dentro do aplicativo. O administrador pode também ativar notificações por email.

Os utilizadores podem também adicionar Tarefas do Utilizador do Processo como pequenas informações em seu painel de controle para ver tarefas do utilizador do processo atual deles.

É possível ler a resolução da tarefa de utilizador passada dentro de uma entrada divergente ou eventos condicionais, fazendo ramificação no fluxo do processo.

#### Tarefa de Script

Executa o script na linguagem [espo-fórmula](formula.md) Todas as variáveis definidas (`$variableName`) serão guardadas e estarão disponíveis dentro do processo.

### Fluxos

#### Sequência de Fluxos

Representadas como uma flecha sólida. Indica a ordem em que os elementos do processo serão executados.

## Condições

Entradas de eventos condicionais, exclusivas e inclusivas divergentes, possuem condições que determinam o fluxo do processo.

Através da UI há uma habilidade de verificar condições para os seguintes registros:

* Registro Alvo;
* Registros relacionados ao alvo através de relacionamentos muitos-para-um e filho-para-pai;
* Registros criados pelos processos através de tarefas;
* Registros de tarefas de utilizadores, que permitem a verificação da resolução.

É possível também definir condições na linguagem [Espo-fórmula](formula.md).

Condições na ferramenta BPM são as mesmas como na característica Fluxo de Trabalho. Veja mais detalhes sobre isso em [condições dos fluxos de trabalhos](workflows.md#conditions).

## Exemplos

### Exemplo 1

![Exemplo 1](../_static/images/administration/bpm/example-1.png)

### Exemplo 2

![Exemplo 2](../_static/images/administration/bpm/example-2.png)

### Exemplo 3
