/*
=====================================================================================
SQL Script: View Creation and Usage in Library Management System
=====================================================================================

📌 Objective:
    Demonstrate how to create and use views to simplify complex queries and present
    focused data for reuse.

🧪 Features:
    - CREATE VIEW
    - SELECT from views
    - JOINs and filtering logic inside views
=====================================================================================
*/

-- 1. Create a view to show currently borrowed books with member and book details
CREATE VIEW library_schema.vw_CurrentBorrowedBooks AS
SELECT 
    B.borrow_id,
    BK.book_name,
    M.member_name,
    B.borrow_date,
    B.return_date
FROM library_schema.Borrow B
JOIN library_schema.Books BK ON B.book_id = BK.book_id
JOIN library_schema.Members M ON B.member_id = M.member_id
WHERE B.return_date IS NULL;
GO

-- 2. Create a view to summarize total borrow count per member
CREATE VIEW library_schema.vw_MemberBorrowSummary AS
SELECT 
    M.member_id,
    M.member_name,
    COUNT(B.borrow_id) AS total_borrowed
FROM library_schema.Members M
LEFT JOIN library_schema.Borrow B ON M.member_id = B.member_id
GROUP BY M.member_id, M.member_name;
GO

-- 3. Create a view to list books with their authors
CREATE VIEW library_schema.vw_BooksWithAuthors AS
SELECT 
    BK.book_id,
    BK.book_name,
    A.author_name,
    BK.book_publication,
    BK.publish_date
FROM library_schema.Books BK
JOIN library_schema.Authors A ON BK.author_id = A.author_id;
GO

-- =============================
-- 🔍 Sample SELECT queries on views
-- =============================

-- A. Show all currently borrowed books
SELECT * FROM library_schema.vw_CurrentBorrowedBooks;

-- B. List members who have borrowed more than 2 books
SELECT * 
FROM library_schema.vw_MemberBorrowSummary
WHERE total_borrowed > 2;

-- C. Get all books published before 2000
SELECT * 
FROM library_schema.vw_BooksWithAuthors
WHERE publish_date < '2000-01-01';
