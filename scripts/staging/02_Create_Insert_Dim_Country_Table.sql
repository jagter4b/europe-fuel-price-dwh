-- ------------------------------------- --
-- ODS - Dimension: Country              --
-- ------------------------------------- --

USE [01_ODS];
GO

-- Drop table if exists
DROP TABLE IF EXISTS ODS_Dim_Country;

-- Create table
CREATE TABLE ODS_Dim_Country (
    CountryCode    NVARCHAR(2)   NULL, -- 2-digit country code
    CountryCode3   NVARCHAR(3)   NULL, -- 3-digit country code
    CountryName    NVARCHAR(255) NULL,
	CurrencyCode   NVARCHAR(3)   NULL,
	-- Metadata columns
    CreationDate   DATETIME DEFAULT GETDATE(),
    SourceSystem   NVARCHAR(100),
    UpdatedBy      NVARCHAR(100)
);

-- Insert data into ODS_Dim_Country with official ISO country codes and local currencies
INSERT INTO ODS_Dim_Country (CountryCode, CountryCode3, CountryName, CurrencyCode, SourceSystem, UpdatedBy)
VALUES
    ('DE', 'DEU', 'Germany', 'EUR', 'ODS_Manual_Script', CURRENT_USER),
    ('FR', 'FRA', 'France', 'EUR', 'ODS_Manual_Script', CURRENT_USER),
    ('IT', 'ITA', 'Italy', 'EUR', 'ODS_Manual_Script', CURRENT_USER),
    ('ES', 'ESP', 'Spain', 'EUR', 'ODS_Manual_Script', CURRENT_USER),
    ('PL', 'POL', 'Poland', 'PLN', 'ODS_Manual_Script', CURRENT_USER),
    ('RO', 'ROU', 'Romania', 'RON', 'ODS_Manual_Script', CURRENT_USER),
    ('NL', 'NLD', 'Netherlands', 'EUR', 'ODS_Manual_Script', CURRENT_USER),
    ('BE', 'BEL', 'Belgium', 'EUR', 'ODS_Manual_Script', CURRENT_USER),
    ('SE', 'SWE', 'Sweden', 'SEK', 'ODS_Manual_Script', CURRENT_USER),
    ('CZ', 'CZE', 'Czech Republic', 'CZK', 'ODS_Manual_Script', CURRENT_USER);

-- Check inserted data
SELECT *
FROM   ODS_Dim_Country;
