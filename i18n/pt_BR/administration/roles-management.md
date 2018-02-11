# Gerenciamento de Funções

## Panorama

Para restringir o acesso de alguns usuários, você precisa usar as Funções. O administrador pode gerenciar as funções no painel de administração. Cara função define um acesso a certas áreas (escopo) que é aplicada a usuários que possuem aquela função.

Um usuário pode ter várias funções. Essas funções podem ser selecionadas para um usuário em específico (campo 'Funções' na entidade Usuário) e/ou ser herdada de times que o usuário faz parte.

Se um usuário tem várias funções, elas serão unidas de forma que as regras permissivas tenham maior prioridade. Isso permite ao administrador gerenciar o controle do nível de acesso facilmente e flexivelmente.

É possível ver o quais permissões estão aplicadas a certos usuários ao clicar no botão 'Acesso' na vista detalhada do usuário.

![1](../_static/images/administration/roles-management/scope-level.png)

## Exemplo

Por exemplo, o usuário pertence ao time 'Vendas'. Esse time tem uma única função 'Vendedor'. Então todos os usuários desse time obterão a função 'Vendedor'.

A função 'Vendedor' está definida da seguinte forma:

Condução:
```
criar - sim
ler – time
editar – próprio
apagar – não
transmitir - time
```

Oportunidade:
```
criar - sim
ler – time
editar – próprio
apagar – não
transmitir - time
```

Os usuários irão ser capazes de ler somente as conduções e oportunidade que pertencem ao time 'Departamento de Vendas' (campo 'Times').
O usuário será capaz de editar somente aquelas conduções e oportunidades que eles são designados ou aqueles que eles criaram.
Os usuários não serão capazes de remover quaisquer conduções ou oportunidades.

Nós querendo dar mais direitos para certo usuário que está no cargo de gerente de vendas na companhia. Esse empregado deve ter uma capacidade de ler/editar/apagar todos os registros do time 'Vendas'. O usuário deveria pertencer ao nosso time 'Vendas'. Mas nós precisamos criar uma nova função 'Gerente de Vendas' e selecionar essa função para aquele usuário no campo 'Funções'.

A função 'Gerente de Vendas' está definida da seguinte forma:

Condução:
```
criar - sim
ler – time
editar – time
apagar – time
transmitir - time
```

Oportunidade:
```
criar - sim
ler – time
editar – time
apagar – time
transmitir - time
```

Nosso usuário será capaz de gerenciar todas as conduções e oportunidades do time 'Vendas'.

## Permissões Especiais

### Atribuição de Permissões

Defina esse parâmetro para restringir a habilidade de reatribuir registros para outro usuário e/ou times. Se você definir 'time' - então será possível atribuir somente a usuários do próprio time(s). Se 'não' - os usuários não serão capazes de reatribuir de qualquer forma.

Isso também define se o usuário é capaz de transmitir uma publicação para outros usuários/times.

### Permissões de Usuários

Permite restringir uma capacidade do usuário de ver atividades, calendário e transmissões de outros usuários.

### Permissão de Portal

Define um acesso para a informação portal, capacidade de publicar mensagens para usuários do portal.

### Permissão para a Conta de Email do Grupo

Define um acesso para as contas de email do grupo, uma capacidade de enviar emails do SMTP do grupo.

### Exportar Permissão

Define se o usuário tem uma capacidade de exportar registros. (desde a versão 4.9.0)

## Permissões Padrões 

Por padrão (se não houver qualquer uma aplicada), os usuários podem ler e editar todos os registros. Mas não podem apagar nenhum deles, exceto aqueles que eles mesmos criaram e são atribuídos a eles ao mesmo tempo.

Existe uma capacidade de restringir um acesso aplicado por padrão ao habilitar o 'Modo Estrito ACL' em Administração > Configurações.

## Segurança ao Nível do Campo

Permite controlar um acesso para campos específicos.

Por padrão, o usuário pode ler todos os campos se ele puder ler o registro. O usuário pode editar qualquer campo se ele puder editar o registro. Você pode restringir o acesso a campos específicos usando a Segurança ao Nível do Campo.

Na visualização da edição de um registro de função na sessão Nível do Campo, clique no ícone 'mais' próximo ao escopo específico, então selecione o campo desejado. Então você será capaz de especificar o nível de acesso para as ações 'ler' e 'editar'. Há duas opções: 'sim' e 'não'.

![2](../_static/images/administration/roles-management/field-level-secutiry.png)
