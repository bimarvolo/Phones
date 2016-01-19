/*#####################################################################
	This script is to restore all ShipShape databases.
	[NOTE THAT: CUSTOMIZE THE OWN BASE FOLDER PATH ON YOUR MACHINE.]
#######################################################################*/
use master
go
GO
-- Remove all current connections and disable multi-connections.
-- Ensure that ONLY ONE connection.
--ALTER DATABASE ProdFFGAssureFoundation SET SINGLE_USER WITH ROLLBACK IMMEDIATE 
ALTER DATABASE ProdFFGCbdRiskManagement SET SINGLE_USER WITH ROLLBACK IMMEDIATE 

-- Restore databases by the common standard format [FILENAME_DD-MM-YYYY.bak].
GO
	DECLARE @STANDARD_FILE_PATH_FORMAT VARCHAR(300);
	DECLARE @BAK_FILE_NAME VARCHAR(200);
	DECLARE @CURRENT_DATE_STR VARCHAR(25);

	-- Set up the common file path.
	SET @CURRENT_DATE_STR = CONVERT(varchar(25), GETDATE(), 105);
	SET @STANDARD_FILE_PATH_FORMAT = 'D:\CP\SVN Document\ShipShape\ShipShape 10May2014 after updates\ProdFFGCbdRiskManagement 20140510 after Running Scripts.bak'--'E:\projects\cp\bak\{0}_03-11-2014.bak';

	---- For ProdFFGAssureFoundation database
	--SET @BAK_FILE_NAME = REPLACE(@STANDARD_FILE_PATH_FORMAT, '{0}', 'prod_ffg_assure_foundation')
	--RESTORE DATABASE ProdFFGAssureFoundation FROM DISK = @BAK_FILE_NAME
	--WITH REPLACE

	-- For ProdFFGCbdRiskManagement database
	SET @BAK_FILE_NAME = REPLACE(@STANDARD_FILE_PATH_FORMAT, '{0}', 'prod_ffg_cbd_risk_management') 
	RESTORE DATABASE ProdFFGCbdRiskManagement FROM DISK = @BAK_FILE_NAME
	WITH REPLACE
GO

-- Enable the multi-user to connect.
--ALTER DATABASE ProdFFGAssureFoundation SET MULTI_USER
ALTER DATABASE ProdFFGCbdRiskManagement SET MULTI_USER
GO
