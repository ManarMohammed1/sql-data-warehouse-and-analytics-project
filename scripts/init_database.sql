/*
=============================================================
                Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse'. 
    Additionally, the script sets up three schemas within the database: 'bronze', 'silver', and 'gold'.

*/

USE master;
GO

-- Create Database 'DataWarehouse'
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO		-- Separate batches when working with multiple SQL statements

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO