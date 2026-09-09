# Mint Classics — Inventory Analysis

## Sobre o projeto

Este projeto apresenta uma análise exploratória de dados desenvolvida para a **Mint Classics Company**, uma empresa fictícia do setor de varejo de modelos clássicos de carros e outros veículos.

A empresa está avaliando a possibilidade de **fechar uma de suas quatro instalações de armazenamento** e precisa identificar oportunidades para reorganizar ou reduzir seu estoque sem comprometer a capacidade de atender aos pedidos dos clientes dentro do prazo esperado.

O objetivo da análise é utilizar dados de estoque, vendas e armazenamento para identificar padrões que possam apoiar uma decisão de negócio baseada em dados.

> Projeto guiado desenvolvido durante a formação em Data Analytics da Coursera, utilizando MySQL e MySQL Workbench.

---

## Objetivos

A análise busca responder principalmente às seguintes questões:

* Como os produtos estão distribuídos entre os depósitos?
* Qual é a relação entre quantidade em estoque e quantidade vendida?
* Existem produtos com estoque elevado em relação à demanda?
* Existem produtos que apresentam pouca ou nenhuma movimentação?
* Quais depósitos apresentam maior concentração de estoque?
* É possível identificar oportunidades de reorganização ou redução do inventário?
* Quais fatores devem ser considerados antes de desativar um depósito?

---

## Tecnologias utilizadas

* **MySQL**
* **MySQL Workbench**
* **SQL**
* Banco de dados relacional
* Consultas analíticas
* Agregações e agrupamentos
* `JOIN`
* `GROUP BY`
* `HAVING`
* Subqueries
* Análise de estoque e vendas

---

## Banco de dados

O banco de dados `mintclassics` possui informações relacionadas a:

| Tabela         | Descrição                                           |
| -------------- | --------------------------------------------------- |
| `products`     | Produtos, estoque, preços e depósito associado      |
| `productlines` | Linhas de produtos                                  |
| `warehouses`   | Instalações de armazenamento e capacidade utilizada |
| `orders`       | Pedidos realizados pelos clientes                   |
| `orderdetails` | Produtos e quantidades presentes em cada pedido     |
| `customers`    | Informações dos clientes                            |
| `employees`    | Funcionários e representantes de vendas             |
| `offices`      | Escritórios da empresa                              |
| `payments`     | Pagamentos realizados pelos clientes                |

### Principais relacionamentos

A análise utiliza principalmente os relacionamentos entre:

```text
products
   │
   ├── productlines
   │
   └── warehouses

orders
   │
   └── orderdetails
           │
           └── products
```

Esses relacionamentos permitem comparar o **estoque disponível** com a **demanda observada nos pedidos**.

---

## Abordagem da análise

### 1. Exploração do banco de dados

Inicialmente foi realizada uma exploração da estrutura do banco de dados para compreender:

* tabelas disponíveis;
* chaves primárias e estrangeiras;
* relacionamentos entre entidades;
* atributos relacionados ao estoque;
* informações de vendas e pedidos.

O objetivo dessa etapa foi identificar quais tabelas poderiam fornecer informações relevantes para a decisão de redução do inventário.

---

### 2. Análise da distribuição do estoque

Os produtos foram agrupados por depósito para identificar a concentração de unidades armazenadas em cada instalação.

O banco possui quatro depósitos:

| Código | Depósito | Capacidade utilizada |
| ------ | -------- | -------------------: |
| A      | North    |                  72% |
| B      | East     |                  67% |
| C      | West     |                  50% |
| D      | South    |                  75% |

A quantidade total de unidades em estoque foi comparada entre os depósitos para identificar quais instalações concentram maior volume de inventário.

---

### 3. Comparação entre estoque e vendas

A quantidade atualmente armazenada de cada produto foi comparada com a quantidade vendida registrada em `orderdetails`.

Essa análise permite identificar situações como:

* produtos com estoque elevado e demanda significativa;
* produtos com estoque elevado e baixa demanda;
* produtos com maior giro;
* produtos potencialmente superdimensionados em estoque.

Uma das métricas utilizadas é a relação entre estoque disponível e quantidade vendida:

```text
Stock-to-Sales Ratio =
Quantidade em estoque / Quantidade vendida
```

Quanto maior essa relação, maior é o estoque disponível em comparação com a demanda observada.

---

### 4. Identificação de produtos sem movimentação

A análise também investigou produtos que permanecem em estoque sem registros de vendas.

Foi identificado um caso particularmente relevante:

**1985 Toyota Supra (`S18_3233`)**

* Estoque: **7.733 unidades**
* Unidades vendidas: **0**
* Depósito: **East**

