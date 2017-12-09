SET @customer_rank := 0;
SET @product_rank := 0;
SET @current_customer := 0;
SELECT customerRank AS 'Customer Rank', CustomerName AS 'Customer Name', productRank AS 'Product Rank', ProductName AS 'Product Name'
FROM (
		SELECT customerRank, CustomerName, ProductName, 
			@product_rank := IF(@current_customer = customerRank, @product_rank + 1, 1) AS productRank,
			@current_customer := customerRank AS currentCustomer
		FROM (
			SELECT b.Rank AS customerRank, CONCAT_WS('', c.FirstName, ' ', c.LastName) AS CustomerName,
				p.Name AS ProductName, COUNT(d.ProductID) AS ProductCount
			FROM (((TB_SalesOrderDetail d
			JOIN TB_SalesOrderHeader h ON d.SalesOrderID = h.SalesOrderID)
			JOIN TB_Product p ON p.ProductID = d.ProductID)
			JOIN TB_Customer c ON c.CustomerID = h.CustomerID)
			JOIN (
					SELECT @customer_rank := @customer_rank + 1 AS Rank, CustomerID
					FROM(
							SELECT h.CustomerID, SUM(d.UnitPrice) AS TotalPrice
							FROM TB_SalesOrderDetail d
							JOIN TB_SalesOrderHeader h ON d.SalesOrderID = h.SalesOrderID
							GROUP BY h.CustomerID
							ORDER BY TotalPrice DESC
							LIMIT 5
					) AS BestCustomers
			) b ON b.CustomerID = h.CustomerID
			GROUP BY h.CustomerID, d.ProductID
			ORDER BY b.Rank ASC, ProductCount DESC
		) AS CustomerProduct
) AS FinalList
WHERE productRank < 5;