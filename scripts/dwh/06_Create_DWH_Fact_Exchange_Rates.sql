-- ------------------------------------- --
-- DWH - Fact: Exchange Rates            --
-- ------------------------------------- --

-- Select the target database
USE [02_DWH];
GO

-- For the DWH we only delete the table if it is empty
IF OBJECT_ID('DWH_Fact_Exchange_Rates', 'U') IS NOT NULL
	IF NOT EXISTS (SELECT 1 FROM DWH_Fact_Exchange_Rates)
		DROP TABLE DWH_Fact_Exchange_Rates;

-- FX rates for the 20 selected currencies
CREATE TABLE DWH_Fact_Exchange_Rates (
    CalendarDate   DATE,
    FromCurrency   NVARCHAR(3),
    ToCurrency     NVARCHAR(3),
    ExchangeRate   DECIMAL(10, 6),
    -- Metadata Columns
    CreationDate           DATETIME DEFAULT GETDATE(),
    ModificationDate       DATETIME DEFAULT GETDATE(),
    SourceSystem           NVARCHAR(100),
    UpdatedBy              NVARCHAR(100),
	-- Foregin keys constraints
    FOREIGN KEY (CalendarDate) REFERENCES DWH_Dim_Time(CalendarDate),
    FOREIGN KEY (FromCurrency) REFERENCES DWH_Dim_Currency(CurrencyCode),
	FOREIGN KEY (ToCurrency)   REFERENCES DWH_Dim_Currency(CurrencyCode),
    -- Primary key
	CONSTRAINT PK_Fact_Exchange_Rates PRIMARY KEY (CalendarDate, FromCurrency,ToCurrency)
);


-- Check inserted data
SELECT *
FROM   DWH_Fact_Exchange_Rates; 
