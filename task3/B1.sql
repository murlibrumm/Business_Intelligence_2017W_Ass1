set @num := 0, @cat := '';

SELECT
	TopProductCategory as 'Top Product Category',
    rank as 'Product Rank',
    ProductName as 'Product Name'
FROM
(
	SELECT
		TopProductCategory,
        ProductName,
        Sales,
        @num := if (@cat = sales.TopProductCategory, @num + 1, 1) as rank,
        @cat := sales.TopProductCategory as dummy
	FROM
		(
			SELECT
				p.ProductID as 'ProductID',
				p.ProductTopCategory AS 'TopProductCategory',
				p.Name AS 'ProductName',
				COUNT(*) AS 'Sales'
			FROM DM_Product p
			JOIN DM_FactSales f
				ON p.ProductID = f.ProductID
			GROUP BY p.ProductID
			ORDER BY ProductTopCategory ASC, Sales DESC
		) AS sales
) AS ranked
WHERE rank <= 3
ORDER BY TopProductCategory ASC, rank ASC;