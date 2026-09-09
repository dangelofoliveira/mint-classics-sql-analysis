SELECT
    w.warehouseCode,
    w.warehouseName,
    COUNT(p.productCode) AS numberOfProducts,
    SUM(p.quantityInStock) AS totalUnitsInStock,
    ROUND(
        SUM(p.quantityInStock) * 100.0 /
        (SELECT SUM(quantityInStock) FROM products),
        2
    ) AS stockPercentage
FROM warehouses w
INNER JOIN products p
    ON w.warehouseCode = p.warehouseCode
GROUP BY
    w.warehouseCode,
    w.warehouseName
ORDER BY totalUnitsInStock DESC;
