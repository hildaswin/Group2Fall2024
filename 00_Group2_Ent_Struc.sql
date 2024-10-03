-- Group 2
-- Adam Hanson, Alexis Brewers, Colton Bondhus, Ismail Abdullahi, Lily Rossman

USE [master]
GO

CREATE DATABASE [Entertainment]
GO

USE [Entertainment]
GO

-- Agents table



-- Groups_Performers table



-- Groups table



-- Musical_Styles table
CREATE TABLE [Musical_Styles]
(
	-- Musical_Styles Table Columns
	[MusicalStylesKey] varchar(8) NOT NULL,
	[MusicalStylesName] varchar(50) UNIQUE NOT NULL,

	-- Primary Key (MusicalStylesKey)
	CONSTRAINT PK_MusicalStyles PRIMARY KEY (MusicalStylesKey),
	-- Ensure key starts with 'S'
	CONSTRAINT Valid_Key_Musical_Styles CHECK (MusicalStylesKey LIKE 'S%'),
);
GO


-- Customers table



-- Performers table



-- Engagements table



-- Groups_Styles table 



-- Musical_Preferences table

