-- ------------------------------------- --
-- ODS - Dimension: Currency             --
-- ------------------------------------- --

USE [01_ODS];
GO

-- Drop table if exists
DROP TABLE IF EXISTS ODS_Dim_Currency;

-- Create table
CREATE TABLE ODS_Dim_Currency (
	CurrencyCode   NVARCHAR(3) NOT NULL,
	CurrencyName   NVARCHAR(255) NOT NULL,
	-- Metadata columns
	CreationDate   DATETIME DEFAULT GETDATE(),
	SourceSystem   NVARCHAR(100),
	UpdatedBy      NVARCHAR(100)
);

-- Insert 20 main currencies used in the world + 4 local currencies used by the countries we analyze
INSERT INTO ODS_Dim_Currency (CurrencyCode, CurrencyName, CreationDate, SourceSystem, UpdatedBy)
VALUES 
    ('AUD', 'Australian Dollar',        GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('BRL', 'Brazilian Real',           GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('CAD', 'Canadian Dollar',          GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('CHF', 'Swiss Franc',              GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('CNY', 'Chinese Yuan',             GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('CZK', 'Czech Koruna',             GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('DKK', 'Danish Krone',             GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('EUR', 'Euro',                     GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('GBP', 'British Pound Sterling',   GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('HKD', 'Hong Kong Dollar',         GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('INR', 'Indian Rupee',             GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('JPY', 'Japanese Yen',             GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('KRW', 'South Korean Won',         GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('MXN', 'Mexican Peso',             GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('NOK', 'Norwegian Krone',          GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('NZD', 'New Zealand Dollar',       GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('PLN', 'Polish Złoty',             GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('RON', 'Romanian Leu',             GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('RUB', 'Russian Ruble',            GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('SEK', 'Swedish Krona',            GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('SGD', 'Singapore Dollar',         GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('USD', 'United States Dollar',     GETDATE(), 'ODS_Manual_Script', CURRENT_USER),
    ('ZAR', 'South African Rand',       GETDATE(), 'ODS_Manual_Script', CURRENT_USER);

-- Check inserted data
SELECT *
FROM   ODS_Dim_Currency;
