-- Salespersons table
CREATE TABLE Salespersons (
    SalespersonID INT PRIMARY KEY,
    Name VARCHAR(100)
);

-- Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100)
);

-- Cars table
CREATE TABLE Cars (
    SerialNumber VARCHAR(50) PRIMARY KEY,
    Make VARCHAR(50),
    Model VARCHAR(50),
    Year INT
);

-- Invoices table
CREATE TABLE Invoices (
    InvoiceNumber INT PRIMARY KEY,
    SalespersonID INT,
    CarSerialNumber VARCHAR(50),
    Date DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (SalespersonID) REFERENCES Salespersons(SalespersonID),
    FOREIGN KEY (CarSerialNumber) REFERENCES Cars(SerialNumber)
);

-- ServiceTickets table
CREATE TABLE ServiceTickets (
    TicketNumber INT PRIMARY KEY,
    CustomerID INT,
    CarSerialNumber VARCHAR(50),
    DateIn DATE,
    DateOut DATE,
    Description TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (CarSerialNumber) REFERENCES Cars(SerialNumber)
);

-- Mechanics table
CREATE TABLE Mechanics (
    MechanicID INT PRIMARY KEY,
    Name VARCHAR(100)
);

-- MechanicCarAssignment table (junction table for M:N relationship between Mechanics and Cars)
CREATE TABLE MechanicCarAssignment (
    MechanicID INT,
    CarSerialNumber VARCHAR(50),
    PRIMARY KEY (MechanicID, CarSerialNumber),
    FOREIGN KEY (MechanicID) REFERENCES Mechanics(MechanicID),
    FOREIGN KEY (CarSerialNumber) REFERENCES Cars(SerialNumber)
);

-- ServiceHistory table
CREATE TABLE ServiceHistory (
    HistoryID INT PRIMARY KEY,
    CarSerialNumber VARCHAR(50),
    ServiceDate DATE,
    Description TEXT,
    Cost DECIMAL(10, 2),
    FOREIGN KEY (CarSerialNumber) REFERENCES Cars(SerialNumber)
);

-- Inserting sample data for demonstration

-- Salespersons
INSERT INTO Salespersons (SalespersonID, Name) VALUES (1, 'John Doe');
INSERT INTO Salespersons (SalespersonID, Name) VALUES (2, 'Jane Smith');

-- Customers
INSERT INTO Customers (CustomerID, Name) VALUES (1, 'Alice Brown');
INSERT INTO Customers (CustomerID, Name) VALUES (2, 'Bob Green');

-- Cars
INSERT INTO Cars (SerialNumber, Make, Model, Year) VALUES ('ABC123', 'Toyota', 'Camry', 2023);
INSERT INTO Cars (SerialNumber, Make, Model, Year) VALUES ('XYZ789', 'Honda', 'Accord', 2022);

-- Invoices
INSERT INTO Invoices (InvoiceNumber, SalespersonID, CarSerialNumber, Date, TotalAmount) VALUES (1001, 1, 'ABC123', '2024-07-01', 25000.00);

-- ServiceTickets
INSERT INTO ServiceTickets (TicketNumber, CustomerID, CarSerialNumber, DateIn, DateOut, Description) VALUES (2001, 1, 'XYZ789', '2024-07-10', '2024-07-12', 'Routine maintenance');

-- Mechanics
INSERT INTO Mechanics (MechanicID, Name) VALUES (1, 'Michael Johnson');
INSERT INTO Mechanics (MechanicID, Name) VALUES (2, 'Sarah Lee');

-- MechanicCarAssignment (example of assignment)
INSERT INTO MechanicCarAssignment (MechanicID, CarSerialNumber) VALUES (1, 'XYZ789');
INSERT INTO MechanicCarAssignment (MechanicID, CarSerialNumber) VALUES (2, 'ABC123');

-- ServiceHistory
INSERT INTO ServiceHistory (HistoryID, CarSerialNumber, ServiceDate, Description, Cost) VALUES (3001, 'XYZ789', '2024-07-12', 'Replaced brake pads', 350.00);
