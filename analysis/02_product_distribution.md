# 02 — Distribuição de Produtos entre os Depósitos

## Pergunta de negócio

Como os produtos estão distribuídos entre os depósitos? Existem linhas de produtos concentradas em determinadas instalações?

## Objetivo

Identificar como os SKUs e as linhas de produtos estão distribuídos entre os quatro depósitos da Mint Classics Company.

Essa análise é importante porque a quantidade total de unidades armazenadas em um depósito, isoladamente, não determina sua importância operacional. Um depósito com menos unidades pode armazenar produtos ou linhas de produtos que não estão disponíveis nas demais instalações.

## Abordagem

A análise utiliza as tabelas `products`, `warehouses` e `productlines`, considerando principalmente:

* quantidade de produtos armazenados em cada depósito;
* quantidade de unidades em estoque;
* distribuição das linhas de produtos;
* concentração de determinadas linhas em depósitos específicos;
* quantidade de depósitos nos quais cada linha de produtos está presente.

## Distribuição de produtos por depósito

| Depósito | Código | Produtos (SKUs) |
| -------- | -----: | --------------: |
| East     |      B |              38 |
| North    |      A |              25 |
| West     |      C |              24 |
| South    |      D |              22 |

O depósito East possui a maior quantidade de SKUs, enquanto South possui a menor quantidade.

## Distribuição por linha de produto

A análise também deve verificar a relação entre `warehouseCode` e `productLine`, permitindo identificar se determinadas linhas estão concentradas em um único depósito ou distribuídas entre várias instalações.

Essa informação é relevante para uma eventual reorganização do estoque. Caso uma linha de produtos esteja presente exclusivamente em um depósito, o fechamento dessa instalação exigiria a transferência desses produtos para outro local.

## Principais observações

* East concentra a maior quantidade de produtos cadastrados no estoque.
* South possui a menor quantidade de SKUs entre os quatro depósitos.
* A quantidade de SKUs, entretanto, não é suficiente para determinar qual depósito pode ser fechado.
* É necessário verificar se os produtos armazenados em South também estão presentes nos demais depósitos.
* Linhas de produtos concentradas em uma única instalação representam uma dependência operacional que deve ser considerada antes de qualquer fechamento.

## Implicação para a reorganização

Um depósito pode apresentar baixo volume de estoque e ainda ser operacionalmente relevante caso contenha produtos que não estejam disponíveis nas outras instalações.

Portanto, antes de considerar o fechamento de um depósito, é necessário determinar se seu estoque pode ser redistribuído sem criar indisponibilidade de produtos ou comprometer o atendimento dos pedidos.

## Próxima análise

A próxima etapa será avaliar a **capacidade utilizada de cada depósito**, verificando quanto da capacidade disponível está sendo ocupada e quais instalações possuem espaço suficiente para absorver estoque adicional.

Essa análise será utilizada posteriormente em conjunto com a distribuição de produtos, vendas e possibilidade de redistribuição do estoque.
