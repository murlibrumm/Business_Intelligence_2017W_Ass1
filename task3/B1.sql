@SET product_rank := 0;
@SET current_category := 0;
SELECT CName AS 'Top Product Category', productRank AS 'Product Rank', PName AS 'Product Name'
FROM (
		SELECT *,
			@product_rank := IF(@current_category = ProductCategoryID, @product_rank + 1, 1) AS productRank,
			@current_category := ProductCategoryID AS currentCategory
		FROM (
				SELECT s.ProductID AS ProductID, p.Name AS PName, COUNT(s.ProductID) AS Cnt, cb.ProductCategoryID AS ProductCategoryID, cb.Name AS CName 
				FROM ((TB_SalesOrderDetail s
				JOIN TB_Product p ON s.ProductID = p.ProductID)
				JOIN TB_ProductCategory ca ON p.ProductCategoryID = ca.ProductCategoryID)
				JOIN TB_ProductCategory cb ON ca.ParentProductCategoryID = cb.ProductCategoryID
				GROUP BY s.ProductID
				ORDER BY cb.ProductCategoryID ASC, cnt DESC
		) AS GroupSales
	) AS RankSales
WHERE productRank < 4;