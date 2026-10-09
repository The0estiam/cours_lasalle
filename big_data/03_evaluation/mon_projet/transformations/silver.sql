CREATE OR REPLACE TABLE `lasalle-big-data.exam_theo.silver_products` AS
SELECT
    product_id AS identifiant_produit,
    REGEXP_REPLACE(TRIM(name), r' [0-9]+$', '') AS nom,
    cost AS cout,
    retail_price AS prix_vente,
    is_active AS est_actif,
    added_date AS date_ajout
FROM `lasalle-big-data.exam_theo.bronze_products`
ORDER BY date_ajout DESC;