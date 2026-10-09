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

-- J'ai compté le nombre de produits par catégorie, 
-- calculé le prix de vente moyen et le chiffre d'affaires total (prix de vente - coût) pour chaque catégorie.

-- J'ai fait des ROUND pour que ça soit plus lisible.

-- J'ai mis la close WHERE car j'ai vu qu'il y'avais des NULL et je ne voulais pas que ça fausse les résultats.