CREATE TABLE IF NOT EXISTS TB_CustomerAddresss (
	CustomerID INTEGER NOT NULL,
	AddressID INTEGER NOT NULL,
	CONSTRAINT PK_CustomerAddress PRIMARY KEY (CustomerID, AddressID),
	CONSTRAINT FK_Customer_CustomerAddress FOREIGN KEY (CustomerID) REFERENCES TB_Customer (CustomerID),
	CONSTRAINT FK_Address_CustomerAddress FOREIGN KEY (AddressID) REFERENCES TB_Address (AddressID)
);
