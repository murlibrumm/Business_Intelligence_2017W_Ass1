CREATE TABLE IF NOT EXISTS TB_Product (
	ProductID INTEGER NOT NULL,
	Name VARCHAR(150) NOT NULL,
	ProductNumber VARCHAR(150) NOT NULL,
	StandardCost NUMERIC(10,4) NOT NULL,
	ListPrice NUMERIC(10,4) NOT NULL,
	Size VARCHAR(150),
	Weight NUMERIC(10,4),
	ProductCategoryID INTEGER NOT NULL,
	ProductModelName VARCHAR(150),
	SellStartDate TIMESTAMP NOT NULL,
	SellEndDate TIMESTAMP,
	DiscontinuedDate TIMESTAMP,
	CONSTRAINT PK_Product PRIMARY KEY (ProductID),
	CONSTRAINT FK_ProductCategory_Product FOREIGN KEY (ProductCategoryID) REFERENCES TB_ProductCategory (ProductCategoryID)
);
