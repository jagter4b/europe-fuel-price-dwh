-- ------------------------------------- --
-- DWH - Dimension: Currency             --
-- ------------------------------------- --

USE [02_DWH];
GO

-- For the DWH we only delete the table if it is empty
IF OBJECT_ID('DWH_Dim_Currency', 'U') IS NOT NULL
	IF NOT EXISTS (SELECT 1 FROM DWH_Dim_Currency)
		DROP TABLE DWH_Dim_Currency;

-- Create table
CREATE TABLE DWH_Dim_Currency (
	CurrencyCode  		NVARCHAR(3)   NOT NULL PRIMARY KEY,
	CurrencyName  		NVARCHAR(255) NOT NULL,
    -- Metadata Columns
    CreationDate  	   DATETIME DEFAULT GETDATE(),
    ModificationDate   DATETIME DEFAULT GETDATE(),
    SourceSystem  	   NVARCHAR(100),
    UpdatedBy    	   NVARCHAR(100)
);

-- Check inserted data
SELECT *
FROM   DWH_Dim_Currency;

