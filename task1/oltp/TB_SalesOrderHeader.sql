CREATE TABLE IF NOT EXISTS TB_SalesOrderHeader (
	SalesOrderID INTEGER NOT NULL,
	RevisionNumber INTEGER NOT NULL,
	OrderDate DATE NOT NULL,
	DueDate DATE NOT NULL,
	ShipDate DATE,
	Status INTEGER NOT NULL,
	SalesOrderNumber INTEGER NOT NULL,
	CustomerID INTEGER NOT NULL,
	ShipToAddressID INTEGER NOT NULL,
	BillToAddressID INTEGER NOT NULL,
	ShipMethodID INTEGER NOT NULL,
	CONSTRAINT PK_SalesOrderHeader PRIMARY KEY (SalesOrderID),
	CONSTRAINT FK_Customer_SalesOrderHeader FOREIGN KEY (CustomerID) REFERENCES TB_Customer (CustomerID),
	CONSTRAINT FK_ShipToAddress_SalesOrderHeader FOREIGN KEY (ShipToAddressID) REFERENCES TB_Address (AddressID),
	CONSTRAINT FK_BillToAddress_SalesOrderHeader FOREIGN KEY (BillToAddressID) REFERENCES TB_Address (AddressID),
	CONSTRAINT FK_ShipMethod_SalesOrderHeader FOREIGN KEY (ShipMethodID) REFERENCES TB_ShipMethod (ShipMethodID)
);
