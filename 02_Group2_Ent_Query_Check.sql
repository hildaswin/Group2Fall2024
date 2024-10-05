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

SELECT A.AgentsKey, A.AgentsFirstName, A.AgentsLastName
FROM Agents A
LEFT JOIN Engagements E ON A.AgentsKey = E.AgentKey
WHERE E.AgentKey IS NULL;

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

SELECT  C.CustFirstName, C.CustLastName
FROM Customers C

JOIN Musical_Preferences MP ON C.CustKey = MP.CustKey
WHERE MP.Genre IN ('Country', 'Country Rock');

--13. Create a report of the number of engagements each group has performed

--14. Create a report of the average agent salary

--15. Show our earliest October engagement in 2022

--16. Show the value of our October 2022 bookings

--17. Create a report of agent sales and commissions

--18. Show only those agents who have a commission greater than $1000
