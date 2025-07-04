/*
=====================================================================================
SQL Script: Stored Procedures and Functions in Library Management System
=====================================================================================

📌 Objective:
    Demonstrate how to use CREATE PROCEDURE and CREATE FUNCTION
    - With parameters
    - With conditional logic

=====================================================================================
*/

-- 1️⃣ PROCEDURE: Add a new borrow record only if the book is available
CREATE PROCEDURE library_schema.sp_BorrowBook
    @book_id INT,
    @member_id INT,
    @borrow_date DATE
AS
BEGIN
    -- Check if the book is available
    IF EXISTS (
        SELECT 1 FROM library_schema.Books
        WHERE book_id = @book_id AND is_available = 1
    )
    BEGIN
        -- Insert borrow record
        INSERT INTO library_schema.Borrow (book_id, member_id, borrow_date)
        VALUES (@book_id, @member_id, @borrow_date);

        -- Mark book as unavailable
        UPDATE library_schema.Books
        SET is_available = 0
        WHERE book_id = @book_id;

        PRINT 'Book borrowed successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Book is currently not available.';
    END
END;
GO

-- 🧪 Example usage:
-- EXEC library_schema.sp_BorrowBook @book_id = 1, @member_id = 3, @borrow_date = '2024-06-30';



-- 2️⃣ FUNCTION: Get total number of books borrowed by a member
CREATE FUNCTION library_schema.fn_TotalBooksBorrowed
(
    @member_id INT
)
RETURNS INT
AS
BEGIN
    DECLARE @total INT;

    SELECT @total = COUNT(*) 
    FROM library_schema.Borrow 
    WHERE member_id = @member_id;

    RETURN @total;
END;
GO

-- 🧪 Example usage:
-- SELECT library_schema.fn_TotalBooksBorrowed(3) AS total_books_borrowed;

