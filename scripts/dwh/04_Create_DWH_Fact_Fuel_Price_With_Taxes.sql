-- ------------------------------------- --
-- DWH - Fact: Fuel Price with Taxes     --
-- ------------------------------------- --

-- Select the target database
USE [02_DWH];
GO

-- For the DWH we only delete the table if it is empty
IF OBJECT_ID('DWH_Fact_Fuel_Prices_With_Taxes', 'U') IS NOT NULL
	IF NOT EXISTS (SELECT 1 FROM DWH_Fact_Fuel_Prices_With_Taxes)
		DROP TABLE DWH_Fact_Fuel_Prices_With_Taxes;

-- Create table
CREATE TABLE DWH_Fact_Fuel_Prices_With_Taxes (
    CountryCode            NVARCHAR(2),
    CalendarDate           DATE,
    CurrencyCode           NVARCHAR(3),
    Exchange_Rate_To_Euro  DECIMAL(10, 5),
    Petrol_With_Taxes      DECIMAL(10, 2),
    Diesel_With_Taxes      DECIMAL(10, 2),
    -- Metadata Columns
    CreationDate           DATETIME DEFAULT GETDATE(),
    ModificationDate       DATETIME DEFAULT GETDATE(),
    SourceSystem           NVARCHAR(100),
    UpdatedBy              NVARCHAR(100),

	-- Foregin keys constraints
    FOREIGN KEY (CalendarDate) REFERENCES DWH_Dim_Time(CalendarDate),
    FOREIGN KEY (CountryCode)  REFERENCES DWH_Dim_Country(CountryCode),
    FOREIGN KEY (CurrencyCode) REFERENCES DWH_Dim_Currency(CurrencyCode),

    -- Primary key
	CONSTRAINT PK_Fact_Fuel_Prices_With_Taxes PRIMARY KEY (CalendarDate, CountryCode, CurrencyCode)
);

-- Check inserted data
SELECT *
FROM   DWH_Fact_Fuel_Prices_With_Taxes;