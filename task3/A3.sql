SELECT dim_time.CalendarYear as Year, dim_time.MonthNumberOfYear as Month, dim_product.ProductTopCategory as 'Top Product Category', 
	SUM(dim_sales.OrderLineProfit) as 'Monthly Profit'
FROM DM_FactSales dim_sales, DM_Product dim_product, DM_Time dim_time,
	(SELECT CalendarYear, MonthNumberOfYear
	FROM DM_Time
	ORDER BY CalendarYear desc, MonthNumberOfYear desc
	LIMIT 1) lastDate
WHERE dim_product.ProductID = dim_sales.ProductID
AND dim_sales.OrderDate = dim_time.Date
AND (dim_time.CalendarYear > (lastDate.CalendarYear - 2) OR 
	(dim_time.CalendarYear = lastDate.CalendarYear - 2 AND dim_time.MonthNumberOfYear > lastDate.MonthNumberOfYear))
GROUP BY Year, Month, dim_product.ProductTopCategory
ORDER BY Year, Month, dim_product.ProductTopCategory;