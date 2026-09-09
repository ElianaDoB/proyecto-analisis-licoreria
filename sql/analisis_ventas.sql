
-- ============================================================
-- PROYECTO: Análisis de Ventas - Licorería
-- ARCHIVO: analisis_ventas.sql
-- ============================================================

-- 1. FACTURACIÓN POR CATEGORÍA

SELECT
    categoria,
    SUM(cantidad) AS unidades,
    SUM(ingreso) AS facturacion,
    SUM(ganancia) AS ganancia,
    ROUND(SUM(ganancia) * 100.0 / SUM(ingreso), 2) AS margen_pct
FROM ventas
GROUP BY categoria
ORDER BY facturacion DESC;


-- 2. TOP 5 PRODUCTOS POR FACTURACIÓN

SELECT
    producto,
    SUM(cantidad) AS unidades,
    SUM(ingreso) AS facturacion,
    SUM(ganancia) AS ganancia
FROM ventas
GROUP BY producto
ORDER BY facturacion DESC
LIMIT 5;


-- 3. CATEGORÍAS CON MÁS DE 1500 DE FACTURACIÓN TOTAL

SELECT
    categoria,
    SUM(cantidad) AS unidades,
    SUM(ingreso) AS facturacion,
    SUM(ganancia) AS ganancia
FROM ventas
GROUP BY categoria
HAVING SUM(ingreso) > 1500
ORDER BY facturacion DESC;
