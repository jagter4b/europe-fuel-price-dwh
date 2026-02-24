-- ------------------------------------- --
-- ODS - Dimension: Time                 --
-- ------------------------------------- --

USE [01_ODS];
GO

-- Drop table if exists
DROP TABLE IF EXISTS ODS_Dim_Time;
GO

CREATE TABLE ODS_Dim_Time (
    CalendarDate      NVARCHAR(10),
    CalendarMonth     INT,
    CalendarQuarter   INT,
    CalendarYear      INT,
    CalendarMonthName NVARCHAR(10),
    MonthShort        NVARCHAR(7),
    QuarterName       NVARCHAR(2),
    -- Metadata Columns
    CreationDate      DATETIME DEFAULT GETDATE(),
    SourceSystem      NVARCHAR(100),
    UpdatedBy         NVARCHAR(100)
);
GO

-- Declare 2 variables for the date range
DECLARE @StartDate DATE = '2005-01-01';
DECLARE @EndDate   DATE = '2024-12-31';

-- Create a temporary table to store generated dates
CREATE TABLE #TempDates (
    DateValue DATE
);

-- Generate a series of dates between @StartDate and @EndDate
WITH DateSeries AS (
    SELECT @StartDate AS DateValue
    UNION ALL
    SELECT DATEADD(DAY, 1, DateValue)
    FROM DateSeries
    WHERE DateValue < @EndDate
)

-- Insert dates into the temporary table
INSERT INTO #TempDates (DateValue)
    SELECT DateValue
    FROM DateSeries
    OPTION (MAXRECURSION 0);

-- Insert into Dim_Time with formatted values
INSERT INTO ODS_Dim_Time (
    CalendarDate,
    CalendarMonth,
    CalendarQuarter,
    CalendarYear,
    CalendarMonthName,
    MonthShort,
    QuarterName,
    SourceSystem,
    UpdatedBy
)
SELECT
    CONVERT(NVARCHAR(10), DateValue, 103)      AS CalendarDate,
    MONTH(DateValue)                           AS CalendarMonth,
    DATEPART(QUARTER, DateValue)               AS CalendarQuarter,
    YEAR(DateValue)                            AS CalendarYear,
    FORMAT(DateValue, 'MMMM')                  AS CalendarMonthName,
    RIGHT('0' + CAST(MONTH(DateValue) AS VARCHAR), 2) + '-' + FORMAT(DateValue, 'MMM') AS MonthShort,
    'Q' + CAST(DATEPART(QUARTER, DateValue) AS VARCHAR) AS QuarterName,
    'ODS_Manual_Script'                       AS SourceSystem,
    CURRENT_USER                              AS UpdatedBy
FROM
    #TempDates;

-- Drop the temporary table
DROP TABLE #TempDates;
GO

-- Check inserted data
SELECT *
FROM ODS_Dim_Time
ORDER BY CalendarDate DESC;
