/* 
************************************************************************
Create Database and Schemas
************************************************************************
Script Purpose: 
    This script creates a new database named 'Library' after checking if it already exists.
    If the database exists , It is dropped and recreated . Additionally , the script sets up schema
    within the database.

WARNING:
    Running this script will drop the entire 'Library' database if exists.
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

USE master;
GO
  
-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Library')
BEGIN
  ALTER DATABASE Library SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE Library;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE Library

USE Library;

-- Create Schemas

CREATE SCHEMA library_schema;
GO
