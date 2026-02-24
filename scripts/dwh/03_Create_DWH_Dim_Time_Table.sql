-- ------------------------------------- --
-- DWH - Dimension: Time                 --
-- ------------------------------------- --

USE [02_DWH];
GO

-- For the DWH we only delete the table if it is empty
IF OBJECT_ID('DWH_Dim_Time', 'U') IS NOT NULL
	IF NOT EXISTS (SELECT 1 FROM DWH_Dim_Time)
		DROP TABLE DWH_Dim_Time;

CREATE TABLE DWH_Dim_Time (
    CalendarDate       DATE PRIMARY KEY,
    CalendarMonth      INT,
    CalendarQuarter    INT,
    CalendarYear       INT,
    CalendarMonthName  NVARCHAR(10),
    MonthShort         NVARCHAR(7),
    QuarterName        NVARCHAR(2),
    -- Metadata Columns
    CreationDate  	   DATETIME DEFAULT GETDATE(),
    ModificationDate   DATETIME DEFAULT GETDATE(),
    SourceSystem  	   NVARCHAR(100),
    UpdatedBy    	   NVARCHAR(100)
);
GO

-- Check inserted data
SELECT   *
FROM     DWH_Dim_Time
ORDER BY CalendarDate DESC;
