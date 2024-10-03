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

CREATE TABLE Customers
(
-- customers table columns 
    CustKey varchar(8)  NOT NULL,        
    CustFirstName VARCHAR(50) NOT NULL,      
    CustLastName VARCHAR(50) NOT NULL,      
    CustAddress VARCHAR(50) NOT NULL,      
    CustCity VARCHAR(50) NOT NULL,          
    CustState CHAR(2) NOT NULL,         
    CustZip CHAR(5) NOT NULL,            
    CustPhone VARCHAR(15)   NOT NULL,   
	
	-- customers table constraints
	CONSTRAINT PK_CustKey PRIMARY KEY (CustKey),  
	CONSTRAINT CHK_CustState CHECK (CustState = 'WA'),
	CONSTRAINT CHK_CustZip CHECK (CustZip LIKE '[0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT CHK_CustPhone CHECK (CustPhone LIKE '___-____' OR CustPhone LIKE '(___) ___-____')
);

GO


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

CREATE TABLE Engagements
-- engagements table columns
( EngagementKey VARCHAR(8) NOT NULL,                      
    EngagementStartDate DATE NOT NULL,                    
    EngagementEndDate DATE NOT NULL,                    
    EngagementStartTime TIME NOT NULL,                    
    EngagementStopTime TIME NOT NULL,                    
    EngagementContractPrice DECIMAL(10, 2) NOT NULL,        
    CustKey VARCHAR(8) NOT NULL,                      
    AgentKey VARCHAR(8) NOT NULL, 
	GroupsKey VARCHAR(8) NOT NULL,
 
 -- engagements table constraints
 CONSTRAINT PK_EngagementKey PRIMARY KEY (EngagementKey),
 CONSTRAINT CHK_ContractPrice CHECK (EngagementContractPrice >= 0),

     CONSTRAINT FK_CustKey FOREIGN KEY (CustKey) REFERENCES Customers(CustKey), -- Foreign Key to Customers table
    CONSTRAINT FK_AgentKey FOREIGN KEY (AgentKey) REFERENCES Agents(AgentsKey), -- Foreign Key to Agents table
    CONSTRAINT FK_GroupKey FOREIGN KEY (GroupsKey) REFERENCES Groups(GroupsKey)  -- Foreign Key to Groups table
 );
 GO


-- Groups_Styles table 



-- Musical_Preferences table

