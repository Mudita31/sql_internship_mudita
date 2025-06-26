/*
=====================================================================================
SQL Script: Data Extraction Queries for Library Management System
=====================================================================================

📌 Objective:
    Demonstrates SELECT operations with filters and sorting on a relational database 
    for a library system using Microsoft SQL Server.

🔧 Tables Used:
    - library_schema.Books
    - library_schema.Members
    - library_schema.Borrow

🧪 SQL Features Demonstrated:
    - SELECT *
    - SELECT specific columns
    - WHERE with AND, OR, LIKE, BETWEEN
    - ORDER BY
    - TOP (as SQL Server equivalent of LIMIT)
=====================================================================================
*/

-- 1. Select all columns from Books table
SELECT * FROM library_schema.Books;

-- 2. Select specific columns from Members
SELECT member_id, member_name, join_date
FROM library_schema.Members;

-- 3. Use WHERE to filter borrowed books that are not yet returned
SELECT * FROM library_schema.Borrow
WHERE return_date IS NULL;

-- 4. Combine WHERE with AND to filter specific borrowings
SELECT * FROM library_schema.Borrow
WHERE borrow_date >= '2024-06-20'
  AND member_id = 2;

-- 5. Use OR to find multiple conditions
SELECT * FROM library_schema.Members
WHERE member_name = 'Aarav Sharma'
   OR member_name = 'Isha Mehta';

-- 6. Use LIKE to search partial text
SELECT * FROM library_schema.Books
WHERE book_name LIKE '%Harry%';

-- 7. Use BETWEEN to filter publish dates
SELECT * FROM library_schema.Books
WHERE publish_date BETWEEN '2000-01-01' AND '2025-01-01';

-- 8. ORDER BY join date descending
SELECT * FROM library_schema.Members
ORDER BY join_date DESC;

-- 9. LIMIT number of results (SQLite syntax)
SELECT TOP 5 * 
FROM library_schema.Books
ORDER BY publish_date DESC;
