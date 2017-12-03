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
	FROM dm_factsales f
    JOIN dm_location l
		ON f.ShipToAddressID = l.AddressID 
) AS info
GROUP BY CountryRegion, ShipmentMethod
ORDER BY CountryRegion, ShipmentMethod