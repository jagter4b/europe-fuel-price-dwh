-- ------------------------------------- --
-- ODS - Fact: Exchange Rates            --
-- ------------------------------------- --

USE [01_ODS];
GO

-- Drop table if exists
DROP TABLE IF EXISTS ODS_Fact_Exchange_Rates;

-- FX rates for the 20 selected currencies
CREATE TABLE ODS_Fact_Exchange_Rates (
	CalendarDate  DATE,
	[AUD] NVARCHAR(10),
	[BRL] NVARCHAR(10),
	[CAD] NVARCHAR(10),
	[CHF] NVARCHAR(10),
	[CNY] NVARCHAR(10),
	[CZK] NVARCHAR(10),
	[DKK] NVARCHAR(10),
	[EUR] NVARCHAR(10), -- will be set to 1.00000 in the mapping as the table is in Euro
	[GBP] NVARCHAR(10),
	[HKD] NVARCHAR(10),
	[INR] NVARCHAR(10),
	[JPY] NVARCHAR(10),
	[KRW] NVARCHAR(10),
	[MXN] NVARCHAR(10),
	[NOK] NVARCHAR(10),
	[NZD] NVARCHAR(10),
	[PLN] NVARCHAR(10),
	[RON] NVARCHAR(10),
	[RUB] NVARCHAR(10),
	[SEK] NVARCHAR(10),
	[SGD] NVARCHAR(10),
	[USD] NVARCHAR(10),
	[ZAR] NVARCHAR(10),
	-- Metadata columns
	CreationDate          DATETIME DEFAULT GETDATE(),
	SourceSystem          NVARCHAR(100),
	UpdatedBy             NVARCHAR(100)
);

-- Check inserted data
SELECT *
FROM   ODS_Fact_Exchange_Rates;
