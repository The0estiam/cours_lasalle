CREATE OR REPLACE TABLE `lasalle-big-data.exam_theo.gold_category_metrics` AS
SELECT
    categorie,
    COUNT(identifiant_produit) AS nombre_produits,
    ROUND(AVG(prix_vente), 2) AS prix_vente_moyen,
    ROUND(SUM(prix_vente - cout), 2) AS chiffre_affaires_total
FROM `lasalle-big-data.exam_theo.silver_products`
WHERE categorie IS NOT NULL
GROUP BY categorie
ORDER BY chiffre_affaires_total DESC;