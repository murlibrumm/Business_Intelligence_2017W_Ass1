SET @product_rank := 0;
SET @current_category := "";
SELECT TopCategory AS 'Top Product Category', productRank AS 'Product Rank', ProductName AS 'Product Name'
FROM (
		SELECT *,
			@product_rank := IF(@current_category = TopCategory, @product_rank + 1, 1) AS productRank,
			@current_category := TopCategory AS currentCategory
		FROM (
				SELECT fs.ProductID AS ProductID, p.Name AS ProductName, COUNT(fs.ProductID) AS Cnt, p.ProductTopCategory AS TopCategory 
				FROM DM_FactSales fs
				JOIN DM_Product p ON fs.ProductID = p.ProductID
				GROUP BY fs.ProductID
				ORDER BY p.ProductTopCategory ASC, cnt DESC
		) AS GroupSales
	) AS RankSales
WHERE productRank < 4;