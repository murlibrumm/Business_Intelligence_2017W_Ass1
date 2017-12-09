SET @customer_rank := 0;
SET @product_rank := 0;
SET @current_customer := 0;
SELECT customerRank AS 'Customer Rank', CustomerName AS 'Customer Name', productRank AS 'Product Rank', ProductName AS 'Product Name'
FROM (
		SELECT customerRank, CustomerName, ProductName, 
			@product_rank := IF(@current_customer = customerRank, @product_rank + 1, 1) AS productRank,
			@current_customer := customerRank AS currentCustomer
		FROM (
			SELECT profit.Rank AS customerRank, c.Name AS CustomerName,
				p.Name AS ProductName, COUNT(fs.ProductID) AS ProductCount
			FROM ((DM_FactSales fs
			JOIN DM_Product p ON p.ProductID = fs.ProductID)
			JOIN DM_Customer c ON c.CustomerID = fs.CustomerID)
			JOIN (
					SELECT @customer_rank := @customer_rank + 1 AS Rank, CustomerID
					FROM(
							SELECT fs.CustomerID, SUM(fs.OrderLineProfit) AS TotalProfit
							FROM DM_FactSales fs
							GROUP BY fs.CustomerID
							ORDER BY TotalProfit DESC
							LIMIT 5
					) AS BestCustomers
			) profit ON profit.CustomerID = fs.CustomerID
			GROUP BY fs.CustomerID, fs.ProductID
			ORDER BY profit.Rank ASC, ProductCount DESC
		) AS CustomerProduct
) AS FinalList
WHERE productRank < 5;