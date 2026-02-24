USE [02_DWH];
GO

-- For the DWH we only delete the table if it is empty
IF OBJECT_ID('DWH_Errors', 'U') IS NOT NULL
	IF NOT EXISTS (SELECT 1 FROM DWH_Errors)
		DROP TABLE DWH_Errors;

CREATE TABLE DWH_Errors
(
    ErrorID      INT IDENTITY(1,1) PRIMARY KEY,
	ErrorData    NVARCHAR(1000),
    ErrorMessage NVARCHAR(1000),
    ErrorDate    DATETIME DEFAULT GETDATE(),
    SourceSystem NVARCHAR(100),
    UpdatedBy    NVARCHAR(100)
);

-- Check inserted data
SELECT *
FROM   DWH_Errors;
