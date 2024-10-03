-- Group 2
-- Adam Hanson, Alexis Brewers, Colton Bondhus, Ismail Abdullahi, Lily Rossman

USE [master]
GO

CREATE DATABASE [Entertainment]
GO

USE [Entertainment]
GO

-- Agents table
/*
Notes:
Added constraint to AgentsKey to force it to start with the letter A
Updated column names to account for table name change
Certain constraints may be useful to copy over to and adapt for other tables.
*/

CREATE TABLE Agents
(
	-- Agents Table Columns
	AgentsKey varchar(8) NOT NULL,
	AgentsFirstName varchar(50) NOT NULL,
	AgentsLastName varchar(50) NOT NULL,
	AgentsAddress varchar(50) NOT NULL,
	AgentsCity varchar(50) NOT NULL,
	AgentsState char(2) DEFAULT 'WA' NOT NULL,
	AgentsZip char(5) NOT NULL,
	AgentsPhone varchar(15) NOT NULL,
	AgentsDateHired Date NOT NULL,
	AgentsSalary decimal(10,2) NOT NULL,
	AgentsCommissionRate decimal (4,3) NOT NULL,

	-- Agents Table Constraints
	CONSTRAINT PK_Agents PRIMARY KEY (AgentsKey), -- Primary Key constraint
	CONSTRAINT Valid_Key_Agents CHECK (AgentsKey LIKE 'A%'), -- Forces AgentsKey to start with A
	CONSTRAINT Valid_Zip_Agents CHECK (AgentsZip NOT LIKE '%[^0-9]%'), -- Forces AgentsZip column to only consist of digits by using NOT LIKE

	-- Forces AgentsPhone to use proper phone number format, with or without area code
	CONSTRAINT Valid_Phone_Agents CHECK (AgentsPhone LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'
										OR AgentsPhone LIKE '([0-9][0-9][0-9])[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'), 

	CONSTRAINT Valid_Salary_Agents CHECK (AgentsSalary >= 0), -- Forces AgentsSalary to be nonnegative
	CONSTRAINT Valid_Commission_Agents CHECK (AgentsCommissionRate >= 0 AND AgentsCommissionRate <= 1), -- Forces AgentsCommissionRate to be between 0 and 1
	
	-- Forces AgentsState to be a valid state abbreviation
	CONSTRAINT Valid_State_Agents CHECK (AgentsState IN ('AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA',
								'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD',
								'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ',
								'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC',
								'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY'))
);
GO

-- Groups_Performers table





-- Groups table
/*
Notes:
Changed GroupsPage and GroupsEmail to not be unique. This is to allow multiple rows to have a value of NULL in those fields.
*/

CREATE TABLE Groups
(
	-- Groups Table Columns
	GroupsKey varchar(8) NOT NULL,
	GroupsName varchar(50) NOT NULL,
	GroupsSSN char(11) UNIQUE NOT NULL,
	GroupsAddress varchar(50) NOT NULL,
	GroupsCity varchar(50) NOT NULL,
	GroupsState char(2) DEFAULT 'WA' NOT NULL,
	GroupsZip char(5) NOT NULL,
	GroupsPhone varchar(15) NOT NULL,
	GroupsPage varchar(50) NULL,
	GroupsEmail varchar(50) NULL,
	GroupsDateEntered Date NOT NULL,

	-- Groups Table Constraints
	CONSTRAINT PK_Groups PRIMARY KEY (GroupsKey),
	CONSTRAINT Valid_Key_Groups CHECK (GroupsKey LIKE 'G%'), -- Forces GroupsKey to start with A
	CONSTRAINT Valid_Zip_Groups CHECK (GroupsZip NOT LIKE '%[^0-9]%'), -- Forces GroupsZip column to only consist of digits by using NOT LIKE
	CONSTRAINT Valid_SSN_Groups CHECK (GroupsSSN LIKE '[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9]'), -- Forces GroupsSSN to follow proper SSN format

	-- Forces GroupsPhone to use proper phone number format, with or without area code
	CONSTRAINT Valid_Phone_Groups CHECK (GroupsPhone LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'
						OR GroupsPhone LIKE '([0-9][0-9][0-9])[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	
	-- Forces GroupsState to be a valid state abbreviation
	CONSTRAINT Valid_State_Groups CHECK (GroupsState IN ('AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA',
								'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD',
								'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ',
								'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC',
								'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY'))
);
GO

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

