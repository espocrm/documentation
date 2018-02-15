# Relatórios

O recurso Relatórios está disponível em [Pacote Avançado](https://www.espocrm.com/extensions/advanced-pack/).

Existem dois tipos de relatórios: Lista e Grade. 

## Listar Relatórios

Listar relatórios resulta a lista de registros que seguem critérios especificos.

Para criar um novo relatório da lista, clique na aba Relatórios e clique em Criar Botão de Relatório. Escolha o Tipo de Entidade que você necessita e clique em Criar botão na seção de Relatório da Lista.

No campo _Colunas_ escolha o campo que você gostaria ver exibido. Abaixo você pode especificar os parâmetros de exibição para cada uma das coluna, p.e. largura e alinhamento.

Escolha a classificação necessária no campo _Ordem de Lista_ . 

Na seção _Filtros_ você pode especificar os critérios que determinam quais os registros que serão listados no seu relatório. Você pode usar os operadores lógicos 'OU' e 'E' aqui.

Os _Filtros de Tempo de Execução_ permitem que você especifique diferentes filtros antes de executar o relatório.

Você pode __exportar__ a lista de registro de resultados para o excel e em formato csv.

## Registros de Grade

Os relatórios de grade resultam de valores resumidos e agrupados por campos especificados. Esses relatórios podem ser exibidos como um gráfico.

![Registros de grade](../_static/images/user-guide/reports/grid.png)

Para você criar um novo relatório de grade, clique na aba Relatórios e em seguida clique no botão Criar relatório. Escolha o Tipo de Entidade necessário e clique em Criar botão na seção Relatório de Grade.

No campo _Grupo Por_, escolha um ou dois campos para os quais os dados do relatório devem ser agrupados. É possível agrupar por ano, mês, dia para os campos de data. Se você agrupar por dois campos, o seu relatório será considerado como tridimensional.

No campo _Colunas_, selecione uma ou mais funções agregadas como COUNT, SUM (soma), MIN, MAX, AVG (média).

O campo _Ordem por_ defina como os dados do relatório serão classificados.

Na seção _Filtros_ podes especificar critérios que determinam quais os registros que serão usados no teu relatório. Você pode usar os operadores lógicos 'OU' e 'E' aqui.

Os _Filtros de Tempo de Execução_ permitem que especifiques os diferentes filtros antes de executar o relatório.

O relatório Grade permite exibir os resultados num gráfico. Existem os seguintes _tipos de gráficos_: Barra (Horizontal), Barra (Vertical), Torta, Linha.

É impossivel __exportar__ os resultados em grade para o excel e em formatos csv.

## Filtros

### Campo de filtro

Tipo de filtro simples de usar. Você também pode escolher os campos da entidade alvo, bem como as entidades relacionadas.

![Campo de filtro](../_static/images/user-guide/reports/filter-field.png)

### OU grupo

OU significa que pelo menos uma condição do grupo deve ser cumprida.

![OU grupo](../_static/images/user-guide/reports/filter-or.png)

### E grupo

E significa que todas as condições do grupo devem ser atendidas.

### NÃO grupo

Fornece uma capacidade de filtrar registros que não correspondem aos critérios especificados. Por exemplo. listar as contas que não têm qualquer oportunidade de status com os Ganhos Fechados ou Perdidos Fechados.

![NÃO grupo](../_static/images/user-guide/reports/filter-not.png)

### Expressão Complexa

Para um uso mais avançado. Você pode aplicar a função para uma determinada coluna da base de dados e compará-la com o resultado da expressão da [formula](../administration/formula.md).

Nota: Se você precisar de comparar apenas com um valor de cadeia simples, você deve colocá-lo em citações simples `'alguma cadeia'`.

Nota: Funções destinadas a interagir com registro de entidade não irão funcionar aqui porque a fórmula não é aplicada no registro específico.

![Expressão Complexa do filtro](../_static/images/user-guide/reports/filter-complex.png)

## Exibindo no painel

Você pode exibir qualquer relatório no painel. Para isso, você precisa de adicionar o Relatório dashlet e em seguida escolhe o relatório necessário nas opções do dashlet.

## Envio de Email

É possível você fazer o sistema enviar regularmente relatórios de resultados a determinados usuários, de acordo com o tempo especificado. Isso deve ser configurado individualmente para determinados relatórios.

## Sincronização com Listas de Destino

É possível ter listas de destino sincronizadas com os resultados do relatório da lista. É conveniente para o email massivo quando desejas enviar e-mails apenas para contatos que cumpram com alguns dos critérios no momento do envio. Este recurso está disponível na visualização detalhada de qualquer lista de destino no painel 'Sincronizar com Relatórios'.
