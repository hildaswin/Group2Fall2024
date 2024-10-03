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
	CONSTRAINT Valid_Key_Musical_Styles CHECK (MusicalStylesKey LIKE 'S%')
);
GO


-- Customers table



-- Performers table
CREATE TABLE [Performers]
(
	-- Performers Table Columns
	[PerformersKey] varchar(8) NOT NULL,
	[PerformersFirstName] varchar(50) NOT NULL,
	[PerformersLastName] varchar(50) NOT NULL,
	[PerformersSuffix] varchar(10) NULL,
	[PerformersPhone] varchar(15) NOT NULL,
	[PerformersGender] char(3) NOT NULL,

	-- Primary Key (PerformersKey)
	CONSTRAINT PK_Performers PRIMARY KEY (PerformersKey),
	-- Ensure key starts with 'M'.
	CONSTRAINT Valid_Key_Performers CHECK (PerformersKey LIKE 'M%'),
	-- Ensure phone number is of valid format.
	-- Accepted formats: [###-####], [(###)###-####]
	CONSTRAINT Valid_Phone_Performers CHECK (PerformersPhone LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'
										OR PerformersPhone LIKE '([0-9][0-9][0-9])[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	-- Ensure gender is of valid value.
	CONSTRAINT Valid_Gender_Performers CHECK (PerformersGender IN ('M', 'F'))
);
GO


-- Engagements table



-- Groups_Styles table 



-- Musical_Preferences table

