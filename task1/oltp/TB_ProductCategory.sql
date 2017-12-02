CREATE TABLE TB_ProductCategory (
	ProductCategoryID INTEGER NOT NULL,
	ParentProductCategoryID INTEGER,
	Name VARCHAR(40) NOT NULL,
	CONSTRAINT PK_ProductCategory PRIMARY KEY (ProductCategoryID),
	CONSTRAINT FK_ParentProductCategory_ProductCategory FOREIGN KEY (ParentProductCategoryID) REFERENCES TB_ProductCategory (ProductCategoryID)
);
