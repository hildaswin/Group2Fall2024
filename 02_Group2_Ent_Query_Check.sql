-- Group 2
-- Adam Hanson, Alexis Brewers, Colton Bondhus, Ismail Abdullahi, Lily Rossman

USE [Entertainment]
GO

--1. Create an agent phone list

SELECT AgentsKey,
	CONCAT(AgentsLastName, ', ', AgentsFirstName) AS AgentsName,
	AgentsPhone
FROM Agents;

--2. Create a list of customers by city

SELECT CustKey AS CustomersKey,
	CONCAT(CustLastName, ', ', CustFirstName) AS CustomersName,
	CustCity AS CustomersCity,
	CustState AS CustomersState
FROM Customers
ORDER BY CustCity,
	CustKey;

--3. Create a list of when an agent received their first review (180 days after being hired)

SELECT AgentsKey,
	CONCAT(AgentsLastName, ', ', AgentsFirstName) AS AgentsName,
	AgentsDateHired,
	DATEADD(Day, 180, AgentsDateHired) AS AgentsFirstReviewDate
FROM Agents;

--4. Create a report of the net price per contract

SELECT EngagementKey AS ContractID,
	FORMAT(EngagementContractPrice, 'c') AS ContractNetPrice,
	CustKey AS CustomerKey,
	AgentsKey,
	GroupsKey
FROM Engagements;

--5. Create a report of all engagements that last more than 3 days
SELECT EngagementKey, EngagementStartDate, EngagementEndDate, DATEDIFF(day, EngagementStartDate, EngagementEndDate) AS EngagementLength
FROM Engagements
	-- DATEDIFF returns the number of days between the start and end of the engagements. 
	-- Only engagements with a DATEDIFF greater than 3 will be selected.
WHERE DATEDIFF(day, EngagementStartDate, EngagementEndDate) > 3;

--6. Create a report of all October engagements that occurred in 2022
SELECT EngagementKey, EngagementStartDate, EngagementEndDate
FROM Engagements
	-- Limits results to only engagements that take place entirely within October 2022
WHERE MONTH(EngagementStartDate) = 10
		AND MONTH(EngagementEndDate) = 10
		AND YEAR(EngagementStartDate) = 2022;

--7. Create a report of all October engagements that occurred between noon and 5 PM
SELECT EngagementKey, EngagementStartDate, EngagementEndDate, EngagementStartTime, EngagementStopTime
FROM Engagements
WHERE MONTH(EngagementStartDate) = 10 
		AND MONTH(EngagementEndDate) = 10
		-- DATEPART grabs the hour from the Start and Stop times, and this value is compared to the requested hours.
		-- Currently restricts query results to only engagements that took place entirely between 12:00 and 17:00
		AND (DATEPART(hour, EngagementStartTime) BETWEEN 12 AND 17) 
		AND (DATEPART(hour, EngagementStopTime) BETWEEN 12 AND 17);

--8.. Create a list of all customers and the groups they have booked
SELECT Customers.CustKey, (Customers.CustFirstName + ' ' + Customers.CustLastName) AS CustFullName, Groups.GroupsKey, Groups.GroupsName
FROM Customers
JOIN Engagements ON Customers.CustKey = Engagements.CustKey -- Join Customers and Groups through Engagements
JOIN Groups ON Groups.GroupsKey = Engagements.GroupsKey
	-- Customers may book groups more than once, so grouping by the GroupsKey first ensures a group is shown only once per customer
GROUP BY Groups.GroupsKey, Customers.CustKey, Customers.CustFirstName, Customers.CustLastName, Groups.GroupsName
ORDER BY Customers.CustKey, Groups.GroupsKey;

--9. Create a list of all agents that have no contracts

SELECT A.AgentsKey, A.AgentsFirstName, A.AgentsLastName
FROM Agents A
LEFT JOIN Engagements E ON A.AgentsKey = E.AgentsKey
WHERE E.AgentsKey IS NULL;

--10. Create a list of all customers with no bookings

SELECT C.CustKey, C.CustFirstName, C.CustLastName
FROM Customers C
LEFT JOIN Engagements E ON C.CustKey = E.CustKey
WHERE E.CustKey IS NULL;

--11. Create a list of each customer's last booking
SELECT  C.CustFirstName, C.CustLastName, E.EngagementKey, E.EngagementStartDate, E.EngagementEndDate
FROM Customers C
JOIN Engagements E ON C.CustKey = E.CustKey

    
 JOIN (   SELECT CustKey, MAX(EngagementEndDate) AS LastBookingDate
    FROM Engagements
    GROUP BY CustKey  )
 LatestBooking ON E.CustKey = LatestBooking.CustKey AND E.EngagementEndDate = LatestBooking.LastBookingDate;




--12. Create a list of customers who like Country or Country Rock

SELECT  C.CustFirstName,
	C.CustLastName, 
	MS.MusicalStylesName
FROM Customers AS C
INNER JOIN Musical_Preferences AS MP 
	ON C.CustKey = MP.CustKey
INNER JOIN Musical_Styles AS MS 
	ON MP.MusicalStylesKey = MS.MusicalStylesKey
WHERE MS.MusicalStylesName IN ('Country', 'Country Rock');

--13. Create a report of the number of engagements each group has performed

SELECT G.GroupsName AS [Stage Name], COUNT(E.EngagementKey) AS [Number Of Engagements]
FROM Groups G
LEFT JOIN Engagements E ON G.GroupsKey = E.GroupsKey
GROUP BY G.GroupsName
ORDER BY [Number Of Engagements] DESC, [Stage Name];

--14. Create a report of the average agent salary

SELECT CAST(AVG(AgentsSalary) AS DECIMAL(10, 2)) AS [Average Agent Salary]
FROM Agents;

--15. Show our earliest October engagement in 2022

SELECT TOP 1 EngagementKey, CONCAT(EngagementStartDate, ' ', EngagementStartTime) AS [Earliest October Engagement]
FROM Engagements
WHERE YEAR(EngagementStartDate) = 2022 AND MONTH(EngagementStartDate) = 10
ORDER BY EngagementStartTime;

--16. Show the value of our October 2022 bookings
SELECT SUM(EngagementContractPrice) AS 'October 2022 Booking Value'
FROM Engagements
WHERE MONTH(EngagementStartDate) = 10
	AND MONTH(EngagementEndDate) = 10
	AND YEAR(EngagementStartDate) = 2022;

--17. Create a report of agent sales and commissions
SELECT Agents.AgentsKey,
	(Agents.AgentsFirstName + ' ' + Agents.AgentsLastName) AS AgentsFullName,
    ROUND(SUM(Engagements.EngagementContractPrice), 2) AS AgentsSales, 
    ROUND(SUM(Agents.AgentsCommissionRate * Engagements.EngagementContractPrice), 2) AS AgentsCommission
FROM Agents
JOIN Engagements ON Agents.AgentsKey = Engagements.AgentsKey
GROUP BY Agents.AgentsKey, Agents.AgentsFirstName, Agents.AgentsLastName;


--18. Show only those agents who have a commission greater than $1000
SELECT Agents.AgentsKey, 
	(Agents.AgentsFirstName + ' ' + Agents.AgentsLastName) AS AgentsFullName, 
	SUM(Agents.AgentsCommissionRate * Engagements.EngagementContractPrice) AS Commission
FROM Agents
JOIN Engagements ON Agents.AgentsKey = Engagements.AgentsKey
GROUP BY Agents.AgentsKey, Agents.AgentsFirstName, Agents.AgentsLastName
HAVING SUM(Agents.AgentsCommissionRate * Engagements.EngagementContractPrice) > '1000';
