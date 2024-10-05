-- Group 2
-- Adam Hanson, Alexis Brewers, Colton Bondhus, Ismail Abdullahi, Lily Rossman

--1. Create an agent phone list

--2. Create a list of customers by city

--3. Create a list of when an agent received their first review (180 days after being hired)

--4. Create a report of the net price per contract

--5. Create a report of all engagements that last more than 3 days

--6. Create a report of all October engagements that occurred in 2022

--7. Create a report of all October engagements that occurred between noon and 5 PM

--8.. Create a list of all customers and the groups they have booked

--9. Create a list of all agents that have no contracts

--10. Create a list of all customers with no bookings

--11. Create a list of each customer's last booking

--12. Create a list of customers who like Country or Country Rock

--13. Create a report of the number of engagements each group has performed

SELECT G.GroupStageName AS [Stage Name], COUNT(E.EngagementKey) AS [Number Of Engagements]
FROM Groups G
LEFT JOIN Engagements E ON G.GroupKey = E.GroupKey
GROUP BY G.GroupStageName
ORDER BY [Number Of Engagements] DESC, [Stage Name];

--14. Create a report of the average agent salary

SELECT CAST(AVG(AgentSalary) AS DECIMAL(10, 2)) AS [Average Agent Salary]
FROM Agents;

--15. Show our earliest October engagement in 2022

SELECT TOP 1 EngagementKey, EngStartDateTime AS [Earliest October Engagement]
FROM Engagements
WHERE YEAR(EngStartDateTime) = 2022 AND MONTH(EngStartDateTime) = 10
ORDER BY EngStartDateTime;

--16. Show the value of our October 2022 bookings

--17. Create a report of agent sales and commissions

--18. Show only those agents who have a commission greater than $1000
