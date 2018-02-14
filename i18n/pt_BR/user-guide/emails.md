# Diretrizes sobre o Uso de Email

O EspoCRM porporciona à capacidade de procurar email na caixa IMAP. Isto faz com que seja possivel usar o EspoCRM como cliente de email juntamente com os recursos específicos do CRM.

## Contas IMAP

*Nota: Voçê deve ter o [cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) configurado corretamente em seu sistema para que o email recebido funcione.*

O usuário pode configurar a conta IMAP na página de contas de email pessoais (guia de email> menu superior direito> Contas de Email Pessoais).

Especifique quais as pastas que são para monitorar no campo Pastas Monitoriradas. Por padrão, ele está configurado no INBOX. Se Você usa um cliente de email externo para enviar emails, Você pode adicionar a pasta Enviada para arquivar esse email.

*Buscar Desde* permite que você escolha a data a partir da qual os emails devem ser arquivadas. Configure-o para uma data antes de hoje, se você precisar de arquivar emails antigos.

Existe a possibilidade de você especificar a *Pasta* na Conta Pessoal de Email. Os emails recebidos serão colocados nessa pasta.

## Contas SMTP

Os usuários podem configurar às configurações do SMTP em Preferências, bem como nas suas Contas de Email Pessoais. O administrador também pode permitir o uso do sistema SMTP (torna-lo Compartilhado).

Os usuários podem ter várias contas SMTP (a partir da versão 4.2.0). Mas os endereços de email que o usuário pode usar para enviar emails são definidos pelos endereços de email do registro *Usuário*.

## Trabalhar com Email

Os Emails são capturados pelo cron (em segundo plano) a cada poucos minutos (o período pode ser especificado pelo Administrador).
Pode ver todos os seus emails na aba Emails. Existem as pastas padrão, Recebidas, Enviadas, Rascunhos no lado esquerdo.

O campo *Estado*. `Enviado` significa que foi enviado a partir do CRM, `Arquivado` - retirado da conta IMAP ou arquivado manualmente, `Rascunho` - significa que o email foi criado como um rascunho.

Quando um novo email chega, o sistema tenta reconhecer qual registro esse email pertence. Você pode vinculá-lo com à Conta, Potencial Cliente, Oportunidade, Caso (e Contato no modo B2C) etc. Se não for reconhecido, o usuário pode conetá-lo manualmente, preenchendo o campo *Pai*.

Quando um novo email vier de um novo potencial cliente, o usuário pode **converte-lo em Potencial Cliente**. Abra à entrada de email e clique em Criar potencial cliente no menu superior direito.

Também é possível **criar Tarefa ou Caso** a partir de um registro de email.

Se os endereços de email (de, para, cc) num registro de email forem reconhecidas pelo sistema, será mostrado à pessoa com quem eles estão relacionados (Contato, Potencial Cliente, Usuário, etc.). Se qualquer endereço de email for novo, você pode **criar contato** diretamente de lá.

Todos os emails relacionados a um registro específico é mostrado no painel Histórico desse registro. Se algum email estiver relacionado, por exemplo, com oportunidade, mas a oportunidade está relacionada à conta, ela será mostrada em oportunidade e em conta

## Enviar Emails

Você pode escrever um novo email de várias formas:
* Botão de *Escrever Email* na lista de Email;
* responder a outro email;
* clicar num endereço de email de algum registro;
* ação *Escrever Email* no painel de Atividades.

Existe a possibilidade de você **selecionar o modelo** no teu email.

Você pode configurar a **assinatura do email** em Preferências.

## Pastas de Email

Os usuários podem criar as suas próprias pastas de email de acordo com a conviniência para colocar alguns dos emails. A lista de pastas disponíveis está disponível na página de Email no lado esquerdo. Para criar ou editar pastas, siga Email> menu suspenso no canto superior direito> Pastas.`Ignorar Notificação` significa que você não será notificado sobre os emails recebidos que pertençam à pasta especificada. Ao usar os Filtros de Emails, é possível você colocar os emails nas pastas automaticamente de acordo com os critérios específicos.

## Filtros de Emails

O administrador pode criar filtros de email globais para ignorar o email indesejado. Estão disponíveis em Administração> Filtros de Email.

O usuário regular pode criar filtros de email para as suas contas de email pessoais ou para toda a sua caixa de entrada completa. Estão disponíveis em Email > menu suspenso no canto superior direito> Filtros.

Existem dois tipos de filtros:
* Ignorar - o email será colocado no *Lixo* ou não será importado se o filtro estiver relacionado à Conta Pessoal de Email;
* Colocar pasta – os emails importados serão automaticamente colocados na pasta de usuário especificada.

## Modelos de Email

Os modelos de email estão disponíveis em Email > menu suspenso no canto superior direito> Modelos de email. Podem ser usados para emails em massa e email regular. A caixa de verificação `One-off` significa que o modelo de email será usado apenas uma vez, que é usual para o marketing por email.

É possível usar os espaços reservados da pasta no corpo do modelo de email e o assunto, por exemplo. {Account.name}, {Person.emailAddress}. Serão substituídos por valores de registros relacionados.

 Você pode usar marcadores de espaço de pasta reservados adicionais no corpo do modelo: {optOutUrl} e {optOutLink}.
```

<a href="{optOutUrl}">Cancelar a inscrição</a>
```

Esse é uma ligação para cancelar a inscrição de email em massa.
