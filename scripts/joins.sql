/*
=====================================================================================
SQL Script: JOINs Demonstration in Library Management System
=====================================================================================

📌 Objective:
    Demonstrate all SQL JOIN types (INNER, LEFT, RIGHT, FULL, CROSS) to combine and 
    query data across multiple tables in a normalized library database.

🧪 JOIN Types Covered:
    - INNER JOIN
    - LEFT JOIN
    - RIGHT JOIN
    - FULL OUTER JOIN
    - CROSS JOIN
=====================================================================================
*/

-- 1. INNER JOIN: Get borrowed books with member and book details
SELECT 
    B.borrow_id,
    M.member_name,
    BK.book_name,
    B.borrow_date,
    B.return_date
FROM library_schema.Borrow B
INNER JOIN library_schema.Members M ON B.member_id = M.member_id
INNER JOIN library_schema.Books BK ON B.book_id = BK.book_id;

-- 2. LEFT JOIN: List all members, and their borrow records if any
SELECT 
    M.member_id,
    M.member_name,
    B.borrow_id,
    B.book_id
FROM library_schema.Members M
LEFT JOIN library_schema.Borrow B ON M.member_id = B.member_id;

-- 3. RIGHT JOIN: List all borrowed books, and include member info if any (not all DBs support RIGHT JOIN natively)
-- NOTE: SQL Server supports RIGHT JOIN
SELECT 
    M.member_name,
    B.borrow_id,
    BK.book_name
FROM library_schema.Borrow B
RIGHT JOIN library_schema.Members M ON B.member_id = M.member_id
JOIN library_schema.Books BK ON B.book_id = BK.book_id;

-- 4. FULL OUTER JOIN: Combine all books and borrow records — even if they don’t match
SELECT 
    BK.book_name,
    B.borrow_id,
    B.member_id,
    B.borrow_date
FROM library_schema.Books BK
FULL OUTER JOIN library_schema.Borrow B ON BK.book_id = B.book_id;

-- 5. CROSS JOIN: Get every combination of member and book
SELECT 
    M.member_name,
    BK.book_name
FROM library_schema.Members M
CROSS JOIN library_schema.Books BK;
