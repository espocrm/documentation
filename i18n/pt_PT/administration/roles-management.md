# Gerenciamento de Funções

## Panorama

Para restringir o acesso de alguns utilizadores, precisas de usar as Funções. O administrador pode gerir as funções no painel de administração. Cara função define um acesso a certas áreas (escopo) que é aplicada a utilizadores que possuem aquela função.

Um utilizador pode ter várias funções. Essas funções podem ser selecionadas para um utilizador em específico (campo 'Funções' na entidade Utilizador) e/ou ser herdada de equipas que o utilizador faz parte.

Se um utilizador tem várias funções, elas serão unidas de forma que as regras permissivas tenham maior prioridade. Isso permite ao administrador gerir o controle do nível de acesso facilmente e flexivelmente.

É possível ver quais as permissões estão aplicadas a certos utilizadores ao clicar no botão 'Acesso' na vista detalhada do utilizador.

![1](../_static/images/administration/roles-management/scope-level.png)

## Exemplo

Por exemplo, o utilizador pertence à equipa 'Vendas'. Essa equipa tem uma única função 'Vendedor'. Então todos os utilizadores dessa equipa obterão a função 'Vendedor'.

A função 'Vendedor' está definida da seguinte forma:

Condução:
```
criar - sim
ler – equipa
editar – próprio
apagar – não
transmitir - equipa
```

Oportunidade:
```
criar - sim
ler – equipa
editar – próprio
apagar – não
transmitir - equipa
```
Os utilizadores irão ser capazes de ler somente as conduções e oportunidade que pertencem à equipa 'Departamento de Vendas' (campo 'Equipas').
O utilizador será capaz de editar somente aquelas conduções e oportunidades que eles são designados ou aqueles que eles criaram.
Os utilizadores não serão capazes de remover quaisquer conduções ou oportunidades.

Nós querendo dar mais direitos para certo utilizador que está no cargo de gerente de vendas da companhia. Este empregado deve ter uma capacidade de ler/editar/apagar todos os registros da equipa 'Vendas'. O utilizador deveria pertencer à nossa equipa 'Vendas'. Mas nós precisamos criar uma nova função 'Gerente de Vendas' e selecionar essa função para aquele utilizador no campo 'Funções'.

A função 'Gerente de Vendas' está definida da seguinte forma:

Condução:
```
criar - sim
ler – equipa
editar – equipa
apagar – equipa
transmitir - equipa
```

Oportunidade:
```
criar - sim
ler – equipa
editar – equipa
apagar – equipa
transmitir - equipa
```

O nosso utilizador será capaz de gerir todas as conduções e oportunidades da equipa de 'Vendas'.

## Permissões Especiais

### Atribuição de Permissões

Defina este parâmetro para restringir a habilidade de reatribuir registros para outro utilizador e/ou equipas. Se definires 'equipa' - então será possível atribuir somente a utilizadores da própria equipa(s). Se 'não' - os utilizadores não serão capazes de reatribuir de qualquer forma.

Isso também define se o utilizador é capaz de transmitir uma publicação para outros utilizadores/equipas.

### Permissões de Utilizadores

Permite restringir uma capacidade do utilizador de ver atividades, calendário e transmissões de outros utilizadores.

### Permissão de Portal

Define um acesso para a informação portal, capacidade de publicar mensagens para utilizadores do portal.

### Permissão para a Conta de Email do Grupo

Define um acesso para as contas de email do grupo, uma capacidade de enviar emails do SMTP do grupo.

### Exportar Permissão

Define se o utilizador tem uma capacidade de exportar registros. (desde a versão 4.9.0)

## Permissões Padrões 

Por padrão (se não houver qualquer uma aplicada), os utilizadores podem ler e editar todos os registros. Mas não podem apagar nenhum deles, exceto aqueles que eles mesmos criaram e são atribuídos a eles ao mesmo tempo.

Existe uma capacidade de restringir um acesso aplicado por padrão ao habilitar o 'Modo Estrito ACL' em Administração > Configurações.

## Segurança ao Nível do Campo

Permite controlar um acesso para campos específicos.

Por padrão, o utilizador pode ler todos os campos se ele puder ler o registro. O utilizador pode editar qualquer campo se ele puder editar o registro. Podes restringir o acesso a campos específicos usando a Segurança ao Nível do Campo.

Na visualização da edição de um registro de função na sessão Nível do Campo, clica no ícone 'mais' próximo ao escopo específico, então seleciona o campo desejado. Então tu serás capaz de especificar o nível de acesso para as ações 'ler' e 'editar'. Há duas opções: 'sim' e 'não'.

![2](../_static/images/administration/roles-management/field-level-secutiry.png)
