-- ------------------------------------- --
-- ODS - Fact: Fuel Price Without Taxes  --
-- ------------------------------------- --

-- Select the target database
USE [01_ODS];
GO

-- Drop table if exists
DROP TABLE IF EXISTS ODS_Fact_Fuel_Prices_WO_Taxes;

-- Create table
CREATE TABLE ODS_Fact_Fuel_Prices_WO_Taxes (
	CountryCode           NVARCHAR(2),
	CalendarDate          DATE,
	Exchange_Rate_To_Euro DECIMAL(10, 5),
	Petrol_Wo_Taxes       DECIMAL(10, 2),
	Diesel_Wo_Taxes       DECIMAL(10, 2),
	-- Metadata columns
	CreationDate          DATETIME DEFAULT GETDATE(),
	SourceSystem          NVARCHAR(100),
	UpdatedBy             NVARCHAR(100)
);

-- Check inserted data
SELECT *
FROM   ODS_Fact_Fuel_Prices_WO_Taxes;