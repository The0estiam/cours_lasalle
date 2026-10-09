CREATE OR REPLACE TABLE `lasalle-big-data.exam_theo.silver_products` AS
SELECT
    SAFE_CAST(product_id AS INT64) AS identifiant_produit,
    REGEXP_REPLACE(TRIM(name), r' [0-9]+$', '') AS nom,
    category AS categorie,
    SAFE_CAST(cost AS FLOAT64) AS cout,
    retail_price AS prix_vente,
    is_active AS est_actif,
    SAFE_CAST(added_date AS DATE) AS date_ajout
FROM `lasalle-big-data.exam_theo.bronze_products`
ORDER BY date_ajout DESC;