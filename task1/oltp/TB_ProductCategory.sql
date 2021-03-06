CREATE TABLE IF NOT EXISTS TB_ProductCategory (
	ProductCategoryID INTEGER NOT NULL,
	ParentProductCategoryID INTEGER,
	Name VARCHAR(150) NOT NULL,
	CONSTRAINT PK_ProductCategory PRIMARY KEY (ProductCategoryID),
	CONSTRAINT FK_ParentProductCategory_ProductCategory FOREIGN KEY (ParentProductCategoryID) REFERENCES TB_ProductCategory (ProductCategoryID)
);
