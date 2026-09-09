-- ============================================================
-- Mint Classics - Inventory Analysis
-- Question 02: Product Distribution by Warehouse
-- ============================================================

-- Q2.1
-- How many different products are stored in each warehouse?

SELECT
    w.warehouseCode,
    w.warehouseName,
    COUNT(p.productCode) AS numberOfProducts
FROM warehouses w
INNER JOIN products p
    ON w.warehouseCode = p.warehouseCode
GROUP BY
    w.warehouseCode,
    w.warehouseName
ORDER BY numberOfProducts DESC;

...

-- Q2.2
-- How is the product portfolio distributed across warehouses?

SELECT
    w.warehouseName AS warehouse,
    p.productLine,
    COUNT(p.productCode) AS numberOfProducts,
    SUM(p.quantityInStock) AS unitsInStock
FROM products p
INNER JOIN warehouses w
    ON p.warehouseCode = w.warehouseCode
GROUP BY
    w.warehouseName,
    p.productLine
ORDER BY
    w.warehouseName,
    unitsInStock DESC;
  
...

-- Q2.3
-- How many warehouses store each product line?

SELECT
    p.productLine,
    COUNT(DISTINCT p.warehouseCode) AS numberOfWarehouses
FROM products p
GROUP BY p.productLine
ORDER BY numberOfWarehouses;
  
...

-- Q2.4
-- Which product lines are concentrated in specific warehouses?

SELECT
    p.productLine,
    w.warehouseName,
    SUM(p.quantityInStock) AS unitsInStock
FROM products p
INNER JOIN warehouses w
    ON p.warehouseCode = w.warehouseCode
GROUP BY
    p.productLine,
    w.warehouseName
ORDER BY
    p.productLine,
    unitsInStock DESC;
  
...
