/*
=====================================================================================
SQL Operations Script: Library Management System
=====================================================================================
Description:
    This script demonstrates common SQL operations such as UPDATE, DELETE, and 
    SELECT with WHERE clauses on the library_schema.
=====================================================================================
*/

-- 1. UPDATE: Set return date for a borrowed book
UPDATE library_schema.Borrow
SET return_date = '2024-06-26'
WHERE borrow_id = 1;

-- 2. DELETE: Remove a borrow record (e.g., deleted due to error or return cancellation)
DELETE FROM library_schema.Borrow
WHERE borrow_id = 3;

-- 3. SELECT: Find all books currently borrowed (not returned yet)
SELECT * FROM library_schema.Borrow
WHERE return_date IS NULL;

-- 4. SELECT: List all books published after the year 2000
SELECT * FROM library_schema.Books
WHERE publish_date > '2000-01-01';

-- 5. SELECT: Get all members who joined in June 2024
SELECT * FROM library_schema.Members
WHERE MONTH(join_date) = 6 AND YEAR(join_date) = 2024;
