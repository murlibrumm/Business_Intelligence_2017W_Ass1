CREATE TABLE TB_SalesOrderDetail (
	SalesOrderID INTEGER NOT NULL,
	SalesOrderDetailID INTEGER NOT NULL,
	OrderQty INTEGER NOT NULL,
	ProductID INTEGER NOT NULL,
	UnitPrice NUMERIC(10,4) NOT NULL,
	CONSTRAINT PK_SalesOrderDetail PRIMARY KEY (SalesOrderID, SalesOrderDetailID),
	CONSTRAINT FK_SalesOrder_SalesOrderDetail FOREIGN KEY (SalesOrderID) REFERENCES TB_SalesOrderHeader (SalesOrderID),
	CONSTRAINT FK_Product_SalesOrderDetail FOREIGN KEY (ProductID) REFERENCES TB_Product (ProductID)
);
