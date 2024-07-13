How to Play Galaxy Security
Objective
Identify the thief who stole a valuable graphics card from the store by analyzing the data in the database.

Game Setup
Database Tables: The game uses several tables to simulate the real-world scenario:

GalaxyEmployees: Contains information about the store employees.
Customers: Contains information about the customers.
Attendance: Records the attendance of customers on the day of the theft.
Interviews: Records the details of interviews conducted with employees and customers.
Solution: Contains the correct answer for the thief's identity.
Sample Data: The tables are pre-populated with sample data, including employee details, customer details, attendance records, and interview notes.

How to Play
1. Examine the Data: Start by examining the data in each table to gather clues.
  *Use SQL queries to retrieve information from the tables. For example:
    SELECT * FROM GalaxyEmployees;
    SELECT * FROM Customers;
    SELECT * FROM Attendance;
    SELECT * FROM Interviews;

2. Analyze Attendance: Identify which customers were present on the day of the theft.
   *Query to find customers present on the specific date:
      SELECT c.CustomerID, c.FirstName, c.LastName
      FROM Customers c
      JOIN Attendance a ON c.CustomerID = a.CustomerID
      WHERE a.AttendanceDate = '2023-03-17';

3. Review Interviews: Check the interview notes for any suspicious behavior or clues.
   *Query to retrieve interview details:
     SELECT i.InterviewID, e.FirstName AS EmployeeFirstName, e.LastName AS EmployeeLastName, 
     c.FirstName AS CustomerFirstName, c.LastName AS CustomerLastName, i.Notes
     FROM Interviews i
     JOIN GalaxyEmployees e ON i.EmployeeID = e.EmployeeID
     JOIN Customers c ON i.CustomerID = c.CustomerID;
4. Narrow Down Suspects: Based on the attendance and interview data, narrow down the list of suspects.
Look for patterns or specific details that might indicate the thief.

5. Guess the Thief: Once you have a suspect, input their customer ID to check if they are the thief.
   *Replace {input_customer_id} with the ID of your suspect in the following query:
     SELECT CASE
      WHEN CorrectCustomerID = {input_customer_id} THEN 'Correct! This customer stole the graphics card.'
      ELSE 'Incorrect. Try again.'
      END AS Result
      FROM Solution
      WHERE SolutionID = 1;
