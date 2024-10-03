-- Group 2
-- Adam Hanson, Alexis Brewers, Colton Bondhus, Ismail Abdullahi, Lily Rossman

CREATE DATABASE Entertainment;

-- Agents table



-- Groups_Performers table



-- Groups table



-- Musical_Styles table



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

