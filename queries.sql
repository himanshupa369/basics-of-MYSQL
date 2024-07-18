-- Create the table 'flatmate' with specified columns
CREATE TABLE flatmate (
    name VARCHAR(50),  
    mobile_num BIGINT,
    date_Of_Joining DATE,
    address VARCHAR(100) 
);

-- Insert data into the 'flatmate' table
INSERT INTO flatmate (name, mobile_num, date_Of_Joining, address) 
VALUES ('Himanshu', 6307407560, '2024-07-05', 'Greater Noida');

INSERT INTO flatmate (name, mobile_num, date_Of_Joining, address) 
VALUES ('Anjali', 9876543210, '2023-06-15', 'sector 62, Noida');

INSERT INTO flatmate (name, mobile_num, date_Of_Joining, address) 
VALUES ('Rohit', 8765432109, '2022-12-01', 'sector 137, Noida');

INSERT INTO flatmate (name, mobile_num, date_Of_Joining, address) 
VALUES ('Priya', 7654321098, '2021-08-23', 'Indirapuram, Ghaziabad');

INSERT INTO flatmate (name, mobile_num, date_Of_Joining, address) 
VALUES ('Amit', 6543210987, '2024-01-10', 'Alpha 1, Greater Noida');

INSERT INTO flatmate (name, mobile_num, date_Of_Joining, address) 
VALUES ('Sneha', 5432109876, '2023-03-20', 'Beta 2, Greater Noida');

INSERT INTO flatmate (name, mobile_num, date_Of_Joining, address) 
VALUES ('Karan', 4321098765, '2022-11-11', 'sector 50, Noida');

INSERT INTO flatmate (name, mobile_num, date_Of_Joining, address) 
VALUES ('Rina', 3210987654, '2023-05-05', 'Raj Nagar, Ghaziabad');

INSERT INTO flatmate (name, mobile_num, date_Of_Joining, address) 
VALUES ('Vikram', 2109876543, '2024-04-15', 'sector 63, Noida');

INSERT INTO flatmate (name, mobile_num, date_Of_Joining, address) 
VALUES ('Neha', 1098765432, '2023-07-30', 'Crossing Republik, Ghaziabad');

-- Add a new column 'gender' to the 'flatmate' table
ALTER TABLE flatmate
ADD gender VARCHAR(10);

-- Select all rows from the 'flatmate' table to check the added column
SELECT * FROM flatmate;

-- Drop the 'gender' column from the 'flatmate' table
ALTER TABLE flatmate
DROP COLUMN gender;

-- Add a primary key constraint on the 'mobile_num' column in the 'flatmate' table
ALTER TABLE flatmate
ADD CONSTRAINT pk_flatmate PRIMARY KEY (mobile_num);

-- Rename the 'flatmate' table to 'hostel_flatmate'
ALTER TABLE flatmate
RENAME TO hostel_flatmate;

-- Select all rows from the renamed 'hostel_flatmate' table
SELECT * FROM hostel_flatmate;

-- Rename the 'hostel_flatmate' table back to 'flatmate'
RENAME TABLE hostel_flatmate TO flatmate;

-- Select all rows from the 'flatmate' table to confirm the rename
SELECT * FROM flatmate;

-- Example of an UPDATE query
UPDATE flatmate
SET address = 'Updated Address', date_Of_Joining = '2024-07-01'
WHERE name = 'Himanshu';

-- Select all rows to verify the update
SELECT * FROM flatmate;

-- Example of a DELETE query
DELETE FROM flatmate
WHERE name = 'Priya';

-- Select all rows to verify the delete
SELECT * FROM flatmate;

CREATE INDEX idx on flatmate(name,date_Of_Joining);

SELECT * FROM flatmate WHERE name = 'Vikram';

EXPLAIN SELECT name FROM flatmate WHERE name = 'Himanshu';

-- Create a view 'recent_flatmates' to show flatmates who joined after January 1, 2023
CREATE VIEW recent_flatmates AS
SELECT name, mobile_num, date_Of_Joining, address
FROM flatmate
WHERE date_Of_Joining > '2023-01-01';

ALTER VIEW recent_flatmates AS
SELECT name, mobile_num, date_Of_Joining, address
FROM flatmate
WHERE date_Of_Joining > '2023-07-01';

-- Query the view
SELECT * FROM recent_flatmates;

-- Update the underlying table
UPDATE flatmate
SET address = 'Updated Sector 50, Noida'
WHERE name = 'Amit';

-- Verify the update in the view
SELECT * FROM recent_flatmates;

-- Drop the view
DROP VIEW recent_flatmates;

-- Verify the table after all operations
SELECT * FROM flatmate;

-- Create the 'payment' table
CREATE TABLE payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    mobile_num BIGINT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (mobile_num) REFERENCES flatmate(mobile_num)
);

-- Insert data into the 'payment' table
INSERT INTO payment (mobile_num, amount, payment_date) 
VALUES (6307407560, 1000.00, '2024-07-10');

INSERT INTO payment (mobile_num, amount, payment_date) 
VALUES (9876543210, 1500.00, '2023-07-20');

INSERT INTO payment (mobile_num, amount, payment_date) 
VALUES (8765432109, 2000.00, '2022-12-15');



INSERT INTO payment (mobile_num, amount, payment_date) 
VALUES (6543210987, 3000.00, '2024-01-20');

SELECT *FROM payment;

-- INNER JOIN
SELECT f.name, f.mobile_num, p.amount, p.payment_date
FROM flatmate f
INNER JOIN payment p ON f.mobile_num = p.mobile_num;

-- FULL OUTER JOIN
SELECT f.name, f.mobile_num, p.amount, p.payment_date
FROM flatmate f
LEFT JOIN payment p ON f.mobile_num = p.mobile_num

UNION

SELECT f.name, f.mobile_num, p.amount, p.payment_date
FROM flatmate f
RIGHT JOIN payment p ON f.mobile_num = p.mobile_num;


-- LEFT JOIN
SELECT f.name, f.mobile_num, p.amount, p.payment_date
FROM flatmate f
LEFT JOIN payment p ON f.mobile_num = p.mobile_num;


-- RIGHT JOIN
SELECT f.name, f.mobile_num, p.amount, p.payment_date
FROM flatmate f
RIGHT JOIN payment p ON f.mobile_num = p.mobile_num;



-- CROSS JOIN
SELECT f.name, f.mobile_num, p.amount, p.payment_date
FROM flatmate f
CROSS JOIN payment p;


