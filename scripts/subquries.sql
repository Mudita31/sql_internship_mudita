/*
=====================================================================================
SQL Script: Subquery Demonstration in Library Management System
=====================================================================================

📌 Objective:
    Use subqueries in SELECT, WHERE, and FROM clauses to demonstrate scalar, correlated,
    and nested logic using IN, EXISTS, and equality operators.

🧪 Techniques Demonstrated:
    - Scalar subquery
    - Subqueries using IN, EXISTS, =
    - Correlated subqueries
    - Derived tables (subquery in FROM)
=====================================================================================
*/

-- 1. Subquery in SELECT: Show each member with total books they borrowed
SELECT 
    member_id,
    member_name,
    (SELECT COUNT(*) 
     FROM library_schema.Borrow B 
     WHERE B.member_id = M.member_id) AS total_books_borrowed
FROM library_schema.Members M;

-- 2. Subquery in WHERE with IN: Get members who borrowed at least one book
SELECT * 
FROM library_schema.Members
WHERE member_id IN (
    SELECT DISTINCT member_id 
    FROM library_schema.Borrow
);

-- 3. Subquery in WHERE with EXISTS: Get books that have been borrowed at least once
SELECT * 
FROM library_schema.Books BK
WHERE EXISTS (
    SELECT 1 
    FROM library_schema.Borrow B 
    WHERE B.book_id = BK.book_id
);

-- 4. Scalar Subquery with Equality: List members who borrowed exactly 2 books
SELECT member_id, member_name
FROM library_schema.Members
WHERE (
    SELECT COUNT(*) 
    FROM library_schema.Borrow 
    WHERE Borrow.member_id = Members.member_id
) = 2;

-- 5. Correlated Subquery in WHERE: Get members who returned a book after more than 3 days
SELECT DISTINCT M.member_id, M.member_name
FROM library_schema.Members M
WHERE EXISTS (
    SELECT 1 
    FROM library_schema.Borrow B 
    WHERE B.member_id = M.member_id
    AND DATEDIFF(DAY, B.borrow_date, B.return_date) > 3
    AND B.return_date IS NOT NULL
);

-- 6. Subquery in FROM: Get average borrow duration by member (only for returned books)
SELECT 
    member_id,
    AVG(duration_days) AS avg_borrow_duration
FROM (
    SELECT 
        member_id,
        DATEDIFF(DAY, borrow_date, return_date) AS duration_days
    FROM library_schema.Borrow
    WHERE return_date IS NOT NULL
) AS borrow_durations
GROUP BY member_id;
