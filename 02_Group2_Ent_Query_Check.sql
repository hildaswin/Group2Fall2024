-- Group 2
-- Adam Hanson, Alexis Brewers, Colton Bondhus, Ismail Abdullahi, Lily Rossman

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
	AgentKey,
	GroupsKey
FROM Engagements;

--5. Create a report of all engagements that last more than 3 days

--6. Create a report of all October engagements that occurred in 2022

--7. Create a report of all October engagements that occurred between noon and 5 PM

--8.. Create a list of all customers and the groups they have booked

--9. Create a list of all agents that have no contracts

--10. Create a list of all customers with no bookings

--11. Create a list of each customer's last booking

--12. Create a list of customers who like Country or Country Rock

--13. Create a report of the number of engagements each group has performed

--14. Create a report of the average agent salary

--15. Show our earliest October engagement in 2022

--16. Show the value of our October 2022 bookings

--17. Create a report of agent sales and commissions

--18. Show only those agents who have a commission greater than $1000
