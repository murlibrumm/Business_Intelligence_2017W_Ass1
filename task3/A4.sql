#NOT WORKING YET
#TOP 5 Customer
SELECT cust.name, cust.CustomerID, sum(fact_sales.OrderLineProfit) as sumProfit
FROM DM_Customer cust
JOIN DM_FactSales fact_sales on cust.CustomerID = fact_sales.CustomerID
GROUP BY cust.CustomerID
ORDER BY sumProfit desc
LIMIT 5;

#TOP 4 Products for a customer
SELECT prod.Name, sum(fact_sales.OrderLineProfit) as sumProfit
FROM DM_Customer cust
JOIN DM_FactSales fact_sales on cust.CustomerID = fact_sales.CustomerID
JOIN DM_Product prod on prod.ProductID = fact_sales.ProductID
where cust.name = 'Kelsey G. Becker'
GROUP BY prod.name
ORDER BY sumProfit desc
LIMIT 4;

SELECT topCust.Name, topProd.Name
FROM (SELECT cust.Name, cust.CustomerID, (fact_sales.OrderLineProfit) as sumProfit
FROM DM_Customer cust
JOIN DM_FactSales fact_sales on cust.CustomerID = fact_sales.CustomerID
GROUP BY cust.CustomerID
ORDER BY sumProfit desc
LIMIT 5) topCust, (SELECT prod.Name, sum(fact_sales.OrderLineProfit) as sumProfit
FROM DM_Customer cust
JOIN DM_FactSales fact_sales on cust.CustomerID = fact_sales.CustomerID
JOIN DM_Product prod on prod.ProductID = fact_sales.ProductID
where cust.CustomerID = topCust.CustomerID
GROUP BY prod.name
ORDER BY sumProfit desc
LIMIT 4) topProd;
