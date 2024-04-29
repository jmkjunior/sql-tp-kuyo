
-- Création de la vue ALL_WORKERS qui affiche les informations des employés de toutes les usines
CREATE VIEW ALL_WORKERS AS
    SELECT
        LAST_NAME,
        FIRST_NAME,
        AGE, 
        FIRST_DAY AS START_DATE
    FROM
        WORKERS_FACTORY_1
    UNION ALL
    SELECT
        LAST_NAME,
        FIRST_NAME,
        AGE, 
        START_DATE
    FROM
        WORKERS_FACTORY_2
    ORDER BY
        START_DATE DESC;

-- Création de la vue ALL_WORKERS_ELAPSED qui donne le nombre de jours écoulés depuis l'arrivée de chaque employé
CREATE VIEW ALL_WORKERS_ELAPSED AS
    SELECT
        LAST_NAME,
        FIRST_NAME,
        AGE,
        START_DATE,
        SYSDATE - START_DATE AS DAYS_ELAPSED
    FROM
        ALL_WORKERS; 

-- Création de la vue BEST_SUPPLIERS_OVER_1000_PIECES qui affiche les fournisseurs ayant livré plus de 1000 pièces
CREATE VIEW BEST_SUPPLIERS_OVER_1000_PIECES AS 
        S.NAME,
        COUNT(SB.SPARE_PART_ID) AS TOTAL_PIECES_DELIVERED
    FROM
        SUPPLIERS S
    JOIN
        SUPPLIERS_BRING_TO_FACTORY_1 SB
    ON
        S.SUPPLIER_ID = SB.SUPPLIER_ID
    GROUP BY
        S.NAME
    HAVING
        COUNT(SB.SPARE_PART_ID) > 1000
