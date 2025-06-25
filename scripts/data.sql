/*
=====================================================================================
Data Insertion Script: Library Schema
=====================================================================================
Purpose:
    This script inserts test data into all four tables of the 'library_schema' in the
    Library database: Authors, Books, Members, and Borrow.
=====================================================================================
*/

INSERT INTO library_schema.Authors (author_name)
VALUES 
('James Clear'),
('Harper Lee'),
('J.K. Rowling'),
('Stephen King'),
('George Orwell'),
('Jane Austen'),
('Anonymous Author');


INSERT INTO library_schema.Books (book_name, author_id, book_publication, publish_date)
VALUES
('Atomic Habits', 1, 'Penguin Random House', '2018-10-16'),
('To Kill a Mockingbird', 2, 'J.B. Lippincott & Co.', '1960-07-11'),
('Harry Potter', 3, 'Bloomsbury', '1997-06-26'),
('The Shining', 4, 'Doubleday', '1977-01-28'),
('1984', 5, 'Secker & Warburg', '1949-06-08'),
('Pride and Prejudice', 6, 'T. Egerton', '1813-01-28'),
('Mystery Tales', 7, 'Unknown Press', '2022-05-12');

INSERT INTO library_schema.Members (member_name, member_email, join_date)
VALUES 
('Aarav Sharma', 'aarav@example.com', '2024-06-01'),
('Isha Mehta', 'isha@example.com', '2024-06-15'),
('Karan Singh', 'karan@example.com', '2024-06-18'),
('Simran Kaur', 'simran@example.com', '2024-06-20'),
('Rohit Das', 'rohit@example.com', '2024-06-22'),
('Ananya Verma', 'ananya@example.com', '2024-06-25');


INSERT INTO library_schema.Borrow (book_id, member_id, borrow_date, return_date)
VALUES 
(1, 1, '2024-06-20', NULL),         -- Aarav borrows book 1
(2, 2, '2024-06-21', '2024-06-25'), -- Isha borrows book 2
(3, 3, '2024-06-22', NULL),         -- Karan borrows book 3
(4, 4, '2024-06-23', NULL),         -- Simran borrows book 4
(5, 5, '2024-06-24', '2024-06-28'), -- Rohit borrows book 5
(6, 6, '2024-06-25', NULL);         -- Ananya borrows book 6

