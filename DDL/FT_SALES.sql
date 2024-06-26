CREATE TABLE ADVENTUREWORKS2019.FT_SALES (
    DT_ORDER INT(8) NOT NULL,
    ID_ORDER INT NOT NULL,
    NK_PRODUCT INT NOT NULL,
    NK_PROMOTION INT NOT NULL,
    NK_SUBCATEGORY INT NOT NULL, 
    NK_CUSTOMER INT NOT NULL, 
    NK_ADDRESS INT NOT NULL, 
    NK_SALESPERSON INT,
    NR_QTY INT NOT NULL,
    VL_PRICE DECIMAL(18, 2) NOT NULL, 
    RL_DISCOUNT DECIMAL(18, 2) NOT NULL,
    VL_PD_TOTAL DECIMAL(18, 2) NOT NULL,
    VL_SUBTOTAL DECIMAL(18, 2) NOT NULL, 
    VL_TAX DECIMAL(18, 2) NOT NULL, 
    VL_FREIGHT DECIMAL(18, 2) NOT NULL, 
    VL_TOTAL DECIMAL(18, 2) NOT NULL,
    DT_DELETE DATETIME,
    DT_CARGA DATETIME NOT NULL,
    PRIMARY KEY (DT_ORDER, ID_ORDER)
);

SELECT 
    CAST(REPLACE(REPLACE(REPLACE(CAST(DATE_FORMAT(SOH.ORDERDATE, '%Y-%m-%d') AS CHAR), ':', ''), '/', ''), '-', '') AS UNSIGNED) AS DT_ORDER,
    CONCAT(SOH.SALESORDERID, SOD.PRODUCTID) AS ID_ORDER,
    IFNULL(SOD.PRODUCTID, -1) AS NK_PRODUCT,
    IFNULL(SOD.SPECIALOFFERID, -1) AS NK_PROMOTION,
    IFNULL(P.PRODUCTSUBCATEGORYID, -1) AS NK_SUBCATEGORY,
    IFNULL(SOH.CUSTOMERID, -1) AS NK_CUSTOMER,
    IFNULL(SOH.SHIPTOADDRESSID, -1) AS NK_ADDRESS,
    IFNULL(SOH.SALESPERSONID, -1) AS NK_SALESPERSON,
    IFNULL(SOD.ORDERQTY, -1) AS NR_QTY,
    SOD.UNITPRICE AS VL_PRICE,
    SOD.UNITPRICEDISCOUNT AS RL_DISCOUNT,
    SOD.LINETOTAL AS VL_PD_TOTAL,
    SOH.SUBTOTAL AS VL_SUBTOTAL,
    SOH.TAXAMT AS VL_TAX,
    SOH.FREIGHT AS VL_FREIGHT,
    SOH.TOTALDUE AS VL_TOTAL,
    CURRENT_TIMESTAMP() AS DT_CARGA
FROM 
    SALES.SALESORDERHEADER SOH
LEFT JOIN 
    SALES.SALESORDERDETAIL SOD ON SOH.SALESORDERID = SOD.SALESORDERID
LEFT JOIN 
    SALES.CUSTOMER C ON SOH.CUSTOMERID = C.CUSTOMERID
LEFT JOIN 
    PRODUCTION.PRODUCT P ON SOD.PRODUCTID = P.PRODUCTID
LEFT JOIN 
    PRODUCTION.PRODUCTSUBCATEGORY PS ON P.PRODUCTSUBCATEGORYID = PS.PRODUCTSUBCATEGORYID;
