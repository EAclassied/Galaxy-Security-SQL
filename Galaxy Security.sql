-- Creating necessary tables
CREATE TABLE GalaxyEmployees (
    EmployeeID INT PRIMARY KEY,
    FirstName TEXT,
    LastName TEXT,
    Position TEXT
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName TEXT,
    LastName TEXT,
    EyeColor TEXT,
    HairColor TEXT,
    Height INT,
    PhoneNumber TEXT,
    Email TEXT
);

CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    CustomerID INT,
    AttendanceDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Interviews (
    InterviewID INT PRIMARY KEY,
    EmployeeID INT,
    CustomerID INT,
    InterviewDate DATE,
    Notes TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES GalaxyEmployees(EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Solution (
    SolutionID INT PRIMARY KEY,
    CorrectCustomerID INT,
    FOREIGN KEY (CorrectCustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Items (
    ItemID INT PRIMARY KEY,
    ItemName TEXT,
    ItemDescription TEXT,
    ItemValue DECIMAL(10, 2)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    CustomerID INT,
    ItemID INT,
    TransactionDate DATE,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
);

CREATE TABLE WitnessStatements (
    StatementID INT PRIMARY KEY,
    WitnessName TEXT,
    StatementDate DATE,
    Notes TEXT
);

CREATE TABLE Hints (
    HintID INT PRIMARY KEY,
    HintText TEXT
);

-- Inserting initial data into tables
INSERT INTO GalaxyEmployees (EmployeeID, FirstName, LastName, Position) VALUES
(1, 'John', 'Doe', 'Manager'),
(2, 'Jane', 'Doe', 'Sales Associate'),
(3, 'Bob', 'Smith', 'Technician'),
(4, 'Janine', 'Balboa', 'Store Assistant'),
(5, 'Mike', 'Tyson', 'Security'),
(6, 'Sarah', 'Connor', 'Cashier'),
(7, 'Ellen', 'Ripley', 'Cleaner');

INSERT INTO Customers (CustomerID, FirstName, LastName, EyeColor, HairColor, Height, PhoneNumber, Email) VALUES
(1, 'Mary', 'Smith', 'Blue', 'Blonde', 177, '555-1234', 'mary.smith@gmail.com'),
(2, 'Tom', 'Jones', 'Brown', 'Black', 180, '555-5678', 'tom.jones@yahoo.com'),
(3, 'Alice', 'Brown', 'Green', 'Red', 160, '555-9012', 'alice.brown@hotmail.com'),
(4, 'Peter', 'Parker', 'Hazel', 'Brown', 170, '555-3456', 'peter.parker@dailybugle.com'),
(5, 'Bruce', 'Wayne', 'Blue', 'Black', 190, '555-7890', 'bruce.wayne@wayneenterprises.com'),
(6, 'Clark', 'Kent', 'Blue', 'Black', 185, '555-6543', 'clark.kent@dailyplanet.com'),
(7, 'Diana', 'Prince', 'Blue', 'Black', 175, '555-0987', 'diana.prince@themyscira.com'),
(8, 'Eli', 'Dash', 'Brown', 'Blonde', 172, '555-1122', 'eli.dash@example.com');

INSERT INTO Attendance (AttendanceID, CustomerID, AttendanceDate) VALUES
(1, 1, '2023-03-17'),
(2, 2, '2023-03-17'),
(3, 3, '2023-03-17'),
(4, 4, '2023-03-17'),
(5, 5, '2023-03-17'),
(6, 6, '2023-03-17'),
(7, 7, '2023-03-17'),
(8, 8, '2023-03-17');

INSERT INTO Interviews (InterviewID, EmployeeID, CustomerID, InterviewDate, Notes) VALUES
(1, 2, 1, '2023-03-17', 'Was looking for technical advice'),
(2, 3, 2, '2023-03-17', 'The customer heard someone talking about selling graphics cards on the black market.'),
(3, 4, 2, '2023-03-17', 'A customer saw a person carrying a large bag in the store, which seemed unusual.'),
(4, 5, 3, '2023-03-17', 'Noticed a customer lingering near the tech section for a long time.'),
(5, 6, 4, '2023-03-17', 'Customer was asking a lot of questions about high-end graphics cards.'),
(6, 7, 5, '2023-03-17', 'Saw a customer near the back exit.'),
(7, 1, 6, '2023-03-17', 'Customer seemed nervous and in a hurry.'),
(8, 2, 7, '2023-03-17', 'Customer was seen talking to another customer about expensive items.'),
(9, 3, 8, '2023-03-17', 'Customer was seen near the graphics card section shortly before the theft.');

-- Insert the correct answer (Eli Dash with CustomerID 8)
INSERT INTO Solution (SolutionID, CorrectCustomerID) VALUES
(1, 8);

-- Inserting items
INSERT INTO Items (ItemID, ItemName, ItemDescription, ItemValue) VALUES
(1, 'Graphics Card', 'High-end graphics card', 799.99),
(2, 'Laptop', 'Gaming laptop', 1299.99),
(3, 'Mouse', 'Wireless mouse', 49.99);

-- Inserting transactions
INSERT INTO Transactions (TransactionID, CustomerID, ItemID, TransactionDate, Quantity) VALUES
(1, 1, 1, '2023-03-17', 1),
(2, 2, 2, '2023-03-17', 1),
(3, 3, 3, '2023-03-17', 2),
(4, 8, 1, '2023-03-17', 1);

-- Inserting witness statements
INSERT INTO WitnessStatements (StatementID, WitnessName, StatementDate, Notes) VALUES
(1, 'Anna Lee', '2023-03-17', 'I saw a customer with blonde hair near the tech section.'),
(2, 'Sam Green', '2023-03-17', 'A tall person was wearing a blue jacket acting suspiciously.'),
(3, 'Nina White', '2023-03-17', 'Someone was asking a lot of questions about graphics cards.');

-- Inserting hints
INSERT INTO Hints (HintID, HintText) VALUES
(1, 'Check the interview notes carefully.'),
(2, 'Look at the attendance records for clues.'),
(3, 'Witness statements might help.');

-- Query to check if the given customer ID matches the correct answer
-- Replace {input_customer_id} with the actual input from the user
SELECT CASE
    WHEN CorrectCustomerID = {input_customer_id} THEN 'Correct! This customer stole the graphics card.'
    ELSE 'Incorrect. Try again.'
END AS Result
FROM Solution
WHERE SolutionID = 1;
