SELECT cust.name as 'Customer Name', SUM(fact_sales.OrderLineProfit) as Profit
FROM DM_Customer cust
JOIN DM_FactSales fact_sales on fact_sales.CustomerID = cust.CustomerID
JOIN DM_Time t on t.Date = fact_sales.OrderDate
WHERE t.CalendarYear = 2014 AND t.MonthNumberofYear < 7
GROUP BY cust.CustomerID
ORDER BY Profit desc
LIMIT 10;