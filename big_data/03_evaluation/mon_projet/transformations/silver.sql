CREATE OR REPLACE TABLE `lasalle-big-data.exam_theo.silver_products` AS
SELECT
    SAFE_CAST(product_id AS INT64) AS identifiant_produit,
    REGEXP_REPLACE(TRIM(name), r' [0-9]+$', '') AS nom,
    UPPER(TRIM(category)) AS categorie,
    SAFE_CAST(cost AS FLOAT64) AS cout,
    retail_price AS prix_vente,
    is_active AS est_actif,
    SAFE_CAST(added_date AS DATE) AS date_ajout
FROM `lasalle-big-data.exam_theo.bronze_products`
ORDER BY date_ajout DESC;

-- J'ai transormé l'id en INT64, le nom en supprimant les chiffres à la fin,
-- la catégorie en majuscule et en supprimant les espaces pour régler les doublons, le coût en FLOAT64,
-- et j'ai renommé les colonnes pour qu'elles soient plus claires en français. 

-- Je les ais triées par date d'ajout pour avoir les plus récentes en premier.