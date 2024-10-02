-- Group 2
-- Adam Hanson, Alexis Brewers, Colton Bondhus, Ismail Abdullahi, Lily Rossman

CREATE DATABASE Entertainment;

USE Entertainment;

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



-- Customers table



-- Performers table



-- Engagements table



-- Groups_Styles table 



-- Musical_Preferences table