Esse tipo de ocorrência representa um potencial ponto de investigação para redução de estoque ou revisão da permanência do produto no portfólio.

> A ausência de vendas no período analisado não significa, isoladamente, que o produto deva ser descontinuado. É necessário considerar fatores como histórico temporal, estratégia comercial e demanda futura.

---

## Principais insights

A análise inicial do banco de dados indica diferenças relevantes entre os depósitos.

O depósito **East** concentra o maior volume absoluto de estoque, enquanto o depósito **South** apresenta a maior taxa de capacidade utilizada.

Também foi observada uma diferença entre a participação de cada depósito no estoque e sua participação nas unidades vendidas, indicando que simplesmente comparar capacidade de armazenamento não é suficiente para determinar qual instalação deve ser fechada.

A análise produto a produto também revelou a existência de estoque sem movimentação registrada, além de produtos com níveis de estoque significativamente superiores às vendas observadas.

Esses resultados indicam que uma eventual consolidação de depósitos deveria ser acompanhada por uma **redistribuição estratégica do inventário**, considerando simultaneamente:

* volume de estoque;
* demanda histórica;
* giro dos produtos;
* capacidade dos depósitos;
* localização dos produtos;
* prazo de atendimento aos pedidos.

---

## Recomendações

Com base nos dados analisados, algumas estratégias podem ser consideradas:

### Redução de estoque de produtos de baixa demanda

Identificar produtos com baixa relação entre vendas e estoque e avaliar a possibilidade de:

* reduzir compras futuras;
* transferir unidades entre depósitos;
* realizar campanhas de venda;
* revisar sua permanência no portfólio.

### Redistribuição do inventário

Antes de fechar uma instalação, os produtos armazenados nela devem ser analisados individualmente para determinar:

* quais produtos precisam permanecer próximos de determinados mercados;
* quais podem ser transferidos;
* qual será o impacto sobre a capacidade dos depósitos restantes.

### Monitoramento de produtos sem movimentação

Produtos sem vendas registradas devem ser classificados como candidatos à investigação de estoque obsoleto ou excesso de inventário.

### Utilização de métricas de giro

A decisão não deve considerar apenas a quantidade absoluta de produtos armazenados.

Uma instalação com grande estoque pode ser necessária caso concentre produtos de alta demanda. Da mesma forma, um depósito com menor estoque pode conter produtos críticos para o atendimento dos pedidos.

---

## Exemplos de consultas SQL

### Produtos sem vendas registradas

```sql
SELECT
    p.productCode,
    p.productName,
    p.quantityInStock,
    p.warehouseCode
FROM products p
LEFT JOIN orderdetails od
    ON p.productCode = od.productCode
WHERE od.productCode IS NULL;
```

### Estoque por depósito

```sql
SELECT
    w.warehouseCode,
    w.warehouseName,
    w.warehousePctCap,
    SUM(p.quantityInStock) AS totalStock
FROM warehouses w
JOIN products p
    ON w.warehouseCode = p.warehouseCode
GROUP BY
    w.warehouseCode,
    w.warehouseName,
    w.warehousePctCap
ORDER BY totalStock DESC;
```

### Estoque versus vendas por produto

```sql
SELECT
    p.productCode,
    p.productName,
    p.quantityInStock,
    COALESCE(SUM(od.quantityOrdered), 0) AS unitsSold,
    CASE
        WHEN COALESCE(SUM(od.quantityOrdered), 0) = 0
            THEN NULL
        ELSE
            p.quantityInStock /
            SUM(od.quantityOrdered)
    END AS stockToSalesRatio
FROM products p
LEFT JOIN orderdetails od
    ON p.productCode = od.productCode
GROUP BY
    p.productCode,
    p.productName,
    p.quantityInStock
ORDER BY stockToSalesRatio DESC;
```

---

## Conclusão

Este projeto demonstra a aplicação de **SQL para análise exploratória de dados em um banco de dados relacional**, utilizando informações de estoque, vendas e armazenamento para investigar um problema de negócio.

Mais do que simplesmente consultar dados, a análise busca transformar informações operacionais em **insights que possam apoiar decisões relacionadas à gestão de inventário e otimização da estrutura de armazenamento**.

### Competências demonstradas

* SQL
* MySQL
* MySQL Workbench
* Análise exploratória de dados
* Bancos de dados relacionais
* Data Analysis
* Inventory Analysis
* Business Intelligence
* Data-driven Decision Making

---

## Fonte

Projeto guiado desenvolvido como parte da formação em **Data Analytics — Coursera**.

O banco de dados utilizado é o conjunto de dados disponibilizado para o projeto Mint Classics Company.
