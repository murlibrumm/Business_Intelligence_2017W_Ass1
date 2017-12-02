CREATE TABLE TB_Product (
	ProductID INTEGER NOT NULL,
	Name VARCHAR(40) NOT NULL,
	ProductNumber VARCHAR(40) NOT NULL,
	StandardCost NUMERIC(10,4) NOT NULL,
	ListPrice NUMERIC(10,4) NOT NULL,
	Size VARCHAR(40),
	Weight NUMERIC(10,4),
	ProductCategoryID INTEGER NOT NULL,
	ProductModelName VARCHAR(40),
	SellStartDate DATE NOT NULL,
	SellEndDate DATE,
	DiscontinuedDate DATE,
	CONSTRAINT PK_Product PRIMARY KEY (ProductID),
	CONSTRAINT FK_ProductCategory_Product FOREIGN KEY (ProductCategoryID) REFERENCES TB_ProductCategory (ProductCategoryID)
);
