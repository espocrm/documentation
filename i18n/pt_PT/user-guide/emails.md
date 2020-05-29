# Diretrizes sobre o Uso do Correio Eletronico

O EspoCRM porporciona a capacidade de procurar correio eletrónico na caixa IMAP. Isto faz com que seja  possivel usar o EspoCRM como um cliente de correio eletrónico juntamente com os recursos específicos do CRM.

## Contas IMAP

*Nota: Deves ter o [cron](../administration/server-configuration.md#configure-um-crontab) configurado corretamente no teu sistema para que o correio eletrónico recebido funcione.*

O utilizador pode configurar a conta IMAP na página de contas de correio eletrónico pessoais (guia do correio eletrónico> menu superior direito> Contas de Correio Eletrónico Pessoais).

Especifica quais as pastas que são para monitorizar no campo Pastas Monitorizadas. Por padrão, ele está configurado no INBOX. Se usas um cliente de correio eletrónico externo para enviar mensagens de correio eletrónico, Podes adicionar a pasta Enviada para arquivar este correio eletrónico.

*Pesquisa Desde* permite que escolhas a data a partir da qual as mensagens de correio eletrónico devem ser arquivadas. Configura-o para uma data antes de hoje, se precisares de arquivar correio eletrónico antigo.

Existe a possibilidade de especificares a *Pasta* na Conta Pessoal de Correio Eletrónico. As mensagens de correio eletrónico recebidas serão colocadas nessa pasta.

## Contas SMTP

Os utilizadores podem configurar as configurações do SMTP em Preferências, bem como nas suas Contas de Correio Eletrónico Pessoais. O administrador também pode permitir o uso do sistema SMTP (torna-lo Compartilhado).

Os utilizadores podem ter várias contas SMTP (a partir da versão 4.2.0). Mas os endereços de correio eletrónico que o utilizador pode usar para enviar mensagens de correio eletrónico são definidos pelos endereços de correio eletrónico do registro *Utilizador*.

## Trabalhar com Correio Eletrónico

As mensagens de correio eletrónico são capturados pelo cron (em segundo plano) a cada poucos minutos (o período pode ser especificado pelo Administrador).
Pode ver todos as tuas mensagens de corrreio eletrónico na aba Correio Eletrónico. Existem as pastas padrão, Recebidas, Enviadas, Rascunhos no lado esquerdo.

O campo de *Estado*. `Enviado` significa que foi enviado a partir do CRM, `Arquivado` - retirado da conta IMAP ou arquivado manualmente, `Rascunho` - significa que o correio electrónico foi criado como um rascunho.

Quando uma nova mensagem de correio eletrónico chega, o sistema tenta reconhecer a qual registro este correio eletrónico pertence. Podes vinculá-lo com a Conta, Potencial Cliente, Oportunidade, Caso (e Contato no modo B2C) etc. Se não for reconhecido, o utilizador pode conetá-lo manualmente, preenchendo o campo *Pai*.

Quando uma nova mensagem de correio eletrónico vier de um novo potencial cliente, o utilizador pode **converte-lo em Potencial Cliente**. Abre a entrada de correio eletrónico e clica em Criar potencial cliente no menu superior direito.

Também é possível **criar Tarefa ou Caso** a partir de um registro de correio eletrónico.

Se os endereços de correio eletrónico (de, para, cc) num registro de correio eletrónico forem reconhecidas pelo sistema, será mostrado a pessoa com quem eles estão relacionados (Contato, Potencial Cliente, Utilizador, etc.). Se qualquer endereço de correio eletrónico for novo, podes **criar contato** diretamente de lá.

Todas as mensagens de correio eletrónico relacionados a um registro específico émostrado no painel Histórico desse registro. Se algum correio eletrónico estiver relacionado, por exemplo, com oportunidade, mas a oportunidade está relacionada à conta, ela será mostrada em oportunidade e em conta

## Enviar Correio Electrónico

Podes escrever uma nova mensagem de correio eletrónico de várias formas:
* Botão de *Escrever Correio Eletrónico* na lista de Correio Eletrónico;
* responder a outro correio eletrónico;
* clicar num endereço de correio eletrónico de algum registro;
* ação *Escrever Correio Eletrónico* no painel de Atividades.

Existe a possibilidade de **selecionares o modelo** no teu correio eletrónico.

Podes configurar a **assinatura do correio eletrónico** em Preferências.

## Pastas de Correio Electrónico

Os utilizadores podem criar as suas próprias pastas de correio eletrónico de acordo com a conviniência para colocar algumas das mensagens de correio eletrónico. A lista de pastas disponíveis está disponível na página de Correio Eletrónico no lado esquerdo. Para criar ou editar pastas, siga o Correio Eletrónico> menu suspenso no canto superior direito> Pastas.`Ignorar Notificação` significa que não serás notificado sobre as mensagens de correio eletrónico recebidas que pertençam à pasta especificada. Ao usares os Filtros de Correio Eletrónico, é possível colocares as mensagens de correio eletrónico nas pastas automaticamente de acordo com os critérios específicos.

## Filtros de Correio Eletrónico

O administrador pode criar filtros de correio eletrónico globais para ignorar o correio eletrónico indesejado. Estão disponíveis em Administração> Filtros de Correio Eletrónico Email.

O utilizador regular pode criar filtros de correio eletrónico para as suas contas de correio eletrónico pessoais ou para toda a sua caixa de entrada completa. Estão disponíveis em Correio Eletrónico > menu suspenso no canto superior direito> Filtros.

Existem dois tipos de filtros:
* Ignorar - o correio eletrónico será colocado no *Lixo* ou não será importado se o filtro estiver relacionado a Conta Pessoal de Correio Eletrónico;
* Colocar pasta – as mensagens de correio eletrónico importados serão automaticamente colocados na pasta de utilizador especificada.

## Modelos de Correio Eletrónico

Os modelos de correio eletrónico estão disponíveis em Correio Eletrónico > menu suspenso no canto superior direito> Modelos de correio eletrónico. Podem ser usados para correio eletrónico em massa e correio eletrónico regular. A caixa de verificação `One-off` significa que o modelo de correio eletrónico será usado apenas uma vez, que é usual para o marketing por correio eletrónico.

É possível usar os espaços reservados da pasta no corpo do modelo de correio eletrónico e o assunto, por exemplo. {Account.name}, {Person.emailAddress}. Serão substituídos por valores de registros relacionados.

 Podes usar marcadores de espaço de pasta reservados adicionais no corpo do modelo: {optOutUrl} e {optOutLink}.
```

<a href="{optOutUrl}">Cancelar a inscrição</a>
```

Este é uma ligação para cancelar a inscrição de correio eletrónico em massa.
