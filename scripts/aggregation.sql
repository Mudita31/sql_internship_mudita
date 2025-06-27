/*
=====================================================================================
SQL Script: Aggregates and Grouping in Library Management System
=====================================================================================

📌 Objective:
    Use aggregate functions and grouping to summarize data, analyze borrow patterns,
    and apply filters using HAVING.

🧪 SQL Features Demonstrated:
    - SUM(), COUNT(), AVG()
    - GROUP BY
    - HAVING
=====================================================================================
*/

-- 1. Count how many books each member has borrowed
SELECT 
    member_id,
    COUNT(borrow_id) AS total_books_borrowed
FROM library_schema.Borrow
GROUP BY member_id;

-- 2. Count total borrowings per book
SELECT 
    book_id,
    COUNT(borrow_id) AS times_borrowed
FROM library_schema.Borrow
GROUP BY book_id;

-- 3. Average borrow duration (in days) where return_date is not NULL
SELECT 
    member_id,
    AVG(DATEDIFF(DAY, borrow_date, return_date)) AS avg_borrow_duration
FROM library_schema.Borrow
WHERE return_date IS NOT NULL
GROUP BY member_id;

-- 4. List members who borrowed more than 1 book
SELECT 
    member_id,
    COUNT(borrow_id) AS total_books_borrowed
FROM library_schema.Borrow
GROUP BY member_id
HAVING COUNT(borrow_id) > 1;

-- 5. Count how many books each author has in the library
SELECT 
    A.author_name,
    COUNT(B.book_id) AS total_books
FROM library_schema.Authors A
JOIN library_schema.Books B ON A.author_id = B.author_id
GROUP BY A.author_name;
