# Pergunta 1 — Como o estoque está distribuído entre os depósitos?

## Pergunta de negócio

Quantas unidades estão armazenadas em cada depósito e qual percentual do estoque total está concentrado em cada instalação?

## Abordagem

Foi realizada uma consulta SQL relacionando as tabelas `warehouses` e `products`. O estoque foi agrupado por depósito para calcular a quantidade de produtos armazenados e o total de unidades em estoque.

Também foi calculada a participação percentual de cada depósito no estoque total da empresa.

## Resultado

| Depósito  | Produtos | Unidades em estoque | % do estoque |
| --------- | -------: | ------------------: | -----------: |
| East      |       38 |             219.183 |       39,51% |
| North     |       25 |             131.688 |       23,74% |
| West      |       24 |             124.880 |       22,51% |
| South     |       22 |              78.966 |       14,24% |
| **Total** |  **109** |         **554.717** |     **100%** |

## Insight

O depósito East concentra a maior quantidade de estoque, representando 39,51% das unidades armazenadas e contendo 38 dos 109 produtos analisados.

O depósito South apresenta a menor quantidade absoluta de estoque, com 14,24% das unidades.

Entretanto, a quantidade de unidades armazenadas não é suficiente para determinar qual depósito poderia ser fechado. É necessário avaliar a capacidade utilizada, a demanda dos produtos e a possibilidade de redistribuição do estoque.

## Implicação para o negócio

A análise indica que existe uma diferença significativa na concentração do estoque entre os depósitos. O South apresenta o menor volume absoluto de unidades, mas essa informação precisa ser confrontada com sua capacidade de armazenamento e com a importância dos produtos nele armazenados.

Portanto, o resultado desta etapa não determina o depósito a ser fechado, mas estabelece uma base para as próximas análises.
