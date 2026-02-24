-- ------------------------------------- --
-- DWH - Dimension: Country              --
-- ------------------------------------- --

USE [02_DWH];
GO

-- For the DWH we only delete the table if it is empty
IF OBJECT_ID('DWH_Dim_Country', 'U') IS NOT NULL
	IF NOT EXISTS (SELECT 1 FROM DWH_Dim_Country)
		DROP TABLE DWH_Dim_Country;

-- Create table
CREATE TABLE DWH_Dim_Country (
    CountryCode       NVARCHAR(2) NOT NULL PRIMARY KEY, -- 2-digit country code
    CountryCode3      NVARCHAR(3) NOT NULL, -- 3-digit country code
    CountryName       NVARCHAR(255) NOT NULL,
	CurrencyCode      NVARCHAR(3)   NULL,
    -- Metadata Columns
    CreationDate  	   DATETIME DEFAULT GETDATE(),
    ModificationDate   DATETIME DEFAULT GETDATE(),
    SourceSystem  	   NVARCHAR(100),
    UpdatedBy    	   NVARCHAR(100)
	-- Foregin keys constraints
    FOREIGN KEY (CurrencyCode) REFERENCES DWH_Dim_Currency(CurrencyCode),
);



-- Check inserted data
SELECT *
FROM   DWH_Dim_Country;
