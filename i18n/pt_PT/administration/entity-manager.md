# Gestor de Entidades

O Gestor de Entidades está disponível através do painel 'Administração'. Ele fornece uma capacidade altamente personalizar sua instância de EspoCRM. Tu és capaz de fazer o seguinte:

* Adicionar novos tipos de entidades.
* Personalizar tipos de entidades existentes: mudas rótulos, ordem padrão visto como lista, habilitar ou desabilitar transmissão.
* Configurar campos: adicionar novo, personalizar os existentes.
* Configurar relacionamentos: adicionar novo, mudar rótulos dos existentes.

## Criando novas entidades

Clique no botão 'Criar Entidade' na página do Gestor de Entidades Especificar nome, rótolo e tipo. Se selecionares o tipo 'Pessoa', sua entidade vai ter os campos Email, Telefone, Primeiro Nome, Último Nome e Saudação. Marque 'Transmissão' se quiseres que a sua entidade tenha um painel de transmissão e os utilizadores sejam capazes de 'Seguir' entidades desse tipo.

Tipos:

* Básico - apenas uma entidade vazia com campos básicos como Nome, Usuário Designado, Equipas, Descrição.
* Básico Maior - como o Básico, porém com os painéis Atividades, Histórico e Tarefas (disponível desde a versão 4.3.0).
* Evento - campos Data de Início, Data de Fim, Duração, Superior, Estado. Disponível no painel Calendário e Atividades (desde 4.3.0, deve estar habilitada em Administração > Opções).
* Pessoa - campos Email, Telefone, Primeiro Nome, Último Nome, Saudação, Endereço. Painéis Atividades, Histórico, Tarefas.
* Companhia - campos Email, Telefone, Endereço de Cobrança, Endereço de Entrega. Painéis Atividades, Histórico, Tarefas.

## Atualizar entidade existente

Se clicares no link 'Editar' numa certa entidade, tu serás capaz de mudar alguns parâmetros daquela entidade.

* Rótulos - nomes singular e plural da entidade.
* Os registros de ordem padrão são organizados nas visualizações de listas. 
* Transmissão - se o recurso Transmissão está ativado para esta entidade.
* Desabilitado - marca se não precisares dessa entidade no teu sistema.
* Filtros de Campos de Texto - quais campos 'pesquisar por' para o filtro de texto principal e pesquisa global


## Campos

Ao clicar no link 'Campos' serás direcionado para uma página separada. Lá serás capaz de criar novos campos ou atualizar os existentes. Os tipos seguintes de campos estão disponíveis no Gerenciador de Entidades:

* Endereço - endereço com rua, cidade, estado, código postal e país;
* Arranjo - lista de valores, com a capacidade de selecionar valores múltiplos (não é uma boa opção se precisares de pesquisar através desse campo); os utilizadores podem adicionar os seus próprios valores se as opções não foram especificadas.
* Anexar Múltiplo - anexar vários arquivos;
* Auto-incremento - lê o número gerado;
* Booleano - caixa para marcar, verdadeiro ou falso;
* Moeda - para valores monetários;
* Data;
* Hora;
* Enum - caixa de seleção, com a capacidade de selecionar somente um valor;
* Arquivo - carregar um arquivo;
* Decimal - número com casas decimais;
* Externo - um campo de uma entidade relacionada;
* Imagem - carregar um arquivo de imagem com pré-visualização;
* Inteiro - número inteiro;
* Número - número em uma sequência de caracteres que se auto-incrementa, com um possível prefixo e um tamanho específico;
* Multi-enum - lista de valores, com a capacidade de selecionar valores múltiplos (não é uma boa opção se você necessita pesquisar nesse campo), similar ao Arranjo mas melhor.
* Texto - área de texto, para longos textos de multilinhas;
* URL - para links;
* Varchar - texto curto;
* Wysiwyg - parecido com o campo Texto, com a capacidade de formatar texto.

Parâmetros:
* Requeridos - se o preenchimento do campo é obrigatório.
* Valor Padrão - Valor do campo definido através da criação de um novo registro.
* Auditado - atualizações do campo serão registradas na Transmissão

**Nota**: Após teres de adicionar um novo campo, precisas de colocar esse campo em [layouts](layout-manager.md) (Administração > Gestor de Layout).

### Lógica Dinâmica

Fornece uma capacidade de fazer formulários dinâmicos. É possível definis condições fazendo certos campos visíveis, obrigatórios ou somente leitura. Condições serão verificadas automaticamente quando os dados nos formulários mudarem.

Para os campos Enum, Arranjo e Multi-enum, é possível definir diferentes conjuntos de opções que estarão disponíveis para o campo dependendo em qual condição foi satisfeita.


## Relacionamentos

Podes criar novos relacionamentos entre ambos fora-da-caixa ou entidades personalizadas. Existem 3 tipos de relacionamentos disponíveis:

* Um-Para-Muitos: após teres criado esse relacionamento podes colocar um campo para link para os detalhes do layout da entidade da direita e adicionar um painel de relacionamento à entidade da esquerda;
* Muitos-Para-Um: o mesmo que Um-Para-Muitos, porém ao contrário;
* Muitos-Para-Muitos: painéis de relacionamento em ambos os lados.

O parâmetro 'Ligar Vários Campos' implica que o campo do tipo 'linkMultiple' será criado junto ao relacionamento. Podes colocar tal campo no layout. É conveniente para rápida escolha de registros relacionados. Não é uma boa opção se seu relacionamento é intencionado para ter muitos registros ligados, que pode causar lentidão no carregamento de detalhes no ecrã de visualização.

Se o parâmetro 'Auditado' está marcado, então as atualizações dos relacionamentos serão registradas na Transmissão.
