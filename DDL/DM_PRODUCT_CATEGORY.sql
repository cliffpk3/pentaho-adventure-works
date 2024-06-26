CREATE TABLE ADVENTUREWORKS2019.DM_PRODUCT_CATEGORY (
    NK_SUBCATEGORY INT NOT NULL,
    DS_SUBCATEGORY NVARCHAR(255) NOT NULL,
    ID_CATEGORY INT NOT NULL,
    DS_CATEGORY NVARCHAR(255) NOT NULL,
    DT_REGUPDATE_PS DATE NOT NULL,
    DT_REGUPDATE_PC DATE NOT NULL,
    DT_DELETE DATETIME,
    DT_CARGA DATETIME NOT NULL
);

SELECT
    -1 AS NK_SUBCATEGORY,
    'NO SUBCATEGORY NAME' AS DS_SUBCATEGORY,
    -1 AS ID_CATEGORY,
    'NO CATEGORY NAME' AS DS_CATEGORY,
    CURRENT_DATE() AS DT_REGUPDATE_PS,
    CURRENT_DATE() AS DT_REGUPDATE_PC,
    NOW() AS DT_CARGA

UNION ALL

SELECT
    PS.PRODUCTSUBCATEGORYID AS NK_SUBCATEGORY,
    PS.NAME AS DS_SUBCATEGORY,
    PC.PRODUCTCATEGORYID AS ID_CATEGORY,
    PC.NAME AS DS_CATEGORY,
    PS.MODIFIEDDATE AS DT_REGUPDATE_PS,
    PC.MODIFIEDDATE AS DT_REGUPDATE_PC,
    NOW() AS DT_CARGA
FROM
    PRODUCTION.PRODUCTSUBCATEGORY PS
LEFT JOIN
    PRODUCTION.PRODUCTCATEGORY PC ON PS.PRODUCTCATEGORYID = PC.PRODUCTCATEGORYID

WHERE
    1=1;
--      AND CONVERT(MODIFIEDDATE, DATE) >= CURDATE() - INTERVAL 7 DAY;
