SELECT
    ShipmentMethod as 'Shipment Method',
	CountryRegion as 'Country Region',
	((SUM(IsLateShipment) / COUNT(IsLateShipment)) * 100) AS '% of Late Shipments'
FROM
(
	SELECT
		f.IsLateShipment,
		f.ShipmentMethod,
		l.CountryRegion
	FROM DM_FactSales f
    JOIN DM_Location l
		ON f.ShipToAddressID = l.AddressID 
) AS info
GROUP BY CountryRegion, ShipmentMethod
ORDER BY CountryRegion, ShipmentMethod;